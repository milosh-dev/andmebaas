## code to prepare `meta.emtak` dataset goes here
library(tidyverse)

local <- file.path(getwd(), "data-raw/EMTAK_2008.csv")
meta.emtak <- read.csv2(local, sep = ",", fileEncoding = "utf8")

# Kasuta üksnes esimest kolme rida
meta.emtak <- meta.emtak[1:3]

meta.emtak <- as_tibble(meta.emtak)

colnames(meta.emtak) <- c('kood', 'vanem', 'nimi')

# Vaheta UTF-8 Latin 1 vastu
Encoding(meta.emtak$nimi) <- "UTF-8"
meta.emtak$nimi <- iconv(
  meta.emtak$nimi,
  "UTF-8",
  "UTF-8"
)

# Tegemist on faktoriga
meta.emtak$kood <- as_factor(meta.emtak$kood)
meta.emtak$vanem <- as_factor(meta.emtak$vanem)


usethis::use_data(meta.emtak, overwrite = TRUE)
