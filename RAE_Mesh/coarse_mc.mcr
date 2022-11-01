#!MC 1410
$!VarSet |NUMLOOP| =0
$!LOOP 500
$!Pick AddAtPosition
  X = 6.81267474371
  Y = 1.33946877912
  ConsiderStyle = Yes
$!ReadDataSet  '"STANDARDSYNTAX" "1.0" "FILENAME_FILE" "C:\Users\23844\Desktop\airfoil_mesh_finally\RAE_Mesh\coarse\MMOE_MFM_test_rae|NUMLOOP|_flow.szplt"'
  DataSetReader = 'Tecplot Subzone Data Loader'
  ReadDataOption = New
  ResetStyle = No
  AssignStrandIDs = No
  InitialPlotType = Automatic
  InitialPlotFirstZoneOnly = No
  AddZonesToExistingStrands = No
  VarLoadMode = ByName
$!Pick AddAtPosition
  X = 4.18732525629
  Y = -0.405172413793
  ConsiderStyle = Yes
$!WriteDataSet  "C:\Users\23844\Desktop\airfoil_mesh_finally\RAE_Mesh\coarse_processed\|NUMLOOP|.dat"
  IncludeText = No
  IncludeGeom = No
  IncludeCustomLabels = No
  IncludeDataShareLinkage = Yes
  VarList =  [1-2,10]
  Binary = No
  UsePointFormat = Yes
  Precision = 9
  TecplotVersionToWrite = TecplotCurrent
$!VarSet |NUMLOOP| += 1
$!ENDLOOP
$!Quit
