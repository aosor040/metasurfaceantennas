function [hfssScriptfile, fid] = hfssProjectSetUp(scriptName, projName, dir, designName)
% This function is the set up to any antenna designed with antennaBuilder. It first adds all the
% paths necessary to the genpath.
% Parameters:
% scriptName:     Name the user wants to call the .vbs file
% projName:       Name the user wants to call the new project.
% designName:     Name the user wants to call the design in the project
% dir:            If the .vbs fill will create new project, user must
%                 provide path to the Ansoft folder

% Preface
if nargin < 3
    error('Not enough arguments');
elseif nargin < 4
    newProj = true;
else
    newProj = false;
end

if newProj
    % Create a new vbs script
    hfssScriptfile = [pwd sprintf('\\%s.vbs', projName)]; % generate a vbs script file here
    fid = fopen(convertCharsToStrings(hfssScriptfile), 'wt');
    % Create a new HfSS Project
    hfssNewProject(fid, dir, projName);
else
    % Create a new vbs script
    hfssScriptfile = [pwd sprintf('\\%s.vbs', scriptName)]; % generate a vbs script file here
    fid = fopen(hfssScriptfile, 'wt');    
    hfssNewVBS(fid, projName, designName);
end
end