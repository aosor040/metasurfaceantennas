function hfssNewProject(fid, dir, projName)
	% This function creates the necessary VBScript to create a new HFSS project
	% file, set it as the active project.
	%
	% Parameters:
	% fid:		file identifier of the VBScript File.
    % dir:      Directory where project will be saved. Usually in
    %           Documents/Ansoft
    % projName: Name of the project

	% Preamble.
	fprintf(fid, 'Dim oHfssApp\n');
	fprintf(fid, 'Dim oDesktop\n');
	fprintf(fid, 'Dim oProject\n');
	fprintf(fid, 'Dim oDesign\n');
	fprintf(fid, 'Dim oEditor\n');
	fprintf(fid, 'Dim oModule\n');
	fprintf(fid, '\n');

	% Create a New Project.
	fprintf(fid, 'Set oHfssApp  = CreateObject("AnsoftHfss.HfssScriptInterface")\n');
	fprintf(fid, 'Set oDesktop = oHfssApp.GetAppDesktop()\n');
	fprintf(fid, 'oDesktop.RestoreWindow\n');
	fprintf(fid, 'oDesktop.NewProject("")\n');

	% The new project created is the active project.
	fprintf(fid, 'Set oProject = oDesktop.GetActiveProject\n');
    
    %Rename project to projName
    fprintf(fid, 'oProject.Rename "%s\\%s", true\n', dir, projName);

    

    
