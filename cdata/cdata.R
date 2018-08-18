# cdata

# install.packages("cdata")

library(tidyverse)
library(cdata)

tall_data <- tibble(
  id    = c(rep("usa", 6), rep("canada", 6)),
  year  = rep(seq(1990, 2015, 5), 2),
  value = list(1, 2, "Hello!", "Yes", 5, 6, 7, 8, "nine" , 10, 11, "twelve")
) %>%
  spread(year, value) %>%
  gather("year", "value", -id)

wide_data <- spread(tall_data, year, value)

wd2 <- pivot_to_rowrecs(tall_data, 
                 columnToTakeKeysFrom = "year",
                 columnToTakeValuesFrom = "value",
                 rowKeyColumns = "id")

all.equal(wide_data, wd2)

cT <- build_pivot_control(tall_data,
                          columnToTakeKeysFrom = "year",
                          columnToTakeValuesFrom = "value")

wd3 <- blocks_to_rowrecs(tall_data, controlTable = cT, keyColumns = "id")

all.equal(wide_data, wd3)

td2 <- rowrecs_to_blocks(wide_data, controlTable = cT, columnsToCopy = "id")

all.equal(tall_data, td2)

