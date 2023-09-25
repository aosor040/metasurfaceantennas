' ----------------------------------------------
' Script Recorded by ANSYS Electronics Desktop Version 2018.0.0
' 9:45:02  Jun 15, 2020
' ----------------------------------------------
Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")
Set oDesktop = oAnsoftApp.GetAppDesktop()
oDesktop.RestoreWindow
Set oProject = oDesktop.SetActiveProject("Project1")
Set oDesign = oProject.SetActiveDesign("Design1")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  _
  false, Array("NAME:PolylinePoints", Array("NAME:PLPoint", "X:=", "0mm", "Y:=", "0mm", "Z:=",  _
  "0mm"), Array("NAME:PLPoint", "X:=", "-0.9mm", "Y:=", "0.2mm", "Z:=", "0mm"), Array("NAME:PLPoint", "X:=",  _
  "-0.9mm", "Y:=", "0.9mm", "Z:=", "0mm"), Array("NAME:PLPoint", "X:=", "0.6mm", "Y:=",  _
  "1.8mm", "Z:=", "0mm")), Array("NAME:PolylineSegments", Array("NAME:PLSegment", "SegmentType:=",  _
  "Spline", "StartIndex:=", 0, "NoOfPoints:=", 4, "NoOfSegments:=", "0")), Array("NAME:PolylineXSection", "XSectionType:=",  _
  "None", "XSectionOrient:=", "Auto", "XSectionWidth:=", "0mm", "XSectionTopWidth:=",  _
  "0mm", "XSectionHeight:=", "0mm", "XSectionNumSegments:=", "0", "XSectionBendType:=",  _
  "Corner")), Array("NAME:Attributes", "Name:=", "Polyline1", "Flags:=", "", "Color:=",  _
  "(143 175 143)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _
  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SurfaceMaterialValue:=",  _
  "" & Chr(34) & "" & Chr(34) & "", "SolveInside:=", true, "IsMaterialEditable:=",  _
  true, "UseMaterialAppearance:=", false)
