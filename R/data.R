################################################
# Impordib Statistikaameti leheküljelt ettevõtete EMTAK klassifikaatorid
# https://www.stat.ee/et/esita-andmeid/andmete-esitamisest/ettevotete-uuringud/majandusuksuste-klassifitseerimise-abiinfo
#
#' @author Raoul Lättemäe, jaanuar 2021
################################################

# Uue andmebaasi loomine
# usethis::use_data_raw(name = 'ev.emtak')

# Andmebaasi kirjelduse loomine
# sinew::makeOxygen(andmebaas::ev.emtak)

#' @title Ettevõtted EMTAK koodide järgi
#' @description Ettevõtete andmed seotud EMTAK koodidega
#' @format A data frame with 206314 rows and 9 variables:
#' @source https://www.stat.ee/et/esita-andmeid/andmete-esitamisest/ettevotete-uuringud/majandusuksuste-klassifitseerimise-abiinfo
#' \describe{
#'   \item{\code{Registrikood}}{character Ettevõtte registrikood}
#'   \item{\code{Nimi}}{character Ettevõtte nimi}
#'   \item{\code{EMTAK.1}}{integer EMTAK 1. taseme kood}
#'   \item{\code{EMTAK.2}}{integer EMTAK 2. taseme kood}
#'   \item{\code{Klassifikaator}}{integer ESA institutsionaalne sektor. Koodid on toodud andmetabelis "meta.sektor" }
#'   \item{\code{Emitent}}{integer Emitendi kood. Koodid on toodud andmetabelis "meta.emitent"}
#'   \item{\code{Registreeritud}}{double Ettevõtte registreerimiskuupäev}
#'   \item{\code{Kustutatud}}{double Ettevõtte kustutamise kuupäev}
#'   \item{\code{Muudatus}}{double Ettevõtte andmete muutmise kuupäev}
#'}
#' @details Andmebaas Ettevõtete EMTAK koodidega
"ev.emtak"

#' @title Emitendid/Kliendid
#' @description Emitentide/Klientide koodid
#' @format A data frame with 15 rows and 2 variables:
#' \describe{
#'   \item{\code{kood}}{double ev.emtak failis kasutatav emitendi/kliendi kood}
#'   \item{\code{emitent}}{character Emitendi kirjeldus}
#'}
#' @source https://www.riigiteataja.ee/akt/103062014001
#' @details Emitentide koodide kirjelds
"meta.emitent"

#' @title Sektorid
#' @description ESA: institutsionaalsete sektorite (S) klassifikaator 2010.
#' @format A data frame with 96 rows and 2 variables:
#' \describe{
#'   \item{\code{kood}}{character sektori kood}
#'   \item{\code{sektor}}{character Sektori nimetus}
#'}
#' @source http://metaweb.stat.ee/view_xml_linear.htm?id=3798567&siteLanguage=ee
#' @details ESA: institutsionaalsete sektorite (S) klassifikaator 2010.
"meta.sektor"

#' @title EMTAK 2008
#' @description EMTAK 2008 koodide kirjeldus
#' @format A data frame with 1771 rows and 3 variables:
#' \describe{
#'   \item{\code{kood}}{character EMTAK 2008 kood}
#'   \item{\code{vanem}}{character EMTAK 2008 kood, mille alla konkreetne kood kuulub}
#'   \item{\code{nimi}}{character Tegevusala kirjeldus}
#'}
#' @details EMTAK 2008 koodid
"meta.emtak"

#' @title Äriregister
#' @description Äriregistri andmed (27.01.2021 seisuga)
#' @format A data frame with 311205 rows and 7 variables:
#' \describe{
#'   \item{\code{Nimi}}{character Ärinimi}
#'   \item{\code{Registrikood}}{character Registrikood}
#'   \item{\code{Staatus}}{integer Staatus koodina}
#'   \item{\code{Tüüp}}{integer Äriühingu tüüp}
#'   \item{\code{Staatus.tekstina}}{integer Staatus tekstina}
#'   \item{\code{Asutamiskuupäev}}{double Asutamiskuupäev}
#'   \item{\code{Asukoht}}{integer Asukoha kood}
#'}
#' @details Äriregistri andmed kõigi äriregistrisse kantud ettevõtete kohta
"ev.register"

#' @title EMTA andmebaas
#' @description EMTA avalik maksulaekumiste andmebaas
#' @format A data frame with 2116029 rows and 17 variables:
#' \describe{
#'   \item{\code{Kuupäev}}{double Kuupäev}
#'   \item{\code{aasta}}{integer Aasta}
#'   \item{\code{kv}}{integer Kvartal}
#'   \item{\code{Registrikood}}{character Ettevõtte registrikood}
#'   \item{\code{Nimi}}{character Ettevõtte nimi}
#'   \item{\code{Liik}}{integer Ettevõtte tüüp}
#'   \item{\code{KMKR}}{integer Kas on käibemaksukohuslane}
#'   \item{\code{EMTAK.kood}}{integer EMTAK 1 taseme kood}
#'   \item{\code{EMTAK}}{integer EMTAK 1 taseme kirjeldus}
#'   \item{\code{Omavalitsus}}{integer Omavalitsus}
#'   \item{\code{Maakond}}{integer Maakond}
#'   \item{\code{Vald}}{integer Vald}
#'   \item{\code{Linn}}{boolean Kas on linn (jah/ei)}
#'   \item{\code{Maksud}}{double Tasutud maksud}
#'   \item{\code{Tööjõumaksud}}{double Tasutud tööjõumaksud}
#'   \item{\code{Käive}}{double Käive}
#'   \item{\code{Töötajad}}{double Töötajate arv}
#'}
#' @details EMTA avalike andmete põhine maksulaekumiste andmebaas
"emta.andmebaas"

#' @title EMTA tööturu andmed
#' @description EMTA maksulaekumiste andmed tööturu kohta
#' @format A data frame with 838480 rows and 4 variables:
#' \describe{
#'   \item{\code{Kuupäev}}{double Vaatluse kuupäev}
#'   \item{\code{Registrikood}}{character Ettevõtte registrikood}
#'   \item{\code{Töötajate.kasv}}{double Töötajate arvu % muutus võrreldes eelmise aastaga}
#'   \item{\code{Töötasu.kasv}}{double Tööjõumaksude % muutus võrreldes eelmise aastaga}
#'}
#' @details DETAILS
"emta.tootajad.kasv"

#' @title EMTA käibemuudu andmed
#' @description EMTA müügikäibe andmed
#' @format A data frame with 928496 rows and 3 variables:
#' \describe{
#'   \item{\code{Kuupäev}}{double Vaatluse kuupäev}
#'   \item{\code{Registrikood}}{character Ettevõtte registrikood}
#'   \item{\code{Käibekasv}}{double Käibe % muutus võrreldes eelmise aastaga}
#'}
#' @details DETAILS
"emta.kaibed.kasv"
