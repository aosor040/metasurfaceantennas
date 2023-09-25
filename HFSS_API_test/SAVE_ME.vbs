Dim oHfssApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule

Set oHfssApp  = CreateObject("AnsoftHfss.HfssScriptInterface")
Set oDesktop = oHfssApp.GetAppDesktop()
oDesktop.RestoreWindow
oDesktop.NewProject("")
Set oProject = oDesktop.GetActiveProject
oProject.Rename "E:\Ansoft\\SAVE_ME", true

oProject.InsertDesign "HFSS", "Test", "DrivenModal", ""
Set oDesign = oProject.SetActiveDesign("Test")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers", "LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:f", _
"PropType:=", "VariableProp", _
"UserDef:=", true, _
"Value:=", "17000000000.000000"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers", "LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:k_0", _
"PropType:=", "VariableProp", _
"UserDef:=", true, _
"Value:=", "356.047167mm"))))
