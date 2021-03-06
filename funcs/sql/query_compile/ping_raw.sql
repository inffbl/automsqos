select Sessions.SessionId, 
TestInfo.TestId, 
NetworkInfo.Operator as 'Serving Operator', 
NetworkInfo.HomeOperator as 'Home Operator', 
TestInfo.Technology, 
FileList.CallingModule, 
FileList.ASideDevice, 
Convert(varchar, TestInfo.StartTime, 104) as 'msgDate', 
Convert(varchar, TestInfo.StartTime, 108) as 'msgTime', 
FileList.CollectionName, 
FileList.TestDescription, 
FileList.Zone, 
Round(Convert(float, vResultsKPI.Duration), 3), 
vResultsKPI.Value2 from vSessionsTechnologyAll Sessions
JOIN FileList ON FileList.FileId = [Sessions].FileId
JOIN NetworkInfo ON Networkinfo.NetworkId = [Sessions].NetworkId
JOIN vResultsKPI ON vResultsKPI.SessionId = [Sessions].SessionId and vResultsKPI.KPIID = 21000
JOIN [vTestInfoTechnologyAll] Testinfo ON TestInfo.TestId = vResultsKPI.TestId and 
     TestInfo.valid = 1 and [Sessions].Valid = 1