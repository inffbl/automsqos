select
f.CollectionName as SOURCE, 
n.CId as CID	,
n.LAC	,
n.MCC,
n.MNC	,
n.HomeOperator 	Operator ,
n.CGI	,
n.technology	Technology,
p.longitude  Lon,
p.latitude	Lat,
p.SessionId,
p.TestId,
n.NetworkId,
f.Zone SystemName,
f.ASideDevice ADevice,
p.MsgTime Time,
p.PosId,
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
'' NetworkIdLP ,
--Str(Round(w.RxLev,1),10,1) ::float8 as RxLev,
convert(float,w.RxLev) as RxLev,
--Str(Round(w.RxQual,1),10,1) ::float8 as RxQual,
convert(float,w.RxQual) as RxQual,
Convert(varchar,w.BCCH) as ChNr

from FactGSMRadio w 
left join     NetworkInfo n    on  n.NetworkId=w.NetworkId  
 left join   "Position" p   on w.PosId =p.PosId 
left join   FileList f on n.FileId =f.FileId  