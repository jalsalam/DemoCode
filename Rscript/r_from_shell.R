#!/usr/bin/env Rscript

writeLines("Hello my friend!")

#execute from shell: (requires hash-bang line at start of file)
#./r_from_shell.R

#Or:
#Rscript r_from_shell.R

#note that PATH must have Rscript? I'm a little confused by what /usr/bin/env is doing

#note: there seems to be slightly different behavior for a terminal run from Rstudio versus the staight Git-Bash, in that the .Rprofile for the user is being show from the RStudio terminal, but I am not seeing the line printed from the bare Git-Bash.

