clear, clc, close all
% This code will build a RA with a square aperture, square UCs, square
% patches

% Define HFSS project parameters
projName =  'SAVE_ME';
designName = "Test";
VBSscriptName = projName;
projDir = 'E:\Ansoft\';


% Define Aperture parameters 
fc = 5.85; % Freq in GHz
Sub = 'Rogers RO4003 (tm)';
subH = 0.8; % Substrate thickness in mm
dx = 0.5; % UC dimensions
dy = dx;
AP_X = 5;
AP_Y = 5;

% Define array parameters
thetaB_deg = 0;
phiB_deg = 0;
phaseK = 0; % Phase constant added in array theory

% Define feed parameters
feedTheta_deg = 0;
feedQ = 10;

% Define soultion setup parameters
maxDeltaE = 0.01;
maxPass = 25;
minConvPass = 2;

% Define milling machine tolerance
machineTol= 0.001; % 1 micron



sqRA = squareRA(projName, designName, VBSscriptName, projDir, ScurveDir, fc, Sub, subH, dx, dy, AP_X, AP_Y, ...
    thetaB_deg, phiB_deg, phaseK, feedTheta_deg, feedQ, maxDeltaE, maxPass, minConvPass, machineTol);

sqRA.discretizeAP

% lambda = 300/16;
% z = 8*lambda;
% y =0;
% x = -z*tand(feedTheta_deg);
% sqRA.feedPos = [-66.294578384201130,0,1.821428571428571e+02];
sqRA.calcOptimalFeedPos;

% sqRA.calcContPhaseDist;
sqRA.calcReqPhaseDist
sqRA.createRealPhaseDist;
% % 
% % 
% % 
% FF1 = sqRA.calcRadPattern(sqRA.RP_vect);
FF2 = sqRA.calcRadPattern(sqRA.RealPhase_vect);
% 
% 
% 
% [FF, FF_real] = sqRA.calcRadPattern

sqRA.createHFSSproj
sqRA.createVars
sqRA.createSubstrate
sqRA.createGND
sqRA.createPatches
% % % % % sqRA.createRegion
sqRA.runVBS([])
% % % sqRA.createFEBIHFSSproj
% 
% save_dir = "D:\";
% projName = "MY_Proj";
% CMD_line_array = [save_dir, projName];
% sqRA.runVBS(CMD_line_array)
% % % 
% close all

