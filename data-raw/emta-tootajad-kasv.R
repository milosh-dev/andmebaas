## code to prepare `emta.tootajad.kasv` dataset goes here
rm(list=ls())
library(tidyverse)
library(RcppRoll)

load("data/emta.andmebaas.rda")

# Andmed
data <- emta.andmebaas %>%
  select(Kuupäev, Registrikood, Töötajad, Tööjõumaksud)

# Vähenda kasutatavat mälumahtu
rm(emta.andmebaas)

# Kui palju töötajaid on vähendatud
emta.tootajad.kasv <- data %>%
  group_by(Registrikood) %>%
  mutate (Töötajate.kasv = 100 * (Töötajad / lag(Töötajad, n = 4) -1)) %>%
  drop_na() %>%
  mutate (Töötasu.kasv = 100 * (Tööjõumaksud / lag(Tööjõumaksud, n = 4) -1)) %>%
  ungroup() %>%
  select(Kuupäev, Registrikood, Töötajate.kasv, Töötasu.kasv)


usethis::use_data(emta.tootajad.kasv, overwrite = TRUE)
