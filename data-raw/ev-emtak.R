################################################
# Impordib Statistikaameti leheküljelt ettevõtete EMTAK klassifikaatorid
# https://www.stat.ee/et/esita-andmeid/andmete-esitamisest/ettevotete-uuringud/majandusuksuste-klassifitseerimise-abiinfo
#
# Autor: Raoul Lättemäe, jaanuar 2021
################################################

library(openxlsx)
library(tidyverse)

# Andmete asukoht
# https://www.stat.ee/et/esita-andmeid/andmete-esitamisest/ettevotete-uuringud/majandusuksuste-klassifitseerimise-abiinfo
url <- "https://www.stat.ee/sites/default/files/2021-01/%C3%9Cksuste%20nimekiri%2001.12.2020_revid.6.1.2021.xlsx"
local <- file.path(getwd(), "data-raw/klassifikaatorid.xlsx")

# Lae fail alla
download.file(url, local)

# loe andmed sisse
ev.emtak <- read.xlsx(xlsxFile=local,
                         sheet = 1,
                         startRow=1)

# Korrasta andmed
ev.emtak <- as_tibble(ev.emtak)
colnames(ev.emtak) <- c("Registrikood", "Nimi", "EMTAK.1", "EMTAK.2", "Klassifikaator", "Emitent", "Registreeritud", "Kustutatud", "Muudatus")

ev.emtak$EMTAK.1 <- as.factor(ev.emtak$EMTAK.1)
ev.emtak$EMTAK.2 <- as.factor(ev.emtak$EMTAK.2)
ev.emtak$Klassifikaator <- as.factor(ev.emtak$Klassifikaator)
ev.emtak$Emitent <- as.factor(ev.emtak$Emitent)
ev.emtak$Registreeritud <- as.Date(ev.emtak$Registreeritud, origin = "1899-12-30")
ev.emtak$Kustutatud <- as.Date(ev.emtak$Kustutatud, origin = "1899-12-30")
ev.emtak$Muudatus <- as.Date(ev.emtak$Muudatus, origin = "1899-12-30")
#ev.emtak$EMTAK.1.nimi <- ev.emtak$EMTAK.1


usethis::use_data(ev.emtak, overwrite = TRUE)
