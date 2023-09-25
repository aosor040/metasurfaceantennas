clear, clc, close all

% This code will create an AEDT project and isert an HFSS design

% Define HFSS project parameters
projName =  'SAVE_ME';
designName = "Test";
VBSscriptName = projName;
projDir = 'E:\Ansoft\';


% My variables
f = 17e9; %% operating frequency 17GHz
c = 3e8; %% speed of light 3x10^8m/s
lambda = c./f; %% wavelength
omega = 2.*pi.*f;
a = 3e-3; %% lattice constant 3mm
k_0 = 2.*pi./lambda;
zeta = 377; %% characteristic impedance of air

AP_X = 406.4;
AP_Y = 254;
dx =  3;
dy = dx;

hfss = hfss_test(projName, designName, VBSscriptName, projDir, f, k_0, AP_X, AP_Y,dx, dy);

hfss.createHFSSproj;
hfss.createVars;
hfss.runVBS;