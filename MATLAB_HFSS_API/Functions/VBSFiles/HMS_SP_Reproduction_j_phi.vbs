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
"Value:=", "135"))))

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
"Value:=", "42"))))

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
"Value:=", "3mm"))))

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

oProject.SaveAs _
    "E:\Eular_Spiral\2020-06-14_CodeForAkash\HFSSFiles\HMS_SP_Reproduction_j_phi.aedt", _
    true
