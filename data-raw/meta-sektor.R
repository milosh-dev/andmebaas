## code to prepare `meta.sektor` dataset goes here
rm(list=ls())
library(readxl)

url <- "http://metaweb.stat.ee/get_classificator_file.htm?id=3799655&siteLanguage=ee"
local <- file.path(getwd(), "data-raw/sektorid.xls")

# Lae fail alla
download.file(url, local)

# loe andmed sisse
meta.sektor <- read_excel(path=local,
                      sheet = 1,  startRow=4)

#ev.emtak <- read.xlsx(xlsxFile=local,
#                      sheet = 1,
#                      startRow=4)

# Kustuta esimesed kaks rida
meta.sektor <- tail(meta.sektor, -2)

colnames(meta.sektor) <- c("kood", "sektor")

usethis::use_data(meta.sektor, overwrite = TRUE)
