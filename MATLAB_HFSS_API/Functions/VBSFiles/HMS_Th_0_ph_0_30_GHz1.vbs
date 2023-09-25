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
"Value:=", "75"))))

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
"Value:=", "75"))))

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
