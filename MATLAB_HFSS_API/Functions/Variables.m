function [var] = Variables()

% CREATE ALL VARIABLES USING STRUCTS (i.e. "var.name" etc.) SO THAT YOU CAN
% PASS THEM TO OTHER FUNCTIONS EASILY

var.X_sub = 3;
var.Y_sub = 3; 
var.Z_sub = 1.57;
var.Port_h = 100;
% 
var.Colors = struct('Orange', [217, 84, 26], 'Green', [120, 171, 48], 'Red', [255, 0, 0], 'Blue', [102, 102, 255]);
var.m = 5;
var.n = 5;
var.ph_o = 0; % change n for phi=90
var.th_o = 0; % change m for phi=0

var.Freq = 4; % GHz
var.lambda_o = 300/var.Freq; % mm
var.lambda_g = 40;
var.k = 2*pi/var.lambda_o;

var.usW = 0.4;
var.sub_h = 0.813;
var.Vsub_h = 0.813;
var.port_l = var.Vsub_h;
var.port_w = var.usW;

var.L = 3.0935;
var.W = 3;
var.sp = 0.15;
var.sW = (var.W - 4*var.sp)/5;
var.sL = var.W/2 + var.sp;
var.tap_w = 1.5;
var.dx = 2*var.L+2*var.tap_w+var.port_l;
var.dy = 2*(2*var.L+2*var.tap_w+var.port_l);
var.Sub_offset = var.dx;
var.gnd_offset = var.dx/2;

end
% 
