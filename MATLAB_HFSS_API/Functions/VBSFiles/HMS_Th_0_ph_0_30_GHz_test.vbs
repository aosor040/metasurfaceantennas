Dim oHfssApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule

Set oHfssApp  = CreateObject("AnsoftHfss.HfssScriptInterface")
Set oDesktop = oHfssApp.GetAppDesktop()
oDesktop.RestoreWindow
oDesktop.NewProject
Set oProject = oDesktop.GetActiveProject

oProject.InsertDesign "HFSS", "Design1", "DrivenModal", ""
Set oDesign = oProject.SetActiveDesign("Design1")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:X_sub", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "2mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:Y_sub", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "2mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:Z_sub", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "1mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "1mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:Cop_T", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.017mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:m", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "10"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:n", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "10"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:X_offset", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "2mm"))))

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "0", _
"YPosition:=", "0", _
"ZPosition:=", "0", _
"XSize:=", "m*X_sub", _
"YSize:=", "n*Y_sub", _
"ZSize:=", "Z_sub"), _
Array("NAME:Attributes", _
"Name:=", "RogersRTDuroid_5880", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap1_4", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.68533mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap1_4", "Y:=", "gap1_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap1_4", "Y:=", "gap1_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap1_4", "Y:=", "Y_sub-gap1_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap1_4", "Y:=", "Y_sub-gap1_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap1_4",   "Y:=", "gap1_4",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch1_4", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch1_4"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(1-1)*X_sub", _
"TranslateVectorY:=", "0+(4-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap1_5", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.70519mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap1_5", "Y:=", "gap1_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap1_5", "Y:=", "gap1_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap1_5", "Y:=", "Y_sub-gap1_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap1_5", "Y:=", "Y_sub-gap1_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap1_5",   "Y:=", "gap1_5",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch1_5", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch1_5"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(1-1)*X_sub", _
"TranslateVectorY:=", "0+(5-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap1_6", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40205mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap1_6", "Y:=", "gap1_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap1_6", "Y:=", "gap1_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap1_6", "Y:=", "Y_sub-gap1_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap1_6", "Y:=", "Y_sub-gap1_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap1_6",   "Y:=", "gap1_6",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch1_6", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch1_6"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(1-1)*X_sub", _
"TranslateVectorY:=", "0+(6-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap1_7", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40982mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap1_7", "Y:=", "gap1_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap1_7", "Y:=", "gap1_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap1_7", "Y:=", "Y_sub-gap1_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap1_7", "Y:=", "Y_sub-gap1_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap1_7",   "Y:=", "gap1_7",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch1_7", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch1_7"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(1-1)*X_sub", _
"TranslateVectorY:=", "0+(7-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap2_2", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.64979mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap2_2", "Y:=", "gap2_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_2", "Y:=", "gap2_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_2", "Y:=", "Y_sub-gap2_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_2", "Y:=", "Y_sub-gap2_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_2",   "Y:=", "gap2_2",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch2_2", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch2_2"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(2-1)*X_sub", _
"TranslateVectorY:=", "0+(2-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap2_3", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.70249mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap2_3", "Y:=", "gap2_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_3", "Y:=", "gap2_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_3", "Y:=", "Y_sub-gap2_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_3", "Y:=", "Y_sub-gap2_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_3",   "Y:=", "gap2_3",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch2_3", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch2_3"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(2-1)*X_sub", _
"TranslateVectorY:=", "0+(3-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap2_4", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.62408mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap2_4", "Y:=", "gap2_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_4", "Y:=", "gap2_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_4", "Y:=", "Y_sub-gap2_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_4", "Y:=", "Y_sub-gap2_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_4",   "Y:=", "gap2_4",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch2_4", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch2_4"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(2-1)*X_sub", _
"TranslateVectorY:=", "0+(4-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap2_5", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.5613mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap2_5", "Y:=", "gap2_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_5", "Y:=", "gap2_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_5", "Y:=", "Y_sub-gap2_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_5", "Y:=", "Y_sub-gap2_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_5",   "Y:=", "gap2_5",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch2_5", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch2_5"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(2-1)*X_sub", _
"TranslateVectorY:=", "0+(5-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap2_6", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.47722mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap2_6", "Y:=", "gap2_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_6", "Y:=", "gap2_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_6", "Y:=", "Y_sub-gap2_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_6", "Y:=", "Y_sub-gap2_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_6",   "Y:=", "gap2_6",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch2_6", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch2_6"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(2-1)*X_sub", _
"TranslateVectorY:=", "0+(6-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap2_7", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.43807mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap2_7", "Y:=", "gap2_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_7", "Y:=", "gap2_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_7", "Y:=", "Y_sub-gap2_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_7", "Y:=", "Y_sub-gap2_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_7",   "Y:=", "gap2_7",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch2_7", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch2_7"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(2-1)*X_sub", _
"TranslateVectorY:=", "0+(7-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap2_8", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40308mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap2_8", "Y:=", "gap2_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_8", "Y:=", "gap2_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_8", "Y:=", "Y_sub-gap2_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_8", "Y:=", "Y_sub-gap2_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_8",   "Y:=", "gap2_8",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch2_8", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch2_8"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(2-1)*X_sub", _
"TranslateVectorY:=", "0+(8-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap2_9", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.4253mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap2_9", "Y:=", "gap2_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_9", "Y:=", "gap2_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_9", "Y:=", "Y_sub-gap2_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_9", "Y:=", "Y_sub-gap2_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_9",   "Y:=", "gap2_9",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch2_9", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch2_9"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(2-1)*X_sub", _
"TranslateVectorY:=", "0+(9-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap3_2", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.70249mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap3_2", "Y:=", "gap3_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_2", "Y:=", "gap3_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_2", "Y:=", "Y_sub-gap3_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_2", "Y:=", "Y_sub-gap3_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_2",   "Y:=", "gap3_2",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch3_2", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch3_2"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(3-1)*X_sub", _
"TranslateVectorY:=", "0+(2-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap3_3", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.5613mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap3_3", "Y:=", "gap3_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_3", "Y:=", "gap3_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_3", "Y:=", "Y_sub-gap3_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_3", "Y:=", "Y_sub-gap3_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_3",   "Y:=", "gap3_3",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch3_3", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch3_3"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(3-1)*X_sub", _
"TranslateVectorY:=", "0+(3-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap3_4", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.44606mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap3_4", "Y:=", "gap3_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_4", "Y:=", "gap3_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_4", "Y:=", "Y_sub-gap3_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_4", "Y:=", "Y_sub-gap3_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_4",   "Y:=", "gap3_4",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch3_4", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch3_4"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(3-1)*X_sub", _
"TranslateVectorY:=", "0+(4-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap3_5", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.41131mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap3_5", "Y:=", "gap3_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_5", "Y:=", "gap3_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_5", "Y:=", "Y_sub-gap3_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_5", "Y:=", "Y_sub-gap3_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_5",   "Y:=", "gap3_5",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch3_5", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch3_5"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(3-1)*X_sub", _
"TranslateVectorY:=", "0+(5-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap3_6", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.68167mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap3_6", "Y:=", "gap3_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_6", "Y:=", "gap3_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_6", "Y:=", "Y_sub-gap3_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_6", "Y:=", "Y_sub-gap3_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_6",   "Y:=", "gap3_6",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch3_6", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch3_6"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(3-1)*X_sub", _
"TranslateVectorY:=", "0+(6-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap3_7", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.60946mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap3_7", "Y:=", "gap3_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_7", "Y:=", "gap3_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_7", "Y:=", "Y_sub-gap3_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_7", "Y:=", "Y_sub-gap3_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_7",   "Y:=", "gap3_7",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch3_7", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch3_7"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(3-1)*X_sub", _
"TranslateVectorY:=", "0+(7-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap3_8", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.47722mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap3_8", "Y:=", "gap3_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_8", "Y:=", "gap3_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_8", "Y:=", "Y_sub-gap3_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_8", "Y:=", "Y_sub-gap3_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_8",   "Y:=", "gap3_8",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch3_8", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch3_8"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(3-1)*X_sub", _
"TranslateVectorY:=", "0+(8-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap3_9", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40308mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap3_9", "Y:=", "gap3_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_9", "Y:=", "gap3_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_9", "Y:=", "Y_sub-gap3_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_9", "Y:=", "Y_sub-gap3_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_9",   "Y:=", "gap3_9",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch3_9", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch3_9"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(3-1)*X_sub", _
"TranslateVectorY:=", "0+(9-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap4_1", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.68533mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap4_1", "Y:=", "gap4_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_1", "Y:=", "gap4_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_1", "Y:=", "Y_sub-gap4_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_1", "Y:=", "Y_sub-gap4_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_1",   "Y:=", "gap4_1",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch4_1", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch4_1"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(4-1)*X_sub", _
"TranslateVectorY:=", "0+(1-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap4_2", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.62408mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap4_2", "Y:=", "gap4_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_2", "Y:=", "gap4_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_2", "Y:=", "Y_sub-gap4_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_2", "Y:=", "Y_sub-gap4_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_2",   "Y:=", "gap4_2",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch4_2", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch4_2"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(4-1)*X_sub", _
"TranslateVectorY:=", "0+(2-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap4_3", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.44606mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap4_3", "Y:=", "gap4_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_3", "Y:=", "gap4_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_3", "Y:=", "Y_sub-gap4_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_3", "Y:=", "Y_sub-gap4_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_3",   "Y:=", "gap4_3",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch4_3", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch4_3"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(4-1)*X_sub", _
"TranslateVectorY:=", "0+(3-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap4_4", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40222mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap4_4", "Y:=", "gap4_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_4", "Y:=", "gap4_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_4", "Y:=", "Y_sub-gap4_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_4", "Y:=", "Y_sub-gap4_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_4",   "Y:=", "gap4_4",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch4_4", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch4_4"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(4-1)*X_sub", _
"TranslateVectorY:=", "0+(4-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap4_5", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.43891mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap4_5", "Y:=", "gap4_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_5", "Y:=", "gap4_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_5", "Y:=", "Y_sub-gap4_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_5", "Y:=", "Y_sub-gap4_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_5",   "Y:=", "gap4_5",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch4_5", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch4_5"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(4-1)*X_sub", _
"TranslateVectorY:=", "0+(5-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap4_6", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.62248mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap4_6", "Y:=", "gap4_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_6", "Y:=", "gap4_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_6", "Y:=", "Y_sub-gap4_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_6", "Y:=", "Y_sub-gap4_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_6",   "Y:=", "gap4_6",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch4_6", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch4_6"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(4-1)*X_sub", _
"TranslateVectorY:=", "0+(6-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap4_7", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.70475mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap4_7", "Y:=", "gap4_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_7", "Y:=", "gap4_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_7", "Y:=", "Y_sub-gap4_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_7", "Y:=", "Y_sub-gap4_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_7",   "Y:=", "gap4_7",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch4_7", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch4_7"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(4-1)*X_sub", _
"TranslateVectorY:=", "0+(7-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap4_8", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.60946mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap4_8", "Y:=", "gap4_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_8", "Y:=", "gap4_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_8", "Y:=", "Y_sub-gap4_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_8", "Y:=", "Y_sub-gap4_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_8",   "Y:=", "gap4_8",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch4_8", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch4_8"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(4-1)*X_sub", _
"TranslateVectorY:=", "0+(8-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap4_9", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.43807mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap4_9", "Y:=", "gap4_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_9", "Y:=", "gap4_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_9", "Y:=", "Y_sub-gap4_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_9", "Y:=", "Y_sub-gap4_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_9",   "Y:=", "gap4_9",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch4_9", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch4_9"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(4-1)*X_sub", _
"TranslateVectorY:=", "0+(9-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap4_10", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40982mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap4_10", "Y:=", "gap4_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_10", "Y:=", "gap4_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap4_10", "Y:=", "Y_sub-gap4_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_10", "Y:=", "Y_sub-gap4_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap4_10",   "Y:=", "gap4_10",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch4_10", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch4_10"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(4-1)*X_sub", _
"TranslateVectorY:=", "0+(10-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap5_1", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.70519mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap5_1", "Y:=", "gap5_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_1", "Y:=", "gap5_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_1", "Y:=", "Y_sub-gap5_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_1", "Y:=", "Y_sub-gap5_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_1",   "Y:=", "gap5_1",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch5_1", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch5_1"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(5-1)*X_sub", _
"TranslateVectorY:=", "0+(1-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap5_2", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.5613mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap5_2", "Y:=", "gap5_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_2", "Y:=", "gap5_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_2", "Y:=", "Y_sub-gap5_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_2", "Y:=", "Y_sub-gap5_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_2",   "Y:=", "gap5_2",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch5_2", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch5_2"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(5-1)*X_sub", _
"TranslateVectorY:=", "0+(2-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap5_3", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.41131mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap5_3", "Y:=", "gap5_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_3", "Y:=", "gap5_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_3", "Y:=", "Y_sub-gap5_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_3", "Y:=", "Y_sub-gap5_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_3",   "Y:=", "gap5_3",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch5_3", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch5_3"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(5-1)*X_sub", _
"TranslateVectorY:=", "0+(3-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap5_4", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.43891mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap5_4", "Y:=", "gap5_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_4", "Y:=", "gap5_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_4", "Y:=", "Y_sub-gap5_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_4", "Y:=", "Y_sub-gap5_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_4",   "Y:=", "gap5_4",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch5_4", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch5_4"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(5-1)*X_sub", _
"TranslateVectorY:=", "0+(4-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap5_5", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.60688mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap5_5", "Y:=", "gap5_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_5", "Y:=", "gap5_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_5", "Y:=", "Y_sub-gap5_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_5", "Y:=", "Y_sub-gap5_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_5",   "Y:=", "gap5_5",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch5_5", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch5_5"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(5-1)*X_sub", _
"TranslateVectorY:=", "0+(5-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap5_6", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.44753mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap5_6", "Y:=", "gap5_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_6", "Y:=", "gap5_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_6", "Y:=", "Y_sub-gap5_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_6", "Y:=", "Y_sub-gap5_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_6",   "Y:=", "gap5_6",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch5_6", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch5_6"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(5-1)*X_sub", _
"TranslateVectorY:=", "0+(6-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap5_7", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.62248mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap5_7", "Y:=", "gap5_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_7", "Y:=", "gap5_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_7", "Y:=", "Y_sub-gap5_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_7", "Y:=", "Y_sub-gap5_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_7",   "Y:=", "gap5_7",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch5_7", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch5_7"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(5-1)*X_sub", _
"TranslateVectorY:=", "0+(7-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap5_8", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.68167mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap5_8", "Y:=", "gap5_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_8", "Y:=", "gap5_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_8", "Y:=", "Y_sub-gap5_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_8", "Y:=", "Y_sub-gap5_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_8",   "Y:=", "gap5_8",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch5_8", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch5_8"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(5-1)*X_sub", _
"TranslateVectorY:=", "0+(8-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap5_9", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.47722mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap5_9", "Y:=", "gap5_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_9", "Y:=", "gap5_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_9", "Y:=", "Y_sub-gap5_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_9", "Y:=", "Y_sub-gap5_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_9",   "Y:=", "gap5_9",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch5_9", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch5_9"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(5-1)*X_sub", _
"TranslateVectorY:=", "0+(9-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap5_10", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40205mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap5_10", "Y:=", "gap5_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_10", "Y:=", "gap5_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap5_10", "Y:=", "Y_sub-gap5_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_10", "Y:=", "Y_sub-gap5_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap5_10",   "Y:=", "gap5_10",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch5_10", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch5_10"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(5-1)*X_sub", _
"TranslateVectorY:=", "0+(10-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap6_1", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.70519mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap6_1", "Y:=", "gap6_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_1", "Y:=", "gap6_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_1", "Y:=", "Y_sub-gap6_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_1", "Y:=", "Y_sub-gap6_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_1",   "Y:=", "gap6_1",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch6_1", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch6_1"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(6-1)*X_sub", _
"TranslateVectorY:=", "0+(1-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap6_2", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.5613mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap6_2", "Y:=", "gap6_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_2", "Y:=", "gap6_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_2", "Y:=", "Y_sub-gap6_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_2", "Y:=", "Y_sub-gap6_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_2",   "Y:=", "gap6_2",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch6_2", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch6_2"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(6-1)*X_sub", _
"TranslateVectorY:=", "0+(2-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap6_3", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.41131mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap6_3", "Y:=", "gap6_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_3", "Y:=", "gap6_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_3", "Y:=", "Y_sub-gap6_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_3", "Y:=", "Y_sub-gap6_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_3",   "Y:=", "gap6_3",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch6_3", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch6_3"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(6-1)*X_sub", _
"TranslateVectorY:=", "0+(3-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap6_4", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.43891mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap6_4", "Y:=", "gap6_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_4", "Y:=", "gap6_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_4", "Y:=", "Y_sub-gap6_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_4", "Y:=", "Y_sub-gap6_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_4",   "Y:=", "gap6_4",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch6_4", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch6_4"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(6-1)*X_sub", _
"TranslateVectorY:=", "0+(4-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap6_5", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.60688mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap6_5", "Y:=", "gap6_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_5", "Y:=", "gap6_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_5", "Y:=", "Y_sub-gap6_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_5", "Y:=", "Y_sub-gap6_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_5",   "Y:=", "gap6_5",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch6_5", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch6_5"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(6-1)*X_sub", _
"TranslateVectorY:=", "0+(5-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap6_6", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.44753mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap6_6", "Y:=", "gap6_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_6", "Y:=", "gap6_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_6", "Y:=", "Y_sub-gap6_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_6", "Y:=", "Y_sub-gap6_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_6",   "Y:=", "gap6_6",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch6_6", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch6_6"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(6-1)*X_sub", _
"TranslateVectorY:=", "0+(6-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap6_7", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.62248mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap6_7", "Y:=", "gap6_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_7", "Y:=", "gap6_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_7", "Y:=", "Y_sub-gap6_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_7", "Y:=", "Y_sub-gap6_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_7",   "Y:=", "gap6_7",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch6_7", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch6_7"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(6-1)*X_sub", _
"TranslateVectorY:=", "0+(7-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap6_8", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.68167mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap6_8", "Y:=", "gap6_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_8", "Y:=", "gap6_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_8", "Y:=", "Y_sub-gap6_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_8", "Y:=", "Y_sub-gap6_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_8",   "Y:=", "gap6_8",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch6_8", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch6_8"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(6-1)*X_sub", _
"TranslateVectorY:=", "0+(8-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap6_9", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.47722mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap6_9", "Y:=", "gap6_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_9", "Y:=", "gap6_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_9", "Y:=", "Y_sub-gap6_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_9", "Y:=", "Y_sub-gap6_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_9",   "Y:=", "gap6_9",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch6_9", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch6_9"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(6-1)*X_sub", _
"TranslateVectorY:=", "0+(9-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap6_10", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40205mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap6_10", "Y:=", "gap6_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_10", "Y:=", "gap6_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap6_10", "Y:=", "Y_sub-gap6_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_10", "Y:=", "Y_sub-gap6_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap6_10",   "Y:=", "gap6_10",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch6_10", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch6_10"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(6-1)*X_sub", _
"TranslateVectorY:=", "0+(10-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap7_1", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.68533mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap7_1", "Y:=", "gap7_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_1", "Y:=", "gap7_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_1", "Y:=", "Y_sub-gap7_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_1", "Y:=", "Y_sub-gap7_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_1",   "Y:=", "gap7_1",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch7_1", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch7_1"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(7-1)*X_sub", _
"TranslateVectorY:=", "0+(1-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap7_2", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.62408mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap7_2", "Y:=", "gap7_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_2", "Y:=", "gap7_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_2", "Y:=", "Y_sub-gap7_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_2", "Y:=", "Y_sub-gap7_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_2",   "Y:=", "gap7_2",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch7_2", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch7_2"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(7-1)*X_sub", _
"TranslateVectorY:=", "0+(2-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap7_3", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.44606mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap7_3", "Y:=", "gap7_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_3", "Y:=", "gap7_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_3", "Y:=", "Y_sub-gap7_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_3", "Y:=", "Y_sub-gap7_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_3",   "Y:=", "gap7_3",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch7_3", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch7_3"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(7-1)*X_sub", _
"TranslateVectorY:=", "0+(3-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap7_4", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40222mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap7_4", "Y:=", "gap7_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_4", "Y:=", "gap7_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_4", "Y:=", "Y_sub-gap7_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_4", "Y:=", "Y_sub-gap7_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_4",   "Y:=", "gap7_4",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch7_4", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch7_4"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(7-1)*X_sub", _
"TranslateVectorY:=", "0+(4-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap7_5", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.43891mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap7_5", "Y:=", "gap7_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_5", "Y:=", "gap7_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_5", "Y:=", "Y_sub-gap7_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_5", "Y:=", "Y_sub-gap7_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_5",   "Y:=", "gap7_5",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch7_5", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch7_5"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(7-1)*X_sub", _
"TranslateVectorY:=", "0+(5-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap7_6", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.62248mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap7_6", "Y:=", "gap7_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_6", "Y:=", "gap7_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_6", "Y:=", "Y_sub-gap7_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_6", "Y:=", "Y_sub-gap7_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_6",   "Y:=", "gap7_6",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch7_6", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch7_6"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(7-1)*X_sub", _
"TranslateVectorY:=", "0+(6-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap7_7", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.70475mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap7_7", "Y:=", "gap7_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_7", "Y:=", "gap7_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_7", "Y:=", "Y_sub-gap7_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_7", "Y:=", "Y_sub-gap7_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_7",   "Y:=", "gap7_7",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch7_7", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch7_7"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(7-1)*X_sub", _
"TranslateVectorY:=", "0+(7-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap7_8", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.60946mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap7_8", "Y:=", "gap7_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_8", "Y:=", "gap7_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_8", "Y:=", "Y_sub-gap7_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_8", "Y:=", "Y_sub-gap7_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_8",   "Y:=", "gap7_8",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch7_8", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch7_8"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(7-1)*X_sub", _
"TranslateVectorY:=", "0+(8-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap7_9", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.43807mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap7_9", "Y:=", "gap7_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_9", "Y:=", "gap7_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_9", "Y:=", "Y_sub-gap7_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_9", "Y:=", "Y_sub-gap7_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_9",   "Y:=", "gap7_9",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch7_9", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch7_9"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(7-1)*X_sub", _
"TranslateVectorY:=", "0+(9-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap7_10", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40982mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap7_10", "Y:=", "gap7_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_10", "Y:=", "gap7_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap7_10", "Y:=", "Y_sub-gap7_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_10", "Y:=", "Y_sub-gap7_10", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap7_10",   "Y:=", "gap7_10",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch7_10", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch7_10"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(7-1)*X_sub", _
"TranslateVectorY:=", "0+(10-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap8_2", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.70249mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap8_2", "Y:=", "gap8_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_2", "Y:=", "gap8_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_2", "Y:=", "Y_sub-gap8_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_2", "Y:=", "Y_sub-gap8_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_2",   "Y:=", "gap8_2",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch8_2", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch8_2"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(8-1)*X_sub", _
"TranslateVectorY:=", "0+(2-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap8_3", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.5613mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap8_3", "Y:=", "gap8_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_3", "Y:=", "gap8_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_3", "Y:=", "Y_sub-gap8_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_3", "Y:=", "Y_sub-gap8_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_3",   "Y:=", "gap8_3",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch8_3", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch8_3"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(8-1)*X_sub", _
"TranslateVectorY:=", "0+(3-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap8_4", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.44606mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap8_4", "Y:=", "gap8_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_4", "Y:=", "gap8_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_4", "Y:=", "Y_sub-gap8_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_4", "Y:=", "Y_sub-gap8_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_4",   "Y:=", "gap8_4",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch8_4", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch8_4"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(8-1)*X_sub", _
"TranslateVectorY:=", "0+(4-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap8_5", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.41131mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap8_5", "Y:=", "gap8_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_5", "Y:=", "gap8_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_5", "Y:=", "Y_sub-gap8_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_5", "Y:=", "Y_sub-gap8_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_5",   "Y:=", "gap8_5",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch8_5", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch8_5"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(8-1)*X_sub", _
"TranslateVectorY:=", "0+(5-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap8_6", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.68167mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap8_6", "Y:=", "gap8_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_6", "Y:=", "gap8_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_6", "Y:=", "Y_sub-gap8_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_6", "Y:=", "Y_sub-gap8_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_6",   "Y:=", "gap8_6",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch8_6", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch8_6"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(8-1)*X_sub", _
"TranslateVectorY:=", "0+(6-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap8_7", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.60946mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap8_7", "Y:=", "gap8_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_7", "Y:=", "gap8_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_7", "Y:=", "Y_sub-gap8_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_7", "Y:=", "Y_sub-gap8_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_7",   "Y:=", "gap8_7",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch8_7", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch8_7"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(8-1)*X_sub", _
"TranslateVectorY:=", "0+(7-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap8_8", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.47722mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap8_8", "Y:=", "gap8_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_8", "Y:=", "gap8_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_8", "Y:=", "Y_sub-gap8_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_8", "Y:=", "Y_sub-gap8_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_8",   "Y:=", "gap8_8",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch8_8", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch8_8"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(8-1)*X_sub", _
"TranslateVectorY:=", "0+(8-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap8_9", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40308mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap8_9", "Y:=", "gap8_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_9", "Y:=", "gap8_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap8_9", "Y:=", "Y_sub-gap8_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_9", "Y:=", "Y_sub-gap8_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap8_9",   "Y:=", "gap8_9",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch8_9", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch8_9"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(8-1)*X_sub", _
"TranslateVectorY:=", "0+(9-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap9_2", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.64979mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap9_2", "Y:=", "gap9_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_2", "Y:=", "gap9_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_2", "Y:=", "Y_sub-gap9_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_2", "Y:=", "Y_sub-gap9_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_2",   "Y:=", "gap9_2",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch9_2", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch9_2"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(9-1)*X_sub", _
"TranslateVectorY:=", "0+(2-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap9_3", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.70249mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap9_3", "Y:=", "gap9_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_3", "Y:=", "gap9_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_3", "Y:=", "Y_sub-gap9_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_3", "Y:=", "Y_sub-gap9_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_3",   "Y:=", "gap9_3",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch9_3", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch9_3"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(9-1)*X_sub", _
"TranslateVectorY:=", "0+(3-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap9_4", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.62408mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap9_4", "Y:=", "gap9_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_4", "Y:=", "gap9_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_4", "Y:=", "Y_sub-gap9_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_4", "Y:=", "Y_sub-gap9_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_4",   "Y:=", "gap9_4",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch9_4", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch9_4"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(9-1)*X_sub", _
"TranslateVectorY:=", "0+(4-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap9_5", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.5613mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap9_5", "Y:=", "gap9_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_5", "Y:=", "gap9_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_5", "Y:=", "Y_sub-gap9_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_5", "Y:=", "Y_sub-gap9_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_5",   "Y:=", "gap9_5",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch9_5", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch9_5"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(9-1)*X_sub", _
"TranslateVectorY:=", "0+(5-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap9_6", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.47722mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap9_6", "Y:=", "gap9_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_6", "Y:=", "gap9_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_6", "Y:=", "Y_sub-gap9_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_6", "Y:=", "Y_sub-gap9_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_6",   "Y:=", "gap9_6",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch9_6", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch9_6"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(9-1)*X_sub", _
"TranslateVectorY:=", "0+(6-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap9_7", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.43807mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap9_7", "Y:=", "gap9_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_7", "Y:=", "gap9_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_7", "Y:=", "Y_sub-gap9_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_7", "Y:=", "Y_sub-gap9_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_7",   "Y:=", "gap9_7",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch9_7", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch9_7"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(9-1)*X_sub", _
"TranslateVectorY:=", "0+(7-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap9_8", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40308mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap9_8", "Y:=", "gap9_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_8", "Y:=", "gap9_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_8", "Y:=", "Y_sub-gap9_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_8", "Y:=", "Y_sub-gap9_8", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_8",   "Y:=", "gap9_8",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch9_8", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch9_8"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(9-1)*X_sub", _
"TranslateVectorY:=", "0+(8-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap9_9", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.4253mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap9_9", "Y:=", "gap9_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_9", "Y:=", "gap9_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap9_9", "Y:=", "Y_sub-gap9_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_9", "Y:=", "Y_sub-gap9_9", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap9_9",   "Y:=", "gap9_9",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch9_9", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch9_9"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(9-1)*X_sub", _
"TranslateVectorY:=", "0+(9-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap10_4", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.68533mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap10_4", "Y:=", "gap10_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap10_4", "Y:=", "gap10_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap10_4", "Y:=", "Y_sub-gap10_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap10_4", "Y:=", "Y_sub-gap10_4", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap10_4",   "Y:=", "gap10_4",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch10_4", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch10_4"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(10-1)*X_sub", _
"TranslateVectorY:=", "0+(4-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap10_5", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.70519mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap10_5", "Y:=", "gap10_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap10_5", "Y:=", "gap10_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap10_5", "Y:=", "Y_sub-gap10_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap10_5", "Y:=", "Y_sub-gap10_5", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap10_5",   "Y:=", "gap10_5",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch10_5", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch10_5"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(10-1)*X_sub", _
"TranslateVectorY:=", "0+(5-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap10_6", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40205mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap10_6", "Y:=", "gap10_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap10_6", "Y:=", "gap10_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap10_6", "Y:=", "Y_sub-gap10_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap10_6", "Y:=", "Y_sub-gap10_6", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap10_6",   "Y:=", "gap10_6",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch10_6", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch10_6"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(10-1)*X_sub", _
"TranslateVectorY:=", "0+(6-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap10_7", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.40982mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap10_7", "Y:=", "gap10_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap10_7", "Y:=", "gap10_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap10_7", "Y:=", "Y_sub-gap10_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap10_7", "Y:=", "Y_sub-gap10_7", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap10_7",   "Y:=", "gap10_7",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch10_7", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch10_7"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(10-1)*X_sub", _
"TranslateVectorY:=", "0+(7-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oProject.SaveAs _
    "E:\Eular_Spiral\2020-06-14_CodeForAkash\HFSSFiles\HMS_Th_0_ph_0_30_GHz_test.aedt", _
    true
