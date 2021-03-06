select  f.CollectionName as SOURCE, 
n.CId as CID	,
n.LAC	,
n.MCC,
n.MNC	,
n.Operator	 ,
n.CGI	,
n.technology	Technology,
p.longitude  Lon,
p.latitude	Lat,
l.SessionId,
l.TestId,
l.NetworkId,
f.Zone SystemName,
f.ASideDevice ADevice,
l.MsgTime MsgTime_lte,
n.MsgTime MsgTime,
l.PosId,
n.FileId, 
'' as BTSLon,
'' as BTSLat,
p.longitude  BTSLonDiff	, 
p.latitude	  BTSLatDiff,
'' BTSDist	,
p.longitude  BTS2LonDiff	, 
p.latitude	  BTS2LatDiff,
	''	BTS2Dist ,
p.longitude  BTS3LonDiff	, 
p.latitude	  BTS3LatDiff,			
'' BTS3Dist	,
'' BTSTech	,
'' FloorPlanName,
'' FloorPlanLevel ,
'' SessionIdLP	,
'' TestIdLP ,
'' PosIdLP	,
'' NetworkIdLP, 
 l.NumMeasuredCells,
--Str(Round(l.RSRP,1),10,1) ::float8 as RSRP,
convert(float,l.RSRP) as RSRP,
Convert(varchar,l.EARFCN) + ' ' + Convert(varchar,l.PhyCellId) as ChPSC,
--Str(Round(l.RSRQ,1),10,1) ::float8 as RSRQ,
convert(float,l.RSRQ) as RSRQ,
Convert(varchar,l.EARFCN) + ' ' + Convert(varchar,l.PhyCellId) as ChnPCI


		 
from LTEMeasurementReport l 
 left join   NetworkInfo n on  l.NetworkId=n.NetworkId  
 left join   "Position" p   on l.PosId =p.PosId  
 left join  FileList f on n.FileId =f.FileId