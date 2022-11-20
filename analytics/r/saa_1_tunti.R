#install.packages(ggplot2)
#install.packages("odbc")

library(ggplot2)
library(odbc)
library(dplyr)

data_conn <- DBI::dbConnect(odbc::odbc(), "DATASOURCE", database = "SaaDB")

# Harjoittelu mielessä vältetään SQL:ää

saa_data <- dplyr::tbl(data_conn, "SAA_1H")

# Listataan paikat
saa_data %>% distinct(PAIKKA)

paikka_rajaus <- "xx.xxxxx xx.xxxxx "
aika_alku <- '2021-12-01 00:00:00.00'
aika_loppu <- '2021-12-31 23:00:00.00'

# Rajataan tiettyyn paikkaan ja aikaan
saa_data <- dplyr::tbl(data_conn, "SAA_1H") %>% 
                    filter(PAIKKA == paikka_rajaus
                          & AIKA >= aika_alku
                          & AIKA <= aika_loppu) %>%
                    select(ID, AIKA, LAMPOTILA, LAMPOTILA_MAKSIMI, LAMPOTILA_MINIMI) %>%
                    arrange(AIKA)

show_query(saa_data)

saa <- collect(saa_data)

head(saa)
