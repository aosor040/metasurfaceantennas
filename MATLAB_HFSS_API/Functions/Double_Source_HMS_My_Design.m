function [] = Double_Source_HMS_My_Design(fid, var)

% add gap variable file here
% Dual Feed Broadside Holographic Metasurface Code based on Dr. Sievenpiper's group's paper
% Scalar metasurface

%% Defining Variables
j = sqrt(-1);
Z_0 = 377;
c = 3e8;
a = 3.5e-3;
f_1 = 17e9;
f_2 = 20e9;
phi_fixed = deg2rad(86.69);

omega_1 = 2*pi*f_1;
omega_2 = 2*pi*f_2; 


k_1 = phi_fixed./a;
n_1 = (k_1.*c)./omega_1;

k_2 = phi_fixed./a;
n_2 = (k_2.*c)./omega_2;


%% Impedance Calculation
phi_1 = deg2rad([79.27; 79.54; 80.04; 80.79; 81.34; 82.22; 83.85; 85.04]);
phi_2 = deg2rad([96.14; 96.98; 97.99; 99.41; 100.55; 102.11; 104.67; 115.68]);
phi_1 = flip(phi_1);
phi_2 = flip(phi_2);

Zs_calc_1 = imag(Z_0.*sqrt(1-((phi_1.*c)./(a.*omega_1)).^2));
Zs_calc_2 = imag(Z_0.*sqrt(1-((phi_2.*c)./(a.*omega_2)).^2));


%% 

X_1 = 212.86;
M_1 = 42.47;

X_2 = 283.42;
M_2 = 56.68;

theta_L = 0;
phi_L = 0;

%% Location Vector calculation
x = 119e-3;
y = 119e-3;

num_p_x = x./a;
num_p_y = y./a;
x_c = a./2;
y_c = a./2;

x_0 = 70e-3;

%% Impedance Surface Top where x<-x_0  

% for ii = x_0./a:num_p_x
%         xx = (2.*(ii-1)+1).*x_c;
%    
%     for jj = 1:num_p_y
%         yy = (2.*(jj-1)+1).*y_c;
%         r_1(ii,jj) = sqrt((xx+x_0).^2 + yy.^2);
%         r_2(ii,jj) = sqrt((xx-x_0).^2 + yy.^2);
%     end
% end
% 
% Z_s_up = j.*((X_1./2) + (M_1./2).*cos(k_1.*n_1.*r_1 + pi)...
%       + (X_2./2) + (M_2./2).*cos(k_1.*n_1.*r_2));
% 
% Z_s_up = imag(Z_s_up);  
  

%% Impedance Surface Middle where -x_0>x>x_0  

% for ii = 1:x_0./a
%         xx = (2.*(ii-1)+1).*x_c;
%    
%     for jj = 1:num_p_y
%         yy = (2.*(jj-1)+1).*y_c;
%         r_1(ii,jj) = sqrt((xx+x_0).^2 + yy.^2);
%         r_2(ii,jj) = sqrt((xx-x_0).^2 + yy.^2);
%     end
% end  
% 
% Z_s_mid = j.*((X_1./2) + (M_1./2).*cos(k_1.*n_1.*r_1)...
%       + (X_2./2) + (M_2./2).*cos(k_1.*n_1.*r_2));  
% 
% Z_s_mid = imag(Z_s_mid);  



%% Impedance Surface Bottom where x>x_0

for ii = x_0./a:num_p_x
        xx = (2.*(ii-1)+1).*x_c;
   
    for jj = 1:num_p_y
        yy = (2.*(jj-1)+1).*y_c;
        r_1(ii,jj) = sqrt((xx+x_0).^2 + yy.^2);
        r_2(ii,jj) = sqrt((xx-x_0).^2 + yy.^2);
    end
end
Z_s_dw = j.*((X_1./2) + (M_1./2).*cos(k_1.*n_1.*r_1)...
      + (X_2./2) + (M_2./2).*cos(k_1.*n_1.*r_2 + pi));
  
Z_s_dw = imag(Z_s_dw);


%%Gap Calculation
A0 = -0.327;
A1 = 7.49e-3;
A2 = -6.76e-5;
A3 = 3.02e-7;
A4 = -6.72e-10;
A5 = 5.93e-13;

% 
% g_s_up = -100.*((A5.*(Z_s_up.^5)) + (A4.*(Z_s_up.^4)) + (A3.*Z_s_up.^3)...
%     + (A2.*(Z_s_up.^2)) + (A1.*Z_s_up) + A0);  %cubic Sim
% g_s_mid = -100.*((A5.*(Z_s_mid.^5)) + (A4.*(Z_s_mid.^4)) + (A3.*Z_s_mid.^3)...
%     + (A2.*(Z_s_mid.^2)) + (A1.*Z_s_mid) + A0);  %cubic Sim
g_s_dw = -100.*((A5.*(Z_s_dw.^5)) + (A4.*(Z_s_dw.^4)) + (A3.*Z_s_dw.^3)...
    + (A2.*(Z_s_dw.^2)) + (A1.*Z_s_dw) + A0);  %cubic Sim


% gap_mat = g_s_up;
% gap_mat = g_s_mid;
gap_mat = g_s_dw;

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
