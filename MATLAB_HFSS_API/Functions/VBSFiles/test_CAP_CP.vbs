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
"Value:=", "1.57mm"))))

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
"Value:=", "5"))))

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
"Value:=", "5"))))

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
Array("NAME:gap1_2", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.54766mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap1_2", "Y:=", "gap1_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap1_2", "Y:=", "gap1_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap1_2", "Y:=", "Y_sub-gap1_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap1_2", "Y:=", "Y_sub-gap1_2", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap1_2",   "Y:=", "gap1_2",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch1_2", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch1_2"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(1-1)*X_sub", _
"TranslateVectorY:=", "0+(2-1)*Y_sub", _
"TranslateVectorZ:=", "0")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gap1_3", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.52278mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap1_3", "Y:=", "gap1_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap1_3", "Y:=", "gap1_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap1_3", "Y:=", "Y_sub-gap1_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap1_3", "Y:=", "Y_sub-gap1_3", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap1_3",   "Y:=", "gap1_3",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch1_3", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch1_3"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(1-1)*X_sub", _
"TranslateVectorY:=", "0+(3-1)*Y_sub", _
"TranslateVectorZ:=", "0")

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
"Value:=", "0.36526mm"))))

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
Array("NAME:gap2_1", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.72508mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap2_1", "Y:=", "gap2_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_1", "Y:=", "gap2_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap2_1", "Y:=", "Y_sub-gap2_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_1", "Y:=", "Y_sub-gap2_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap2_1",   "Y:=", "gap2_1",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch2_1", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch2_1"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(2-1)*X_sub", _
"TranslateVectorY:=", "0+(1-1)*Y_sub", _
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
"Value:=", "0.83911mm"))))

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
"Value:=", "0.84383mm"))))

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
"Value:=", "0.5562mm"))))

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
"Value:=", "0.32122mm"))))

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
Array("NAME:gap3_1", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.84374mm"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "gap3_1", "Y:=", "gap3_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_1", "Y:=", "gap3_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "X_sub-gap3_1", "Y:=", "Y_sub-gap3_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_1", "Y:=", "Y_sub-gap3_1", "Z:=", "Z_sub"), _
			Array("NAME:PLPoint", "X:=", "gap3_1",   "Y:=", "gap3_1",   "Z:=", "Z_sub")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Patch3_1", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Move _
Array("NAME:Selections", _
"Selections:=", "Patch3_1"), _
Array("NAME:TranslateParameters", _
"TranslateVectorX:=", "0+(3-1)*X_sub", _
"TranslateVectorY:=", "0+(1-1)*Y_sub", _
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
"Value:=", "0.51365mm"))))

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
"Value:=", "0.51668mm"))))

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
"Value:=", "0.51972mm"))))

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
"Value:=", "0.32017mm"))))

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
Array("NAME:gap4_1", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.8409mm"))))

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
"Value:=", "0.48014mm"))))

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
"Value:=", "0.32014mm"))))

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
"Value:=", "0.32189mm"))))

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
"Value:=", "0.37071mm"))))

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
Array("NAME:gap5_2", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.7363mm"))))

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
"Value:=", "0.51065mm"))))

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
"Value:=", "0.48756mm"))))

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

oProject.SaveAs _
    "E:\Eular_Spiral\2020-06-14_CodeForAkash\HFSSFiles\test_CAP_CP.aedt", _
    true
