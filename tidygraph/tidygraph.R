#tidygraph demo

library(tidyverse)
library(tidygraph)
library(ggraph)

set.seed(1001)

the_nodes <- tibble(
  node_id = c(1, 2, 3, 4, 5, 6, 7, 8),
  color   = c(rep("red", 5), rep("blue", 3)),
  value   = round(runif(8), 1)
)

the_edges <- tibble(
  from = c(1, 1, 2, 2, 3, 3, 3),
  to   = c(2, 3, 4, 5, 6, 7, 8)
)

gr <- tbl_graph(nodes = the_nodes, edges = the_edges) %>%
  activate(nodes) %>%
  mutate(n_lab = map_dfs_back_dbl(root = 1, .f = function(node, path, ...) {sum(.N()$value[c(node, path$node)]) }))

node

as_tibble(gr)$n_lab[[2]]


ggraph(gr, layout = 'dendrogram') +
  geom_edge_diagonal() +
  geom_node_point(mapping = aes(size=5, color = color)) +
  geom_node_text(mapping = aes(label = n_lab)) +
  theme_minimal()

gr
