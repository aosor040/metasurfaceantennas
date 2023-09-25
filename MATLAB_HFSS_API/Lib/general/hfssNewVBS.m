function hfssNewVBS(fid, projName, designName)
% This function sets up the header for new VBS scripts that will be used to
% operate HFSS. For example to analyse a design that has already been made,
% pass in the project name, design name, and fid (generated from
% hfssProjectSetUp function)

if (nargin < 3)
    error('Insufficient number of arguments !');
end

fprintf(fid, 'Dim oAnsoftApp\n');
fprintf(fid, 'Dim oDesktop\n');
fprintf(fid, 'Dim oProject\n');
fprintf(fid, 'Dim oDesign\n');
fprintf(fid, 'Dim oEditor\n');
fprintf(fid, 'Dim oModule\n');
fprintf(fid, 'Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")\n');
fprintf(fid, 'Set oDesktop = oAnsoftApp.GetAppDesktop()\n');
fprintf(fid, 'Set oProject = oDesktop.SetActiveProject("%s")\n', projName);
fprintf(fid, 'Set oDesign = oProject.SetActiveDesign("%s")\n', designName);
end

