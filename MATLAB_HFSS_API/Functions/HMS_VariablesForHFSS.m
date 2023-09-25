function [] = HMS_VariablesForHFSS(fid, var)

hfssAddVariable(fid, 'X_sub', num2str(var.X_sub), 'mm');
hfssAddVariable(fid, 'Y_sub', num2str(var.Y_sub), 'mm');
hfssAddVariable(fid, 'Z_sub', num2str(var.Z_sub), 'mm');
hfssAddVariable(fid, 'gap', num2str(var.gap), 'mm');
hfssAddVariable(fid, 'Cop_T', num2str(var.Cop_T), 'mm');
hfssAddVariable(fid, 'm', num2str(var.m), '');
hfssAddVariable(fid, 'n', num2str(var.n), '');
hfssAddVariable(fid, 'X_offset', num2str(var.X_offset), 'mm');

end
% 
