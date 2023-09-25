function [] = HMS_New_Patchs_Sievenpiper(fid, var)

% add gap variable file here
j = sqrt(-1);
Z_0 = 377;
c = 3e8;
a = 3e-3;
f = 17e9;
omega = 2*pi*f; 
phi_fixed = deg2rad(72);
k_t = phi_fixed./a;
n = (k_t.*c)./omega;
k_0 = omega./c;

X = 197.5;
% M = 0.1753;
M = 36.5;
theta_L = 60;
phi_L = 0;


x = 30e-3;
y = 30e-3;

num_p_x = x./a;
num_p_y = y./a;

u = 1;                   % unit 
s = -1;                      % sign
x_c = a./2;
y_c = a./2;


for ii = 1:num_p_x
        xx = (2.*(ii-1)+1).*x_c;
        psi_rad(ii,1) = exp(j.*k_0.*s.*xx.*sind(theta_L) + j.*phi_fixed); 

    for jj = 1:num_p_y
        yy = (2.*(jj-1)+1).*y_c;
        r(ii,jj) = sqrt(xx.^2 + yy.^2);
%         psi_rad(ii,jj) = exp(j.*k_0.*(s.*xx.*sind(theta_L).*cosd(phi_L) + yy.*sind(theta_L).*sind(phi_L)));
    end
end


psi_surf = exp(-j.*k_0.*n.*r);


Z = j.*(X + M.*real(psi_rad.*psi_surf));
Z = imag(Z);

g = -((1.2763e-6).*(Z.^3)) + (0.00085091.*(Z.^2)) - (0.19586.*Z) + 15.794;  %cubic Sim

gap_mat = g;

for i = 1:var.m
    for j = 1:var.n
        X_pos = num2str(i)+"_"+num2str(j)+"X_pos";
%         Y_pos = num2str(i)+"_"+num2str(j)+"Y_pos";
        
        %   Creating the length variable for each element
%         gap = "gap_1st_"+num2str(i)+"_"+num2str(j);
        gap = "gap_2nd_"+num2str(i)+"_"+num2str(j);
        
        hfssAddVariable(fid, gap, num2str(gap_mat(i,j)), "mm");
      
        %% new patches
        
        point1 = [{gap}, {gap}, {"Z_sub"}];
        point2 = [{"X_sub-" + gap}, {gap}, {"Z_sub"}];
        point3 = [{"X_sub-"+gap}, {"Y_sub-" + gap}, {"Z_sub"}];
        point4 = [{gap}, {"Y_sub-" + gap}, {"Z_sub"}];
        point5 = [{gap}, {gap}, {"Z_sub"}];

        points = [point1;point2;point3;point4;point5];
%         hfssPolyline(fid, "Patch_1st_"+num2str(i)+"_"+num2str(j), points, 'true', 'Line', [var.Colors.Orange], 0.25);
        hfssPolyline(fid, "Patch_2nd_"+num2str(i)+"_"+num2str(j), points, 'true', 'Line', [var.Colors.Orange], 0.25);
        
        
        %% Move it move it
%         hfssMove(fid, {UDLineA}, ["W/2 + ("+num2str(a)+"-1)*moveX/2", "L+W+tap_w+port_y + ("+num2str(b)+"-1)*moveY/2", "-sub_h"]);
%         hfssMove(fid, {UDLineB}, ["W/2 +("+num2str(a)+"-1)*moveX/2", "L+W+tap_w +("+num2str(b)+"-1)*moveY/2", "-sub_h"]);
        
%       hfssMove(fid, "Patch_1st_"+num2str(i)+"_"+num2str(j), ["0+("+num2str(i)+"-1)*X_sub", "0+("+num2str(j)+"-1)*Y_sub", "0"]);
        hfssMove(fid, "Patch_2nd_"+num2str(i)+"_"+num2str(j), ["-X_offset-("+num2str(i)+"-1)*X_sub", "0+("+num2str(j)+"-1)*Y_sub", "0"]);

      %   hfssMove(fid, {patch}, ["("+num2str(i)+"-1)*X_sub", "("+num2str(j)+"-1)*Y_sub", ""]);        
    end
end
