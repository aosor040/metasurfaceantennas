function [] = Single_Source_Theta_0_17GHz_Only_Broadside_Shifted_Feed(fid, var)

% add gap variable file here

%% This code is for single source HMS with Broadside (theta = 0) and 
%% for foldable panel with an angle (theta = 60)

%% Variables
f = 17e9;
c = 3e8;
lambda = c./f;
omega = 2.*pi.*f;
a = 3e-3;
k_0 = 2.*pi./lambda;
phi_fixed = deg2rad(67.50);
k_t = phi_fixed./a;
% k_t = 2.*pi./lambda;
n = (k_t.*c)./omega;
j =sqrt(-1);

X = 182.5834;
Mdl = 32;


%% Beam steering angles
theta_1 = deg2rad(10);
theta_2 = deg2rad(60);
phi_1 = deg2rad(0);
phi_2 = deg2rad(0);


%% Physical dimension of HMS
length_x = 140e-3;
length_y = 140e-3;
x_c = a./2;
y_c = a./2;
M_x = round(length_x./a);
N_y = round(length_y./a);

% Broadside Fix
MM=-(M_x).*1.2*a:a:(M_x).*0.3.*a;
NN=-(N_y).*0.75.*a:a:(N_y).*0.75.*a;
x_0 = length_x./2;

% Combined Broadside Fix
% MM=-(M_x).*2.*a:a:(M_x).*a;
% NN=-(N_y).*a:a:(N_y).*a;
% x_0 = length_x.*0.5;

for ii = 1:numel(MM)-1
        xx = MM(ii)+a/2;
    for jj = 1:numel(NN)-1
        yy = NN(jj)+a/2;
        
%         if xx<0
        r(ii,jj) = sqrt(xx.^2 + yy.^2);
        psi_obj_1(ii,jj) = exp(j.*k_0.*xx.*sin(theta_1));
        psi_ref(ii,jj) = exp(-j.*k_0.*n.*r(ii,jj));
        Z_s(ii,jj) = imag(j.*(X + Mdl.*(real(psi_obj_1(ii,jj).*conj(psi_ref(ii,jj))))));
%         else if xx>0 && xx<x_0
%         r(ii,jj) = sqrt((xx).^2 + yy.^2);
%         psi_obj_1(ii,jj) = exp(-j.*k_t.*xx.*sin(theta_1));
%         psi_obj_2(ii,jj) = exp(-j.*k_t.*xx.*sin(theta_2));
%         psi_ref(ii,jj) = exp(-j.*k_t.*n.*r(ii,jj));        
%         Z_s(ii,jj) = imag(j.*(X + Mdl./2.*(real(psi_obj_1(ii,jj).*conj(psi_ref(ii,jj))) + real(psi_obj_2(ii,jj).*conj(psi_ref(ii,jj))))));
%             else xx>0
%         r(ii,jj) = sqrt((xx).^2 + yy.^2);
%         psi_obj_2(ii,jj) = exp(-j.*k_t.*xx.*sin(theta_2));
%         psi_ref(ii,jj) = exp(-j.*k_t.*n.*r(ii,jj));
%         Z_s(ii,jj) = imag(j.*(X + Mdl.*(real(psi_obj_2(ii,jj).*conj(psi_ref(ii,jj))))));
%         end
%         end
    end
end
%% Gap Calculation

g = -(1.012*10^-6).*(Z_s.^3)+0.0006763.*(Z_s.^2)-0.1553.*Z_s+12.5; % 3mm


gap_mat = g;


for i = 1:var.m
    for j = 1:var.n
        X_pos = num2str(i)+"_"+num2str(j)+"X_pos";
%         Y_pos = num2str(i)+"_"+num2str(j)+"Y_pos";
        
        %   Creating the length variable for each element
        gap = "gap"+num2str(i)+"_"+num2str(j);
%         gap = "gap_2nd_"+num2str(i)+"_"+num2str(j);
        
        hfssAddVariable(fid, gap, num2str(gap_mat(i,j)), "mm");
      
        %% new patches
        
        point1 = [{gap}, {gap}, {"Z_sub"}];
        point2 = [{"X_sub-" + gap}, {gap}, {"Z_sub"}];
        point3 = [{"X_sub-"+gap}, {"Y_sub-" + gap}, {"Z_sub"}];
        point4 = [{gap}, {"Y_sub-" + gap}, {"Z_sub"}];
        point5 = [{gap}, {gap}, {"Z_sub"}];

        points = [point1;point2;point3;point4;point5];
        hfssPolyline(fid, "Patch"+num2str(i)+"_"+num2str(j), points, 'true', 'Line', [var.Colors.Orange], 0.25);
%         hfssPolyline(fid, "Patch_2nd_"+num2str(i)+"_"+num2str(j), points, 'true', 'Line', [var.Colors.Orange], 0.25);
        
        
        %% Move it move it
        
      hfssMove(fid, "Patch"+num2str(i)+"_"+num2str(j), ["0+("+num2str(i)+"-1)*X_sub", "0+("+num2str(j)+"-1)*Y_sub", "0"]);
%         hfssMove(fid, "Patch_2nd_"+num2str(i)+"_"+num2str(j), ["-X_offset-("+num2str(i)+"-1)*X_sub", "0+("+num2str(j)+"-1)*Y_sub", "0"]);

      %   hfssMove(fid, {patch}, ["("+num2str(i)+"-1)*X_sub", "("+num2str(j)+"-1)*Y_sub", ""]);        
    end
end
