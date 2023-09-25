function [] = APS_Foldable_0_60_Gradient(fid, var)

% add gap variable file here

%% Variables
f = 30e9;
c = 3e8;
lambda = c./f;
omega = 2.*pi.*f;
a = 2e-3;
k_0 = 2.*pi./lambda;


%% n calculation from the eigenmode analysis
phi_fixed = deg2rad(81.0967);
k_t = phi_fixed./a;
n = (k_t.*c)./omega;

j =sqrt(-1);

X = 193.3087;
Mdl = 0.2*X;

%% Beam steering angles
theta_1 = deg2rad(30);
phi_1 = deg2rad(0);
%% Physical dimension of HMS
length_x = 150e-3;
length_y = 150e-3;
x_c = a./2;
y_c = a./2;
M_x = round(length_x./a);
N_y = round(length_y./a);


MM=-(M_x)./2.*a:a:(M_x)./2.*a;
NN=-(N_y)./2.*a:a:(N_y)./2.*a;
x_0 = -50e-3;
y_0 = 0e-3;
pi_offset = exp(j.*pi);

r = 150e-3;

for ii = 1:numel(MM)-1
        xx = MM(ii)+a/2;
    for jj = 1:numel(NN)-1
        yy = NN(jj)+a/2;
        
        r_temp = sqrt((xx).^2 + (yy).^2);
        r_1(ii,jj) = sqrt((xx-x_0).^2 + (yy-y_0).^2);
        
        
    if r_temp<r
        psi_obj_1(ii,jj) = exp(-j.*k_t.*(xx.*sin(theta_1).*cos(phi_1) + yy.*sin(theta_1).*sin(phi_1)));
        psi_ref_1(ii,jj) = exp(-j.*k_0.*n.*r_1(ii,jj));
        
        if yy<xx.*atan(phi_1)+y_0
        Z_s(ii,jj) = imag(j.*(X + (Mdl.*(real(psi_obj_1(ii,jj).*conj(psi_ref_1(ii,jj)).*pi_offset)))));...
        else  yy>xx.*atan(phi_1)+y_0  
        Z_s(ii,jj) = imag(j.*(X + (Mdl.*(real(psi_obj_1(ii,jj).*conj(psi_ref_1(ii,jj)))))));...
        
        end
    end

    end
end

Z_s(Z_s==0) = NaN;


%% Gap Calculation
g = - (1.02e-6).*(Z_s.^3) + 0.0006935.*(Z_s.^2) - 0.1613.*Z_s + 13.15; %cubic Polynomial Mode_1

% g(isnan(g)) = -100;


% g(g>0.5) = 1.75;
% g(g<0.5) = min(min(g));


figure()
contour(g);
imshow(g, []);

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
