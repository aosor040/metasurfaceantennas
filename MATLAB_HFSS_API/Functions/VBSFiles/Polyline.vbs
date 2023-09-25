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
Array("NAME:t", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "18um"))))

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
"Value:=", "3mm"))))

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
"Value:=", "3mm"))))

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
Array("NAME:Port_h", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "100mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:port_l", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.813mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:port_w", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.4mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:sub_h", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.813mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:tap_w", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "1.5mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:wavelength", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "75mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:wavelength_g", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "40mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gnd_h", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "8mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:L", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "3.0935mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:W", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "3mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:sp", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "0.15mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:sW", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "(W - 4*sp)/5"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:sL", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "W/2 + sp"))))

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
Array("NAME:dx", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "2*L+2*tap_w+port_l"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:dy", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "2*(2*L+2*tap_w+port_l)"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:Sub_offset", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "dx"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gnd_offset", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "dx/2"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gslot", _
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
Array("NAME:Ht", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "gnd_h"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:moveX", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "dx"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:moveY", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "dy"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", true, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "-port_l/2", "Y:=", "-port_w/2", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2 - tap_w", "Y:=", "-W/2", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2 - tap_w - L", "Y:=", "-W/2", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2 - tap_w - L", "Y:=", "-W/2 + sW", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2 - tap_w - L + sL", "Y:=", "-W/2 + sW", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2 - tap_w - L + sL", "Y:=", "-sW/2", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2 - tap_w - L", "Y:=", "-sW/2", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2 - tap_w - L", "Y:=", "sW/2", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2 - tap_w - L + sL", "Y:=", "sW/2", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2 - tap_w - L + sL", "Y:=", "W/2 - sW", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2 - tap_w - L", "Y:=", "W/2 - sW", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2 - tap_w - L", "Y:=", "W/2", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2 - tap_w", "Y:=", "W/2", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2", "Y:=", "port_w/2", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "-port_l/2",   "Y:=", "-port_w/2",   "Z:=", "0")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 4, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 5, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 6, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 7, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 8, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 9, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 10, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 11, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 12, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 13, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Polyline2", _
"Flags:=", "", _
"Color:=", "(217 84 26)", _
"Transparency:=", 0.250000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oProject.SaveAs _
    "D:\Anthony\Holographytest\HMA_Design_Automation_MATLAB_to_HFSS_API\Functions\HFSSFiles\Polyline.aedt", _
    true
