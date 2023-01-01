USE SaaDB
GO

DECLARE @xmlSaaData XML;
SET @xmlSaaData = (
  SELECT XML from SAATIEDOT_XML AS xmlSaaData where ID = 12
);

WITH XMLNAMESPACES ('http://www.opengis.net/wfs/2.0' as wfs, 'http://xml.fmi.fi/schema/wfs/2.0' as BsWfs, 'http://www.opengis.net/gml/3.2' as gml )
INSERT INTO [SAATIEDOT_RAAKA] (PAIKKA, AIKA, PARAMETRIN_NIMI, PARAMETRIN_ARVO)
SELECT
  ref.value('BsWfs:Location[1]/gml:Point[1]/gml:pos[1]', 'VARCHAR(30)') AS PAIKKA ,
  ref.value('BsWfs:Time[1]', 'datetime') AS AIKA,
  ref.value('BsWfs:ParameterName[1]', 'VARCHAR(10)') AS PARAMETRIN_NIMI,
  ref.value('BsWfs:ParameterValue[1]', 'VARCHAR(10)') AS PARAMETRIN_ARVO
FROM @xmlSaaData.nodes('/wfs:FeatureCollection/wfs:member/BsWfs:BsWfsElement') 
xmlData( ref );

GO