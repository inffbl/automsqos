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
Str(Round(w.AggrRSCP,1),10,1)as AvgRSCP, 
Str(Round(w.AggrEcIo,1),10,1)as AvgEcIo,
w.numCells,
Convert(varchar,w.FreqDL) + ' ' + Convert(varchar,w.PrimScCode) as ChPSC

from   WCDMAActiveSet w 
left join NetworkInfo n on  w.NetworkId=n.NetworkId 
left join  "Position" p on w.PosId =p.PosId   
left join  FileList f on n.FileId =f.FileId 
  
; 