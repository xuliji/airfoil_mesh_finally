#!MC 1410
#!MC 1410
$!VarSet |NUMLOOP| =0
$!LOOP 500
$!ReadDataSet  '"C:\Users\xuliji\Desktop\airfoil_mesh_finally\RAE_Mesh\RAE_coarse_mach\|NUMLOOP|.dat" '
  ReadDataOption = New
  ResetStyle = No
  VarLoadMode = ByName
  AssignStrandIDs = Yes
  VarNameList = '"x" "y" "Mach"'
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
$!FieldLayers ShowContour = No
$!FieldLayers ShowContour = Yes
$!Pick AddAtPosition
  X = 2.0993485342
  Y = 2.23045602606
  ConsiderStyle = Yes
$!Pick AddAtPosition
  X = 2.22095548317
  Y = 2.30863192182
  ConsiderStyle = Yes
$!Pick AddAtPosition
  X = 2.17752442997
  Y = 3.36834961998
  ConsiderStyle = Yes
$!TwoDAxis YDetail{ShowAxis = No}
$!TwoDAxis XDetail{ShowAxis = No}
$!Pick AddAtPosition
  X = 2.17752442997
  Y = 3.27280130293
  ConsiderStyle = Yes
$!FrameLayout XYPos{X = 0}
$!FrameLayout XYPos{Y = 0}
$!FrameLayout Height = 5
$!FrameLayout ShowBorder = No
$!GlobalContour 1  Legend{Show = No}
$!ExportSetup ExportRegion = CurrentFrame
$!ExportSetup ImageWidth = 1036
$!ExportSetup ConvertTo256Colors = Yes
$!ExportSetup ExportFName = 'C:/Users/xuliji/Desktop/airfoil_mesh_finally/RAE_Mesh/RAE_coarse_mach_png/|NUMLOOP|.png'
$!Export 
  ExportRegion = CurrentFrame
$!VarSet |NUMLOOP| += 1
$!ENDLOOP
$!Quit
