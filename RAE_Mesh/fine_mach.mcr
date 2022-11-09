#!MC 1410
$!VarSet |NUMLOOP| =0
$!LOOP 500
$!ReadDataSet  '"STANDARDSYNTAX" "1.0" "FILENAME_FILE" "C:\Users\23844\Desktop\airfoil_mesh_finally\RAE_Mesh\fine\MMOE_MFM_test_rae|NUMLOOP|_flow.szplt"'
  DataSetReader = 'Tecplot Subzone Data Loader'
  ReadDataOption = New
  ResetStyle = No
  AssignStrandIDs = No
  InitialPlotType = Automatic
  InitialPlotFirstZoneOnly = No
  AddZonesToExistingStrands = No
  VarLoadMode = ByName
$!WriteDataSet  "C:\Users\23844\Desktop\airfoil_mesh_finally\RAE_Mesh\RAE_fine_mach\|NUMLOOP|.dat"
  IncludeText = No
  IncludeGeom = No
  IncludeCustomLabels = No
  IncludeDataShareLinkage = Yes
  VarList =  [1-2,9]
  Binary = No
  UsePointFormat = Yes
  Precision = 9
  TecplotVersionToWrite = TecplotCurrent
$!VarSet |NUMLOOP| += 1
$!ENDLOOP
$!Quit
