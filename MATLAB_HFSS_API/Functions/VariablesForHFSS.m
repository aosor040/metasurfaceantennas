function [] = VariablesForHFSS(fid, var)
hfssAddVariable(fid, 't', '18', 'um');

hfssAddVariable(fid, 'X_sub', num2str(var.X_sub), 'mm');
hfssAddVariable(fid, 'Y_sub', num2str(var.Y_sub), 'mm');
hfssAddVariable(fid, 'Z_sub', num2str(var.Z_sub), 'mm');
hfssAddVariable(fid, 'Port_h', num2str(var.Port_h), 'mm');

hfssAddVariable(fid, 'port_l', num2str(var.Vsub_h), 'mm');
hfssAddVariable(fid, 'port_w', num2str(var.usW), 'mm');

hfssAddVariable(fid, 'sub_h', num2str(var.sub_h), 'mm');
hfssAddVariable(fid, 'tap_w', '1.5', 'mm');
hfssAddVariable(fid, 'wavelength', num2str(var.lambda_o), 'mm'); 
hfssAddVariable(fid, 'wavelength_g', num2str(var.lambda_g), 'mm');
hfssAddVariable(fid, 'gnd_h', '8', 'mm');

hfssAddVariable(fid, 'L', '3.0935', 'mm');
hfssAddVariable(fid, 'W', '3', 'mm');
hfssAddVariable(fid, 'sp', '0.15', 'mm');
hfssAddVariable(fid, 'sW', '(W - 4*sp)/5', '');
hfssAddVariable(fid, 'sL', 'W/2 + sp', '');

hfssAddVariable(fid, 'm', num2str(var.m), '');
hfssAddVariable(fid, 'n', num2str(var.n), '');

hfssAddVariable(fid, 'dx', '2*L+2*tap_w+port_l','');
hfssAddVariable(fid, 'dy', '2*(2*L+2*tap_w+port_l)','');

hfssAddVariable(fid, 'Sub_offset','dx', '');
hfssAddVariable(fid, 'gnd_offset','dx/2', '');

hfssAddVariable(fid, 'gslot', '2', 'mm');

% Lines
hfssAddVariable(fid, 'Ht', 'gnd_h', '');

% Creating the move variable for every element
hfssAddVariable(fid, 'moveX', 'dx', '');
hfssAddVariable(fid, 'moveY', 'dy', '');
end
% 
