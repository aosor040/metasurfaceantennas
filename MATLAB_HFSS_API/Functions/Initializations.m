function [fid, hfssScriptFile, tmpPrjFile, var] = Initializations()
clc; clear; close all; fclose all;

% adding the API root directories
path = 'D:\Anthony\Holographytest\HMA_Design_Automation_MATLAB_to_HFSS_API\Lib'; % THIS SHOULD BE THE PATH WHERE YOU HAVE THE 'LIB' FOLDER
addpath(strcat(path,'\3dmodeler'));
addpath(strcat(path, '\analysis'));
addpath(strcat(path,'\boundary'));
addpath(strcat(path,'\fieldsCalculator'));
addpath(strcat(path, '\general'));
addpath(strcat(path, '\mesh'));
addpath(strcat(path,'\radiation'));
addpath(strcat(path, '\reporter'));



Dir = 'D:\Anthony\Holographytest\HMA_Design_Automation_MATLAB_to_HFSS_API\Functions'; % THIS SHOULD BE THE DIRECTORY WHERE YOU HAVE YOUR CODE
addpath(strcat(Dir,'\Functions'));
% addpath(Dir + '\Functions');
addpath(strcat(Dir ,'\HFSSFiles'));
addpath(strcat(Dir , '\VBSFiles'));

% Defining variables
var = Variables();

% Creating the required files
tmpPrjFile = Dir + "\HFSSFiles" + "\Polyline.aedt"; % create an HFSS project called this
hfssScriptFile = Dir + "\VBSFiles" +"\Polyline.vbs"; % generate a vbs script file here
DesignName = "Design1"; % name of the design which will be created in HFSS

% Create a new vbs script
fid = fopen(hfssScriptFile, 'wt');

% Create a new HFSS Project and insert a new design
hfssNewProject(fid);
hfssInsertDesign(fid, DesignName);

% Creating Variables in HFSS
VariablesForHFSS(fid, var); % IF YOU WANT TO CREATE VARIABLES IN HFSS

end

