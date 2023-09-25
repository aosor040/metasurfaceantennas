function [var] = HMS_Variables()

% CREATE ALL VARIABLES USING STRUCTS (i.e. "var.name" etc.) SO THAT YOU CAN
% PASS THEM TO OTHER FUNCTIONS EASILY

var.X_sub = 2;
var.Y_sub = 2; 
var.Z_sub = 1.52;
var.gap = 1;
var.Cop_T =0.017;
var.m = 35;
var.n = 35;
var.X_offset = 2;


var.Colors = struct('Orange', [217, 84, 26], 'Green', [120, 171, 48], 'Red', [255, 0, 0], 'Blue', [102, 102, 255]);

end