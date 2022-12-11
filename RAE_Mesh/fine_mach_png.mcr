#!MC 1410
$!VarSet |NUMLOOP| =0
$!LOOP 500
$!ReadDataSet  '"C:\Users\xuliji\Desktop\airfoil_mesh_finally\RAE_Mesh\RAE_fine_mach\|NUMLOOP|.dat" '
  ReadDataOption = New
  ResetStyle = No
  VarLoadMode = ByName
  AssignStrandIDs = Yes
  VarNameList = '"x" "y" "Mach"'
$!Pick AddAtPosition
  X = 2.16883821933
  Y = 2.36074918567
  ConsiderStyle = Yes
$!TwoDAxis YDetail{ShowAxis = No}
$!TwoDAxis XDetail{ShowAxis = No}
$!GlobalRGB RedChannelVar = 3
$!GlobalRGB GreenChannelVar = 3
$!GlobalRGB BlueChannelVar = 3
$!SetContourVar 
  Var = 3
  ContourGroup = 1
  LevelInitMode = ResetToNice
$!SetContourVar 
  Var = 3
  ContourGroup = 2
  LevelInitMode = ResetToNice
$!SetContourVar 
  Var = 3
  ContourGroup = 3
  LevelInitMode = ResetToNice
$!SetContourVar 
  Var = 3
  ContourGroup = 4
  LevelInitMode = ResetToNice
$!SetContourVar 
  Var = 3
  ContourGroup = 5
  LevelInitMode = ResetToNice
$!SetContourVar 
  Var = 3
  ContourGroup = 6
  LevelInitMode = ResetToNice
$!SetContourVar 
  Var = 3
  ContourGroup = 7
  LevelInitMode = ResetToNice
$!SetContourVar 
  Var = 3
  ContourGroup = 8
  LevelInitMode = ResetToNice
$!FieldLayers ShowContour = Yes
$!ContourLevels New
  ContourGroup = 1
  RawData
19
0.1
0.15
0.2
0.25
0.3
0.35
0.4
0.45
0.5
0.55
0.6
0.65
0.7
0.75
0.8
0.85
0.9
0.95
1
$!GlobalContour 1  Legend{Show = No}
$!Pick DeselectAll
$!Pick AddAllInRect
  SelectText = Yes
  SelectGeoms = Yes
  SelectZones = Yes
  ConsiderStyle = Yes
  X1 = 5.58251900109
  X2 = 5.78230184582
  Y1 = 6.43458197611
  Y2 = 7.23371335505
$!FrameLayout XYPos{X = 0}
$!FrameLayout XYPos{Y = 0}
$!FrameLayout Height = 5
$!FrameLayout ShowBorder = No
$!ExportSetup ExportRegion = CurrentFrame
$!ExportSetup ImageWidth = 1036
$!ExportSetup ConvertTo256Colors = Yes
$!ExportSetup ExportFName = 'C:/Users/xuliji/Desktop/airfoil_mesh_finally/RAE_Mesh/RAE_fine_mach_png/|NUMLOOP|.png'
$!Export 
  ExportRegion = CurrentFrame
$!VarSet |NUMLOOP| += 1
$!ENDLOOP
$!Quit
