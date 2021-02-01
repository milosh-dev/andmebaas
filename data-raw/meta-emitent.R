## code to prepare `meta.emitent` dataset goes here
library(tidyverse)

# https://www.riigiteataja.ee/akt/103062014001
meta.emitent <- read_csv2("data-raw/emitendid.csv")

usethis::use_data(meta.emitent, overwrite = TRUE)
