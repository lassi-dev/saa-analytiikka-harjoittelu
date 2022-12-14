USE SaaDB
GO

DROP TABLE IF EXISTS [SAATIEDOT]

CREATE TABLE [SAATIEDOT](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [PAIKKA] [varchar](50) NOT NULL,
    [AIKA] [datetime] NOT NULL,
	[ILMANPAINE] [varchar](10),
	[SUHTEELLINEN_KOSTEUS] [varchar](10),
	[LAMPOTILA] [varchar](10),
	[LAMPOTILA_MAKSIMI] [varchar](10),
	[LAMPOTILA_MINIMI] [varchar](10),
	[TUULEN_SUUNTA] [varchar](10),
	[TUULEN_NOPEUS] [varchar](10),
	[TUULEN_NOPEUS_MAKSIMI] [varchar](10),
	[TUULEN_NOPEUS_MINIMI] [varchar](10)
 CONSTRAINT [SAATIEDOT_PK] PRIMARY KEY ([ID])
)

CREATE UNIQUE INDEX SAATIEDOT_PAIKKA_AIKA_UINDEX
   ON [SAATIEDOT] (PAIKKA, AIKA); 

GO

INSERT INTO [SAATIEDOT] (PAIKKA, AIKA)
SELECT DISTINCT
  PAIKKA,
  AIKA
FROM [SAATIEDOT_RAAKA];

--Ilmanpaine
UPDATE [SAATIEDOT]   
SET ILMANPAINE = [SAATIEDOT_RAAKA].PARAMETRIN_ARVO
FROM [SAATIEDOT_RAAKA]  
WHERE [SAATIEDOT_RAAKA].AIKA = [SAATIEDOT].AIKA
	AND [SAATIEDOT_RAAKA].PAIKKA = [SAATIEDOT].PAIKKA
	AND [SAATIEDOT_RAAKA].PARAMETRIN_NIMI = 'PA_PT1H_AV';

--Suhteellinen kosteus
UPDATE [SAATIEDOT]   
SET SUHTEELLINEN_KOSTEUS = [SAATIEDOT_RAAKA].PARAMETRIN_ARVO
FROM [SAATIEDOT_RAAKA]  
WHERE [SAATIEDOT_RAAKA].AIKA = [SAATIEDOT].AIKA
	AND [SAATIEDOT_RAAKA].PAIKKA = [SAATIEDOT].PAIKKA
	AND [SAATIEDOT_RAAKA].PARAMETRIN_NIMI = 'RH_PT1H_AV';

--Ilman lämpötila
UPDATE [SAATIEDOT]   
SET LAMPOTILA = [SAATIEDOT_RAAKA].PARAMETRIN_ARVO
FROM [SAATIEDOT_RAAKA]  
WHERE [SAATIEDOT_RAAKA].AIKA = [SAATIEDOT].AIKA
	AND [SAATIEDOT_RAAKA].PAIKKA = [SAATIEDOT].PAIKKA
	AND [SAATIEDOT_RAAKA].PARAMETRIN_NIMI = 'TA_PT1H_AV';

--Ilman lämpötila maksimi
UPDATE [SAATIEDOT]   
SET LAMPOTILA_MAKSIMI = [SAATIEDOT_RAAKA].PARAMETRIN_ARVO
FROM [SAATIEDOT_RAAKA]  
WHERE [SAATIEDOT_RAAKA].AIKA = [SAATIEDOT].AIKA
	AND [SAATIEDOT_RAAKA].PAIKKA = [SAATIEDOT].PAIKKA
	AND [SAATIEDOT_RAAKA].PARAMETRIN_NIMI = 'TA_PT1H_MA';
	
--Ilman lämpötila minimi
UPDATE [SAATIEDOT]   
SET LAMPOTILA_MINIMI = [SAATIEDOT_RAAKA].PARAMETRIN_ARVO
FROM [SAATIEDOT_RAAKA]  
WHERE [SAATIEDOT_RAAKA].AIKA = [SAATIEDOT].AIKA
	AND [SAATIEDOT_RAAKA].PAIKKA = [SAATIEDOT].PAIKKA
	AND [SAATIEDOT_RAAKA].PARAMETRIN_NIMI = 'TA_PT1H_MI';

--Tuulen suunta
UPDATE [SAATIEDOT]   
SET TUULEN_SUUNTA = [SAATIEDOT_RAAKA].PARAMETRIN_ARVO
FROM [SAATIEDOT_RAAKA]  
WHERE [SAATIEDOT_RAAKA].AIKA = [SAATIEDOT].AIKA
	AND [SAATIEDOT_RAAKA].PAIKKA = [SAATIEDOT].PAIKKA
	AND [SAATIEDOT_RAAKA].PARAMETRIN_NIMI = 'WD_PT1H_AV';

--Tuulen nopeus
UPDATE [SAATIEDOT]   
SET TUULEN_NOPEUS = [SAATIEDOT_RAAKA].PARAMETRIN_ARVO
FROM [SAATIEDOT_RAAKA]  
WHERE [SAATIEDOT_RAAKA].AIKA = [SAATIEDOT].AIKA
	AND [SAATIEDOT_RAAKA].PAIKKA = [SAATIEDOT].PAIKKA
	AND [SAATIEDOT_RAAKA].PARAMETRIN_NIMI = 'WS_PT1H_AV';

--Tuulen nopeus maksimi
UPDATE [SAATIEDOT]   
SET TUULEN_NOPEUS_MAKSIMI = [SAATIEDOT_RAAKA].PARAMETRIN_ARVO
FROM [SAATIEDOT_RAAKA]  
WHERE [SAATIEDOT_RAAKA].AIKA = [SAATIEDOT].AIKA
	AND [SAATIEDOT_RAAKA].PAIKKA = [SAATIEDOT].PAIKKA
	AND [SAATIEDOT_RAAKA].PARAMETRIN_NIMI = 'WS_PT1H_MA';

--Tuulen nopeus minimi
UPDATE [SAATIEDOT]   
SET TUULEN_NOPEUS_MINIMI = [SAATIEDOT_RAAKA].PARAMETRIN_ARVO
FROM [SAATIEDOT_RAAKA]  
WHERE [SAATIEDOT_RAAKA].AIKA = [SAATIEDOT].AIKA
	AND [SAATIEDOT_RAAKA].PAIKKA = [SAATIEDOT].PAIKKA
	AND [SAATIEDOT_RAAKA].PARAMETRIN_NIMI = 'WS_PT1H_MI';

GO