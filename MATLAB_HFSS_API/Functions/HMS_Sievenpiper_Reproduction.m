% function [] = HMS_Sievenpiper_Reproduction(fid, ID)
function [] = HMS_Sievenpiper_Reproduction(fid, var)

% add gap variable file here

%% Variables
f = 17e9;
c = 3e8;
lambda = c./f;
omega = 2.*pi.*f;
a = 3e-3;
k = 2.*pi./lambda;
phi_fixed = deg2rad(69.15);
k_t = phi_fixed./a;
n = (k_t.*c)./omega;
j =sqrt(-1);

X = 197.1615;
M = 36.5;


%% Beam steering angles
theta = deg2rad(60);
phi= deg2rad(0);


%% Physical dimension of HMS
length_x = 201e-3;
length_y = 127e-3;
x_c = a./2;
y_c = a./2;
M_x = round(length_x./a);
N_y = round(length_y./a);

MM=-3*(M_x)/4.*a:a:(M_x)/4.*a;
NN=-(N_y)/2.*a:a:(N_y)/2.*a;


for ii = 1:numel(MM)-1
        x = MM(ii)+a/2;
    for jj = 1:numel(NN)-1
        y = NN(jj)+a/2;
        
        if y<0
        r(ii,jj) = sqrt(x.^2 + y.^2);
        psi_rad(ii,jj) = exp(j.*k.*x.*sin(theta) +j.*phi_fixed);
%         psi_rad(ii,jj) = exp(j.*k.*x.*sin(theta));

        psi_surf(ii,jj) = exp(-j.*k.*n.*r(ii,jj));
        Z(ii,jj) = imag(j.*(X + M.*(real(psi_rad(ii,jj).*conj(psi_surf(ii,jj))))));

        else y>0
        r(ii,jj) = sqrt(x.^2 + y.^2);
        psi_rad(ii,jj) = exp(j.*k.*x.*sin(theta)+j.*phi_fixed);
%         psi_rad(ii,jj) = exp(j.*k.*x.*sin(theta));        
        psi_surf(ii,jj) = exp(-j.*k.*n.*r(ii,jj));
        offset = exp(j.*pi);
        Z(ii,jj) = imag(j.*(X + M.*(real(offset.*psi_rad(ii,jj).*conj(psi_surf(ii,jj))))));
        end

    end
end

%% Gap Calculation
g = (1.721e-8).*(Z.^4) - (1.437e-5).*(Z.^3) + 0.004528.*(Z.^2) - 0.6442.*Z +35.59; %4th degree polynomial
figure()
contour(Z);
imshow(Z, []);


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
