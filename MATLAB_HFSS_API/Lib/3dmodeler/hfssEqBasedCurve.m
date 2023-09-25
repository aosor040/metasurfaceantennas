function [] = hfssEqBasedCurve(fid, Name, X, Y, Z, Start, End)


% Dir = pwd; % this is the current working directory in MATLAB
% hfssScriptFile = Dir + "\VBSFiles" + "\EBC.vbs"; % generate a vbs script file here
% 
% % Create a new vbs script
% fid = fopen(hfssScriptFile, 'wt');
% 
% 
% fprintf(fid,'Dim oAnsoftApp \n');
% fprintf(fid,'Dim oDesktop \n');
% fprintf(fid,'Dim oProject \n');
% fprintf(fid,'Dim oDesign \n');
% fprintf(fid,'Dim oEditor \n');
% fprintf(fid,'Dim oModule \n');
% 
% fprintf(fid,'Set oAnsoftApp  = CreateObject("Ansoft.ElectronicsDesktop") \n');
% fprintf(fid,'Set oDesktop = oAnsoftApp.GetAppDesktop() \n');
% fprintf(fid,'oDesktop.RestoreWindow \n');
% 
% fprintf(fid,'Set oProject = oDesktop.SetActiveProject("%s") \n', "Temp");
% fprintf(fid,'Set oDesign = oProject.SetActiveDesign("%s") \n', "HFSSDesign1");


% fprintf(fid, '\n');
fprintf(fid, 'Set oEditor = oDesign.SetActiveEditor("3D Modeler") \n');
fprintf(fid, 'oEditor.CreateEquationCurve Array("NAME:EquationBasedCurveParameters", _\n');
fprintf(fid, '  "XtFunction:=", "%s",  _\n', X);
fprintf(fid, '  "YtFunction:=", "%s", _\n', Y);
fprintf(fid, '  "ZtFunction:=", "%s", _\n', Z);
fprintf(fid, '  "tStart:=", "%s", _\n', Start);
fprintf(fid, '  "tEnd:=", "%s", _\n', End);
fprintf(fid, '  "NumOfPointsOnCurve:=", "%s", _\n', "0");

fprintf(fid, '  "Version:=", 1, Array("NAME:PolylineXSection", "XSectionType:=",  _\n');
fprintf(fid, '  "None", "XSectionOrient:=", "Auto", "XSectionWidth:=", "0", "XSectionTopWidth:=",  _\n');
fprintf(fid, '  "0", "XSectionHeight:=", "0", "XSectionNumSegments:=", "0", "XSectionBendType:=",  _\n');
fprintf(fid, '  "Corner")), Array("NAME:Attributes", "Name:=", "%s",  _\n', Name);
fprintf(fid, '  "Flags:=", "", "Color:=",  _\n');
fprintf(fid, '  "(143 175 143)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _\n');
fprintf(fid, '  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SurfaceMaterialValue:=",  _\n');
fprintf(fid, '  "" & Chr(34) & "" & Chr(34) & "", "SolveInside:=", true, "IsMaterialEditable:=",  _\n');
fprintf(fid, '  true, "UseMaterialAppearance:=", false) \n');
fprintf(fid, '\n');

% fclose(fid);
end

