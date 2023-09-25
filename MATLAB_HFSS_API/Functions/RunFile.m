
[fid, hfssScriptFile, tmpPrjFile, var] = Initializations();

%% Making Polyline
% Drawing_Euler_Polyline(fid, var);
% Drawing_Euler_Substrate_and_Port(fid, var);
DrawingPolyline(fid, var);
% Double_Source_HMS_My_Design(fid, var);

%% Save the project to a temporary file.
hfssSaveProject(fid, tmpPrjFile, true);

% Run the generated vbs file
fclose(fid);
runScript = "cscript" + " "+ hfssScriptFile;
system(runScript);



