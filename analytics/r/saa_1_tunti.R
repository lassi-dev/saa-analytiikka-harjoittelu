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

# Haetaan data koneen muistiin
saa <- as.data.frame(saa_data)

head(saa)
sapply(saa, class)

saa$LAMPOTILA <- as.numeric(saa$LAMPOTILA)
saa$LAMPOTILA_MAKSIMI <- as.numeric(saa$LAMPOTILA_MAKSIMI)
saa$LAMPOTILA_MINIMI <- as.numeric(saa$LAMPOTILA_MINIMI)

head(saa)
sapply(saa, class)


ggplot(data=saa, aes(x=AIKA, y=LAMPOTILA)) +
  geom_line(color="red") +
  labs(
    title = "Lämpötila",
    subtitle = "Joulukuu 2021",
    caption = "Lämpötilan keskiarvo tunneittain joulukuussa 2021. (Ilmatieteenlaitos, 11/2022)"
  )


#Tehdään taulukko lämpötilamittaustulosten lukumääristä

lampotila_bar <- ggplot(data=saa, aes(x=round(LAMPOTILA))) +
  geom_bar(fill="light blue") +
  theme_dark() + 
  geom_vline(xintercept=mean(saa$LAMPOTILA), color="red") + 
  geom_vline(xintercept=median(saa$LAMPOTILA), color="dark red")       

lampotila_bar       
