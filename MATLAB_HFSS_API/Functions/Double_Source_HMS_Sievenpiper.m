function [] = Double_Source_HMS_Sievenpiper(fid, var)

% Dual Feed Broadside Holographic Metasurface Code based on Dr. Sievenpiper's group's paper
% Scalar metasurface

%% Variables
f_1 = 17e9;
c = 3e8;
lambda_1 = c./f_1;
omega_1 = 2.*pi.*f_1;
j =sqrt(-1);
a = 3.5e-3;
k_0_1 = 2.*pi./lambda_1;

%% n calculation from the eigenmode analysis
phi_fixed_17 = deg2rad(80.57);
k_t_17 = phi_fixed_17./a;
n_1 = (k_t_17.*c)./omega_1;

X_1 = 195.7251;
Mdl_1 = 39.1450;



%% Beam steering angles
theta = deg2rad(0);
phi = deg2rad(0);

%% Physical dimension of HMS
length_x = 238e-3;
length_y = 238e-3;
x_c = a./2;
y_c = a./2;
M_x = round(length_x./a);
N_y = round(length_y./a);


MM=-(M_x)./2.*a:a:(M_x)./2.*a;
NN=-(N_y)./2.*0:a:(N_y)./2.*a;
x_0 = 0e-3;

for ii = 1:numel(MM)-1
        xx = MM(ii)+a/2;
    for jj = 1:numel(NN)-1
        yy = NN(jj)+a/2;
        r_1(ii,jj) = sqrt((xx-x_0).^2 + yy.^2);
        
        if xx<x_0
        Z_s(ii,jj) = imag(j.*(X_1 + Mdl_1.*cos(k_0_1.*n_1.*(sqrt((xx-x_0).^2 + yy.^2)))));

        else xx>x_0
        Z_s(ii,jj) = imag(j.*(X_1 + Mdl_1.*cos(k_0_1.*n_1.*(sqrt((xx-x_0).^2 + yy.^2))+pi)));
        end
    end
end
%% Gap Calculation
g = -(1.117e-8).*(Z_s.^4) + (8.266e-6).*(Z_s.^3) - 0.002204.*(Z_s.^2) + 0.2395.*Z_s -7.407; %4th degree pol 1lambda
% g = (4.38e-8).*(Z_s.^4) - (4.006e-5).*(Z_s.^3) + 0.01372.*(Z_s.^2) - 2.092.*Z_s + 120.6;  %4th degree pol 0.5lambda


figure()
contour(Z_s);
imshow(Z_s, []);

gap_mat = g;

for i = 1:var.m
    for j = 1:var.n
        X_pos = num2str(i)+"_"+num2str(j)+"X_pos";
%         Y_pos = num2str(i)+"_"+num2str(j)+"Y_pos";
        
        %   Creating the length variable for each element
        gap = "gap_1st_"+num2str(i)+"_"+num2str(j);
%         gap = "gap_2nd_"+num2str(i)+"_"+num2str(j);
        
        hfssAddVariable(fid, gap, num2str(gap_mat(i,j)), "mm");
      
        %% new patches
        
        point1 = [{gap}, {gap}, {"Z_sub"}];
        point2 = [{"X_sub-" + gap}, {gap}, {"Z_sub"}];
        point3 = [{"X_sub-"+gap}, {"Y_sub-" + gap}, {"Z_sub"}];
        point4 = [{gap}, {"Y_sub-" + gap}, {"Z_sub"}];
        point5 = [{gap}, {gap}, {"Z_sub"}];

        points = [point1;point2;point3;point4;point5];
        hfssPolyline(fid, "Patch_1st_"+num2str(i)+"_"+num2str(j), points, 'true', 'Line', [var.Colors.Orange], 0.25);
%         hfssPolyline(fid, "Patch_2nd_"+num2str(i)+"_"+num2str(j), points, 'true', 'Line', [var.Colors.Orange], 0.25);
        
        
        %% Move it move it
        
      hfssMove(fid, "Patch_1st_"+num2str(i)+"_"+num2str(j), ["0+("+num2str(i)+"-1)*X_sub", "0+("+num2str(j)+"-1)*Y_sub", "0"]);
%         hfssMove(fid, "Patch_2nd_"+num2str(i)+"_"+num2str(j), ["-X_offset-("+num2str(i)+"-1)*X_sub", "0+("+num2str(j)+"-1)*Y_sub", "0"]);

      %   hfssMove(fid, {patch}, ["("+num2str(i)+"-1)*X_sub", "("+num2str(j)+"-1)*Y_sub", ""]);        
    end
end
