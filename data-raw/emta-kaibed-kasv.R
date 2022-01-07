## code to prepare `emta.kaibed.kasv` dataset goes here
library(tidyverse)
library(RcppRoll)
rm(list=ls())
load("data/emta.andmebaas.rda")

data <- emta.andmebaas %>%
  select(Kuupäev, Registrikood, Käive)

rm(emta.andmebaas)

emta.kaibed.kasv <- data %>%
  group_by(Registrikood) %>%
  mutate (Aastakäive = roll_sumr(Käive, n = 4, align = "right", na.rm = TRUE)) %>%
#  mutate (Volatiilsus = roll_sd(Käive, n = 4, align = "right", na.rm = TRUE) / Aastakäive) %>%
  mutate (Käibekasv = 100 * (Käive / lag(Käive, n = 4) -1)) %>%
  ungroup() %>%
  select(Kuupäev, Registrikood, Käibekasv, Aastakäive) %>%
  drop_na()

usethis::use_data(emta.kaibed.kasv, overwrite = TRUE)

f <- data %>%
  group_by(Registrikood) %>%
  mutate (Aastakäive = roll_sumr(Käive, n = 4, align = "right", na.rm = TRUE)) %>%
  #  mutate (Volatiilsus = roll_sd(Käive, n = 4, align = "right", na.rm = TRUE) / Aastakäive) %>%
  mutate (Käibekasv = 100 * (Käive / lag(Käive, n = 4) -1)) %>%
  ungroup() %>%
  select(Kuupäev, Registrikood, Käibekasv, Aastakäive) %>%
  drop_na()


e <- data %>%
  group_by(Registrikood) %>%
  mutate (Aastakäive = roll_sumr(Käive, n = 4, na.rm = TRUE)) %>%
  mutate (Volatiilsus = roll_sdr(Käive, n = 4, na.rm = TRUE) / roll_sumr(Käive, n = 4, na.rm = TRUE)) %>%
  # mutate (Käibekasv = 100 * (Käive / lag(Käive, n = 4) -1)) %>%
  #filter(Kuupäev == as.Date('2019-12-31')) %>%
  ungroup() %>%
  drop_na()

