function [] = Square_Aperture_HMS(fid, var)

% add gap variable file here


%% Variables
f = 30e9;
c = 3e8;
lambda = c./f;
omega = 2.*pi.*f;
a = 2e-3;
k_0 = 2.*pi./lambda;
zeta = 377;

%% n calculation from the eigenmode analysis
phi_fixed = deg2rad(116.5944);
k_t = phi_fixed./a;
n = (k_t.*c)./omega;

j =sqrt(-1);

X = 479.5972;
% Mdl = 38.6617;
Mdl = 0.1*X;

%% Beam steering angles
theta_1 = deg2rad(0);
theta_2 = deg2rad(0);
phi_1 = deg2rad(0);
phi_2 = deg2rad(0);
%% Physical dimension of HMS
length_x = 70e-3;
length_y = 70e-3;
x_c = a./2;
y_c = a./2;
M_x = round(length_x./a);
N_y = round(length_y./a);


MM=-(M_x)./2.*a:a:(M_x)./2.*a;
NN=-(N_y)./2.*a:a:(N_y)./2.*a;
x_0 = 0e-3;
y_0 = 0e-3;
pi_offset = exp(j.*0);

beta_sw = k_0.*sqrt(1+(X./zeta).^2);

% r = length_x/2;
r = length_x;


for ii = 1:numel(MM)-1
        xx = MM(ii)+a/2;
    for jj = 1:numel(NN)-1
        yy = NN(jj)+a/2;
        
        r_temp = sqrt((xx).^2 + (yy).^2);
        
        if r_temp<r        
        [theta,rho] = cart2pol(xx,yy);

        Z_s(ii,jj) = (X + (Mdl.*sin(beta_sw.*rho-theta)));
        
        end
    end
end

Z_s(Z_s==0) = NaN;


%% Gap Calculation
g = (-6.907e-8).*(Z_s.^3) + (0.0001111).*(Z_s.^2) - (0.06542).*Z_s + (14.03); %cubic Polynomial


figure()
contour(Z_s);
imshow(Z_s, []);


gap_mat = g;


for i = 1:var.m
    for j = 1:var.n
        X_pos = num2str(i)+"_"+num2str(j)+"X_pos";
%         Y_pos = num2str(i)+"_"+num2str(j)+"Y_pos";
        
        %   Creating the length variable for each element
        gap = "gap"+num2str(i)+"_"+num2str(j);
%         gap = "gap_2nd_"+num2str(i)+"_"+num2str(j);
        
%         if gap_mat(i,j)~= 13.15
        if gap_mat(i,j)<2

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
end
