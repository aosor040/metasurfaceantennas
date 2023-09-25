function [] = DrawingPolyline(fid, var)

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
point1 = [{'-port_l/2'}, {'-port_w/2'}, {'0'}];
point2 = [{'-port_l/2 - tap_w'}, {'-W/2'}, {'0'}];
point3 = [{'-port_l/2 - tap_w - L'}, {'-W/2'}, {'0'}];
point3_1 = [{'-port_l/2 - tap_w - L'}, {'-W/2 + sW'}, {'0'}];
point4 = [{'-port_l/2 - tap_w - L + sL'}, {'-W/2 + sW'}, {'0'}];
point5 = [{'-port_l/2 - tap_w - L + sL'}, {'-sW/2'}, {'0'}];
point6 = [{'-port_l/2 - tap_w - L'}, {'-sW/2'}, {'0'}];
point7 = [{'-port_l/2 - tap_w - L'}, {'sW/2'}, {'0'}];
point8 = [{'-port_l/2 - tap_w - L + sL'}, {'sW/2'}, {'0'}];
point9 = [{'-port_l/2 - tap_w - L + sL'}, {'W/2 - sW'}, {'0'}];
point10 = [{'-port_l/2 - tap_w - L'}, {'W/2 - sW'}, {'0'}];
point11 = [{'-port_l/2 - tap_w - L'}, {'W/2'}, {'0'}];
point12 = [{'-port_l/2 - tap_w'}, {'W/2'}, {'0'}];
point13 = [{'-port_l/2'}, {'port_w/2'}, {'0'}];
point14 = [{'-port_l/2'}, {'-port_w/2'}, {'0'}];

points = [point1;point2;point3;point3_1;point4;point5;point6;point7;point8;...
    point9;point10;point11;point12;point13;point14];
hfssPolyline(fid, "Polyline2", points, 'true', 'Line', [var.Colors.Orange], 0.25);

end

