#install.packages(ggplot2)
#install.packages("odbc")

library(ggplot2)
library(RODBC)
library(odbc)

data_conn <- DBI::dbConnect(odbc::odbc(), "DATASOURCE", database = "SaaDB")

# Harjoittelu mielessä vältetään SQL:ää

saa_data <- dplyr::tbl(data_conn, "SAA_1H")

# Listataan paikat
saa_data %>% distinct(PAIKKA)
