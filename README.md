# Sää - Analytiikka harjoittelua
Data analytiikka harjoittelua Ilmatieteenlaitoksen säädatan avulla.
Projekti koostuu 2 osiosta: Ilmatieteenlaitoksen API:sta saatavan datan muokkauksesta käytettävään muotoon käyttäen ELT-prosessia, ja analytiikkaan sekä muuhun tilastotieteeseen liittyvään harjoitteluun. Koodi on järjestetty Jupyter Notebookilla luettavuuden parantamiseksi. Analytiikka osiolle on oma muistikirjansa, ja ELT-prosessille omansa.

Säätiedot haetaan Ilmatieteenlaitoksen API:sta XML-muodossa ja tallennetaan työasemalla sijaitsevaan SQL Serveriin. Tämän jälkeen tehdään erillaisia harjoituksia R ohjelmointikielellä. ELT prosessi on myös toteutettu R-kielellä mahdollisimman pitkälle syntaksiin ja erilaisiin ominaisuuksiin tottumisen tukemiseksi. ELT-prosessin voi hoitaa myös T-SQL:llä suoraan SQL Server tietokannassa. T-SQL on suorituskyvyltään nopeampaa, mikä yhden vuoden data määrillä vaikuttaa varsin tarpeettomalta, mutta voi olla hyödyksi, jos päättää käyttää dataa useamman vuoden ajalta. 

## Selitteet

|Koodi         |Selite                           |Taulun attribuutti          |Yksikkö|
|--------------|---------------------------------|----------------------------|-------|
|PA_PT1H_AV    |Ilmanpaine keskiarvo             |ilmanpaine                  |hPa    |
|PRA_PT1H_A    |Sademäärä                        |sademaara                   |mm     |
|PRI_PT1H_M    |Sateen suurin intensiteetti      |sade_intensiteetti_maksimi  |mm/h   |
|RH_PT1H_AV    |Suhteellinen kosteus keskiarvo   |suhteellinen_kosteus        |%      |
|TA_PT1H_AV    |Ilman lämpötila keskiarvo        |lampotila                   |degC   |
|TA_PT1H_MA    |Ilman lämpötila maksimi          |lampotila_maksimi           |degC   |
|TA_PT1H_MI    |Ilman lämpötila minimi           |lampotila_minimi            |degC   |
|WAWA_PT1H_    |Vallitseva sää                   |saa                         |       |
|WD_PT1H_AV    |Tuulen suunta keskiarvo          |tuulen_suunta               |deg    |
|WS_PT1H_AV    |Tuulen nopeus keskiarvo          |tuulen_nopeus               |m/s    |
|WS_PT1H_MA    |Tuulen nopeus maksimi            |tuulen_nopeus_maksimi       |m/s    |
|WS_PT1H_MI    |Tuulen nopeus minimi             |tuulen_nopeus_minimi        |m/s    |
