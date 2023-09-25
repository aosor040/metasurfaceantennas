function [] = Drawing_Euler_Substrate_and_Port(fid, var)



%% Substrate
point_sub_1 = [{num2str(X_sub/2)},{num2str(-Y_sub/2)},{num2str(-Z_sub)}];
point_sub_2 = [{num2str(X_sub/2)},{num2str(Y_sub/2)},{num2str(-Z_sub)}];
point_sub_3 = [{num2str(-X_sub/2)},{num2str(Y_sub/2)},{num2str(-Z_sub)}];
point_sub_4 = [{num2str(-X_sub/2)},{num2str(-Y_sub/2)},{num2str(-Z_sub)}];

points_sub = [point_sub_1;point_sub_2;point_sub_3;point_sub_4];


hfssBox(fid, "Substrate", points_sub, 'true', 'Line',[var.Colors.Orange], 0.25);
% hfssBox(fid, "Portbox", points_2, 'true', 'Spline',[var.Colors.Orange], 0.25);


end

