function [] = HMS_Patch_Polyline(fid, var)

% % IF WE USE VARIABLES FROM MATLAB (create these variable in the 'Variables' function)
% % (divide each variable by 1000 to change from meter to mm)
% point1 = [{num2str(-(var.port_l/1000)/2)}, {num2str(-(var.port_w/1000)/2)}, {num2str(0)}];
% point2 = [{num2str((var.port_l/1000)/2)}, {num2str(-(var.port_w/1000)/2)}, {num2str(0)}];
% point3 = [{num2str((var.port_l/1000)/2)}, {num2str((var.port_w/1000)/2)}, {num2str(0)}];
% point4 = [{num2str(-(var.port_l/1000)/2)}, {num2str((var.port_w/1000)/2)}, {num2str(0)}];
% point5 = [{num2str(-(var.port_l/1000)/2)}, {num2str(-(var.port_w/1000)/2)}, {num2str(0)}];
% 
% points = [point1;point2;point3;point4;point5];
% hfssPolyline(fid, "Polyline1", points, 'true', 'Line', [var.Colors.Orange], 0.25);


% IF WE USE VARIABLES FROM HFSS (create these variable in the 'VariablesForHFSS' function)
% point1 = [{'gap'}, {'gap'}, {'Z_sub'}];
% point2 = [{'X_sub - gap'}, {'gap'}, {'Z_sub'}];
% point3 = [{'X_sub - gap'}, {'Y_sub - gap'}, {'Z_sub'}];
% point4 = [{'gap'}, {'Y_sub - gap'}, {'Z_sub'}];
% point5 = [{'gap'}, {'gap'}, {'Z_sub'}];
% 
% points = [point1;point2;point3;point4;point5];
% hfssPolyline(fid, "Patch", points, 'true', 'Line', [var.Colors.Orange], 0.25);

hfssBox(fid, 'RogersRTDuroid_5880', [{'0'}, {'0'}, {'0'}], [{'m*X_sub'}, {'n*Y_sub'}, {'Z_sub'}]);

end

