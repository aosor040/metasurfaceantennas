classdef squareRA < handle
    properties
        projName
        designName
        VBSscriptName
        projDir
        ScurveDir
        hfssScriptfile
        fid
        fc
        Sub
        subH
        dx
        dy
        AP_X
        AP_Y
        AP_A
        thetaB_deg
        phiB_deg
        mainB_rad
        phaseK
        feedTheta_deg
        feedTheta_rad
        feedH
        feedPos
        feedQ
        Sigma_deg
        maxDeltaE
        maxPass
        minConvPass
        machineTol
        Lambda
        k0
        Mx
        Ny
        AP_Xmax
        AP_Xmin
        AP_Ymax
        AP_Ymin
        x_vect
        y_vect
        z_vect
        XmatCalc
        YmatCalc
        ZmatCalc
        XmatVis
        YmatVis
        ZmatVis
        RP_vect
        RealPhase_vect
        RPVis_mat
        PatchDim_vect
        patchName
        EE
        EE_real
        D
        D_real
        Z0
    end
    
    methods
        function obj = squareRA(projName, designName, VBSscriptName, projDir, ScurveDir, fc, Sub, subH, dx, dy, AP_X, AP_Y, ...
                thetaB_deg, phiB_deg, phaseK, feedTheta_deg, feedQ, maxDeltaE, maxPass, minConvPass, machineTol)
            
            if nargin < 20
                error("Not enough input arguments");
            end
            
            obj.projName = projName;
            obj.designName = designName;
            obj.VBSscriptName = VBSscriptName;
            obj.projDir = projDir;
            obj.ScurveDir = ScurveDir;
            obj.fc = fc;
            obj.Lambda = 300/obj.fc;
            obj.Sub = Sub;
            obj.subH = subH;
            obj.dx = dx *obj.Lambda;
            obj.dy = dy*obj.Lambda;
            obj.AP_X = AP_X*obj.Lambda;
            obj.AP_Y = AP_Y*obj.Lambda;
            obj.AP_A = obj.AP_X * obj.AP_Y;
            obj.thetaB_deg = thetaB_deg;
            obj.phiB_deg = phiB_deg;
            obj.mainB_rad = [deg2rad(thetaB_deg) deg2rad(phiB_deg)];
            obj.phaseK = phaseK;
            obj.feedTheta_deg = feedTheta_deg;
            obj.feedTheta_rad = feedTheta_deg*pi/180;
            obj.feedQ = feedQ;
            obj.maxDeltaE = maxDeltaE;
            obj.maxPass = maxPass;
            obj.minConvPass = minConvPass;
            obj.machineTol = machineTol;
            
            obj.k0 = 2*pi/obj.Lambda;
            obj.AP_Xmax = obj.AP_X/2;
            obj.AP_Xmin = -obj.AP_Xmax;
            obj.AP_Ymax = obj.AP_Y/2;
            obj.AP_Ymin = -obj.AP_Ymax;
            
%             varDir = 'C:\Users\arubi010\Documents\Hex_Paper\Hexagonal Structure\Z0';
%             load(varDir)
%             obj.Z0 = Z0;
%             
            %Calculate solid angle
%             u =[abs(obj.AP_Xmin-obj.feedPos(1)) obj.feedPos(3)];
%             v = [abs(obj.AP_Xmax-obj.feedPos(1)) obj.feedPos(3)];
%             CosSigma = max(min(dot(u,v)/(norm(u)*norm(v)),1),-1);
%             obj.Sigma_deg = real(acosd(CosSigma));
        end
        
        function discretizeAP(obj)  
            % Calculate center points for each element to plot phase wrt distance
            [obj.x_vect, obj.y_vect,obj. z_vect, obj.Ny, obj.Mx] = Aperture_mapping(obj.AP_X, obj.AP_Y, obj.dx, obj.dy);
            
%             Z0 = [1:10 40:50 70:80 91:96];
%             obj. z_vect(Z0) = 8;
            % Plot UC postions          
            PlotDiscritSquareAP(obj.Lambda, obj.AP_X, obj.AP_Y, obj.dx, obj.dy, obj.x_vect, obj.y_vect)
            
            % Discretize the AP for graphics
            x_vectCalc = -(obj.Mx-1)/2*obj.dx:obj.dx:((obj.Mx-1)/2*obj.dx)+obj.dx;
            y_vectCalc = -(obj.Ny-1)/2*obj.dy:obj.dy:((obj.Ny-1)/2*obj.dy)+obj.dy;
            z_vectCalc = 0;
            [obj.XmatCalc,obj.YmatCalc,obj.ZmatCalc]=meshgrid(x_vectCalc, y_vectCalc, z_vectCalc);
            [obj.XmatVis,obj.YmatVis,obj.ZmatVis]=meshgrid(x_vectCalc-(obj.dx/2), y_vectCalc-(obj.dy/2), z_vectCalc);
            
        end
        
        function calcOptimalFeedPos(obj)
            A = obj.AP_A/1e6;
            ElementQ =1;
            Hlo = 5;
            Hhi= 30;
%             ThetaFeed_radd = obj.feedTheta_rad;
            lambda_m = obj.Lambda/1e3;
            ddx = obj.dx/1e3;
            ddy = obj.dy/1e3;
            Xvect = obj.x_vect/1e3;
            Yvect = obj.y_vect/1e3;
            Zvect = obj.z_vect/1e3;

            [Opt_Apperture_EFF_v1,Opt_H_v1,x_feed_E_v1,Ns,Ni,Na,H_RA_v1]=  OptimalEfficiencyV3(A,Xvect,Yvect,...
                Zvect,ddx,ddy,lambda_m,obj.feedQ,ElementQ,Hlo,Hhi,obj.feedTheta_rad);

                      
            windowDim = [100 100 1000 600];
            xLim = [Hlo Hhi];
            yLim = [0.5 1];
            XStep = 1;
            YStep = 0.1;
            Xdec = '0';
            Ydec = '1';
            xLabel = '{\it H} (\lambda)';
            yLabel = 'Efficiency';
            Title = ["Aperture Efficiencies"];
            FontName = 'Times New Roman';
            FontSize = 20;
            XTickLabelRotation = 0;
            YTickLabelRotation = 0;
            
            figure('Position', windowDim)
            hold on
            plot(H_RA_v1,Ns,'b','linewidth',3)
            plot(H_RA_v1,Ni,'g','linewidth',3)
            plot(H_RA_v1,Na,'r','linewidth',3)
            ax = gca;
            tonysPlot(ax, xLim, yLim, XStep, Xdec, YStep, Ydec, xLabel, yLabel, Title, FontName, FontSize, XTickLabelRotation, YTickLabelRotation)
            
            legend('Ns', 'Ni', 'Na')
            
            [M, I] = max(Na);
            
            obj.feedH = H_RA_v1(I);
            
            feedX = -obj.feedH*tan(obj.feedTheta_rad);
            feedY = 0;
            feedZ = obj.feedH;
            obj.feedPos = [feedX feedY feedZ];
            obj.feedPos = obj.feedPos * obj.Lambda;

        end
        
        function calcContPhaseDist(obj)
            %% Calculate Continuous Phase Distribution
            % Calculate continuous phase distribution
            Step = 0.1;
            x_vectCalc = -(obj.Mx-1)/2*obj.dx:Step:((obj.Mx-1)/2*obj.dx)+obj.dx;
            y_vectCalc = -(obj.Ny-1)/2*obj.dy:Step:((obj.Ny-1)/2*obj.dy)+obj.dy;
            z_vectCalc = 0;
            [XmatContCalc,YmatContCalc,ZmatContCalc]=meshgrid(x_vectCalc, y_vectCalc, z_vectCalc);
            [XmatContVis,YmatContVis,ZmatContVis]=meshgrid(x_vectCalc-(obj.dx/2), y_vectCalc-(obj.dy/2), z_vectCalc);
            
            ContPhase_mat = phase_mapping(obj.feedPos, obj.thetaB_rad, obj.phiB_rad, XmatContCalc, YmatContCalc, ZmatContCalc, obj.k0, obj.phaseK);
            
            % Plot continuous phase distribution
            Title = {'Continuous Phase Distribution', 'Square Aperture'};
            PlotPhaseDistSquareAP(obj.Lambda, obj.AP_X, obj.AP_Y, XmatContVis, YmatContVis, ContPhase_mat, Title)
            shading interp
                        
        end
        
        function calcReqPhaseDist(obj)
            % Calculate Required Phase distribution that will be used in the actual RA model            
            obj.RP_vect = phase_mapping(obj.feedPos, obj.mainB_rad, obj.x_vect, obj.y_vect, obj.z_vect, obj.k0, obj.phaseK);
            
            % Plot Req Phase Dist
            % Calculate Req phase distribution for graphics
            obj.RPVis_mat = phase_mapping(obj.feedPos, obj.mainB_rad, obj.XmatCalc, obj.YmatCalc, obj.ZmatCalc, obj.k0, obj.phaseK);
            % Plot continuous ideal distribution
            Title = {'Ideal Phase Distribution', 'Square Aperture'};
            PlotPhaseDistSquareAP(obj.Lambda, obj.AP_X, obj.AP_Y, obj.XmatVis, obj.YmatVis, obj.RPVis_mat, Title);
        end
        
        function createRealPhaseDist(obj)
            %Import S-curve
            T = readtable(obj.ScurveDir, 'HeaderLines',1);
            T = table2array(T);
            patchDims_vect = T(:,1);
            phase = T(:,3);
            
            % Interpolate the S-curve and phase wrap to 360deg
            patchDims_vect = patchDims_vect * obj.Lambda;
            patchDimsInterp = patchDims_vect(1):obj.machineTol:patchDims_vect(end);
            phase = interp1(patchDims_vect,phase,patchDimsInterp);
            patchDims_vect = patchDimsInterp;            
            new_phase = wrapTo360(phase);
            
            % Define the patch sizes for each UC on the AP
            [obj.PatchDim_vect, ~, obj.RealPhase_vect] = createPatchDimDist(new_phase, patchDims_vect, obj.RP_vect);          
            
            %% Plot the  Relealized phase and patch size distribution
            ReqPhaseVis_vect = reshape(obj.RPVis_mat,[],1);
            
            [PatchDimVectVis, PhaseErrorVectVis, RealPhaseVectVis] = createPatchDimDist(new_phase, patchDims_vect, ReqPhaseVis_vect);  

            RealPhaseMatVis = reshape(RealPhaseVectVis,obj.Ny+1,[]);
            PatchDimMatVis = reshape(PatchDimVectVis,obj.Ny+1,[]);
            PhaseErrorMatVis = reshape(PhaseErrorVectVis,obj.Ny+1,[]);
            
            % Plot Realized phase distribution
            Title = {'Realized Phase Distribution', 'Square Aperture'};
            PlotPhaseDistSquareAP(obj.Lambda, obj.AP_X, obj.AP_Y, obj.XmatVis, obj.YmatVis, RealPhaseMatVis, Title);
            
            % Plot Realized phase error distribution
            Title = {'Phase Error Distribution', 'Square Aperture'};
            colorMapLabel = 'Phase Error';
            maxError = max(max(PhaseErrorMatVis));
            tixEnd = maxError+mod(-maxError,5);
            colorTix = 0:10:tixEnd;
            PlotPhaseDistSquareAP(obj.Lambda, obj.AP_X, obj.AP_Y, obj.XmatVis, obj.YmatVis, PhaseErrorMatVis, Title, colorTix,colorMapLabel);
            
            % Plot Realized patch size distribution
            Title = {'Patch Size Distribution', 'Square Aperture'};
            colorMapLabel = 'Patch Size';
            maxSize = max(max(PatchDimMatVis));
            tixEnd = maxSize+mod(-maxSize,1);
            colorTix = 2:1:tixEnd;
            tixSymb = 'mm';
            PlotPhaseDistSquareAP(obj.Lambda, obj.AP_X, obj.AP_Y, obj.XmatVis, obj.YmatVis, PatchDimMatVis, Title, colorTix,colorMapLabel,tixSymb);

        end
        
        function [FF] = calcRadPattern(obj, RP)
             % Calculate Rad pattern            
            element_q=1;deltaPT=1;
            [FF,~]=Theory4(obj.fc, obj.k0, deltaPT, obj.feedPos(1), ...
                obj.feedPos(2), obj.feedPos(3), obj.feedQ, element_q, ...
                RP(:), obj.x_vect(:), ...
                obj.y_vect(:), obj.z_vect(:));
            
            [radpattern_dB, radpattern_dB_plane] = theory4_returnRadPattern(FF, obj.phiB_deg);
            %% plot 3D pattern
            theta = 0:180;
            phi = 0:359;
            
            [Phi, Theta] = meshgrid(phi, theta);
            radpattern_dB(radpattern_dB < -30) = -30;
            s = surf(Phi, Theta, radpattern_dB);
            view(0,90)
            xlabel('Phi')
            ylabel('Theta')
            s.EdgeColor = 'interp';
            colorbar
            colormap jet
            
            %% plot Elavation plane at phiB_deg
            windowDim = [100 100 1000 600];
            xLim = [-90 90];
            yLim = [-50 10];
            XStep = 30;
            YStep = 10;
            Xdec = '0';
            Ydec = '0';
            xLabel = '\theta (\circ)';
            yLabel = 'Radiation Pattern (dB)';
            Title = "";
            FontName = 'Times New Roman';
            FontSize = 20;
            XTickLabelRotation = 0;
            YTickLabelRotation = 0;
            
            %Plot Rad Pattern
            x = -180:deltaPT:180;
            y = radpattern_dB_plane;
            
            figure('Position', windowDim)
            hold on
            plot(x,y, '-black', 'LineWidth',3)
            ax = gca;
            tonysPlot(ax, xLim, yLim, XStep, Xdec, YStep, Ydec, xLabel, ...
                yLabel, Title, FontName, FontSize, XTickLabelRotation, YTickLabelRotation)
            legend("Ideal", "Realized")
            
        end
        
        function createHFSSproj(obj)
            % Create new HFSS Proj
            [obj.hfssScriptfile, obj.fid] =...
                hfssProjectSetUp(obj.VBSscriptName, obj.projName, obj.projDir);
            % Create new HFSS Design
            hfssInsertDesign(obj.fid, obj.designName);
        end
        
        function createVars(obj)
            % Create HFSS Variables *****
            units = 'mm';
            
            varName = 'fc';
            value = obj.fc;
            hfssCreateVariable(obj.fid, varName, value);
            
            varName = 'lambda';
            value = '300/fc';
            hfssCreateVariable(obj.fid, varName, value, units);
                        
            varName = 'AP_X';
            value = obj.AP_X;
            hfssCreateVariable(obj.fid, varName, value, units);
            
            varName = 'AP_Y';
            value = obj.AP_Y;
            hfssCreateVariable(obj.fid, varName, value, units);
            
            varName = 'subH';
            value = obj.subH;
            hfssCreateVariable(obj.fid, varName, value, units);
            
        end
        
        function createSubstrate(obj)
            % Create Substrate
            Obj = 'Substrate';
            Start = ["-AP_X/2", "-AP_Y/2", "-subH"];
            Size = ["AP_X", "AP_Y", "subH"] ;
            Material = obj.Sub;
            Color = [0 0 0];
            tonysBox(obj.fid, Obj, Start, Size, Material)
        end
        
        function createGND(obj)
            % Create GND
            Obj = 'GND';
            Axis = 'Z';
            Start = ["-AP_X/2", "-AP_Y/2", "-subH"];
            Width = 'AP_X';
            Height = 'AP_Y';
            Color = [255, 128, 0];
            tonysRectangle(obj.fid, Obj, Axis, Start, Width, Height, Color)
            
            % Assign PerfE boundary
            Name = 'PerfE1';
            Type = 0; % 0-object; 1-face
            ObjectList = "GND";
            hfssAssignPE(obj.fid, Name, Type, ObjectList)
        end
        
        function createPatches(obj)
            numUCs = length(obj.PatchDim_vect);
            obj.patchName = strings(numUCs,1);
            for i = 1:numUCs
                obj.patchName(i) = createUnitCell(obj.fid, obj.x_vect(i), obj.y_vect(i), obj.z_vect(i), obj.PatchDim_vect(i), i);
            end
            
            % Assign PerfE boundary
            Name = 'PerfE2';
            Type = 0; % 0-object; 1-face
            ObjectList = obj.patchName;
            hfssAssignPE(obj.fid, Name, Type, ObjectList)
            
        end
        
        function createRegion(obj)
            tonysCreateFEBIRegion(obj.fid, obj.fc)
        end
        
        function createFEBIHFSSproj(obj)
            obj.createHFSSproj
            Name = "feedAntenna"; 
            Origin = obj.feedPos;
            theta = sprintf("180deg + %ddeg", obj.feedTheta_deg);
            phi = "180deg";
            tonysCreateRelativeCS(obj.fid, Name, Origin, theta, phi)
        end
           
        function createSolutionSetup(obj)
            % Setting up Solution and Sweep *****
            % Soultion
            setupName= 'Setup1';
            fGHz = obj.fc;
            maxDeltaE = obj.maxDeltaE;
            maxPass = obj.maxPass;
            minPass = 1;
            minConvPass = obj.minConvPass;
            MaxRef = 30;
            hfssTonysSolutionSetup(obj.fid, setupName, fGHz, maxDeltaE, maxPass, minPass,...
                minConvPass, MaxRef)
        end
        
        function runVBS(obj, CMD_line_array)
            
            if isempty(CMD_line_array)            
                fclose(obj.fid); % close the vbs file
                runScript = ['cscript' ' ' obj.hfssScriptfile];
                system(runScript);
                
            else
                fprintf(obj.fid, 'oProject.SaveAs "%s%s.aedt", true\n', ...
                    CMD_line_array(1),CMD_line_array(2)); % print the line in save location in the .vbs file
                fclose(obj.fid);
            end
        end
    end
end