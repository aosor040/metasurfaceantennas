
% [fid, hfssScriptFile, tmpPrjFile, ID] = HMS_Initializations();
[fid, hfssScriptFile, tmpPrjFile, var] = HMS_Initializations();

%% Making Polyline
HMS_Patch_Polyline(fid, var);
% HMS_New_Patchs(fid, var);
% HMS_New_Patchs_Sievenpiper(fid, var);
% Single_Source_Theta_0_Theta_60_17GHz_Combined(fid, var);
% Single_Source_Theta_0_17GHz_Only_Broadside(fid, var);
% Single_Source_Theta_0_17GHz_Hybrid_Broadside(fid, var);
% Single_Source_Theta_60_17GHz_Only_60_Degree(fid, var);
% Single_Source_Theta_0_17GHz_Only_Broadside_Shifted_Feed(fid, var);
% Double_Source_HMS_Sievenpiper(fid, var);
% APS_Foldable_30_60_Gradient(fid, var);
% APS_Foldable_0_60_Gradient(fid, var);
% Circular_Aperture_NaN_Fixed(fid, var);
Square_Aperture_HMS(fid, var);
% HMS_Sievenpiper_Reproduction(fid, var);

% Save the project to a temporary file.
hfssSaveProject(fid, tmpPrjFile, true);

% Run the generated vbs file
% fclose(fid);
% runScript = "cscript" + " "+ hfssScriptFile;
% system(runScript);