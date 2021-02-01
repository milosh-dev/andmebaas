################################################
# Impordib Äriregistri andmed äriregistri avaandmete baasist
#
# Autor: Raoul Lättemäe, juuli-august 2020
################################################

library(openxlsx)
library(tidyverse)

# Andmete asukoht
url <- "https://avaandmed.rik.ee/andmed/ARIREGISTER/ariregister_csv.zip"
local <- file.path(getwd(), "data-raw/ariregister_csv.zip")

# Lae fail alla
download.file(url, local)

# paki lahti
unzip(local, exdir = "data-raw")

# lae csv andmed
ev.register <- read_csv2("data-raw/ettevotja_rekvisiidid_2021-01-27.csv")

# Kustuta pakkimata andmed
file.remove("data-raw/ettevotja_rekvisiidid_2021-01-27.csv")


ev.register <- as_tibble(ev.register)
ev.register <- ev.register %>%
  select(nimi, ariregistri_kood, ettevotja_staatus, ettevotja_oiguslik_vorm, ettevotja_staatus_tekstina, ettevotja_esmakande_kpv, asukoha_ehak_kood)

colnames(ev.register) <- c("Nimi", "Registrikood", "Staatus", "Tüüp", "Staatus.tekstina", "Asutamiskuupäev", "Asukoht")

ev.register$Registrikood <- as.character(ev.register$Registrikood)
ev.register$Staatus <- as.factor(ev.register$Staatus)
ev.register$Tüüp <- as.factor(ev.register$Tüüp)
ev.register$Staatus.tekstina <- as.factor(ev.register$Staatus.tekstina)
ev.register$Asutamiskuupäev <- as.Date(ev.register$Asutamiskuupäev, format = c("%d.%m.%Y"))
ev.register$Asukoht <- as.factor(ev.register$Asukoht)

#Tühjenda liigsed atribuudid
attr(ev.register, "spec") <- NULL
attr(ev.register, "problems") <- NULL

usethis::use_data(ev.register, overwrite = TRUE)
