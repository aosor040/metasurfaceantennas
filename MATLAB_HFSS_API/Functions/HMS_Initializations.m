% function [fid, hfssScriptFile, tmpPrjFile, ID] = HMS_Initializations()
function [fid, hfssScriptFile, tmpPrjFile, var] = HMS_Initializations()
clc; clear; close all; fclose all;

% adding the API root directories
path = "E:\Documents\Students\Anthony\HMA_Design_Automation_MATLAB_to_HFSS_API\Lib\"; % THIS SHOULD BE THE PATH WHERE YOU HAVE THE 'LIB' FOLDER
addpath(path + "3dmodeler");
addpath(path + "analysis");
addpath(path + "boundary");
addpath(path + "fieldsCalculator");
addpath(path + "general");
addpath(path + "mesh");
addpath(path + "radiation");
addpath(path + "reporter");

Dir = "E:\Documents\Students\Anthony\HMA_Design_Automation_MATLAB_to_HFSS_API\Functions"; % THIS SHOULD BE THE DIRECTORY WHERE YOU HAVE YOUR CODE
addpath(Dir);
addpath(Dir + "\HFSSFiles");
addpath(Dir + "\VBSFiles");

% Defining Input data
var = HMS_Variables();
% ID = ID();

% Creating the required files
tmpPrjFile = Dir + "\HFSSFiles" + "\RO4350_SubH_1p52_SA_CP_HMS.aedt"; % create an HFSS project called this 
hfssScriptFile = Dir + "\VBSFiles" +"\RO4350_SubH_1p52_SA_CP_HMS.vbs"; % generate a vbs script file here
DesignName = "Design1"; % name of the design which will be created in HFSS

% Create a new vbs script
fid = fopen(hfssScriptFile, 'wt');

% Create a new HFSS Project and insert a new design
hfssNewProject(fid);
hfssInsertDesign(fid, DesignName);

% Creating Variables in HFSS
HMS_VariablesForHFSS(fid, var); % IF YOU WANT TO CREATE VARIABLES IN HFSS
% HMS_VariablesForHFSS(fid, ID); % IF YOU WANT TO CREATE VARIABLES IN HFSS

end

