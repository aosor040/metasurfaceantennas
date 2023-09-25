classdef hfss_test < handle
    properties
        % Properties to link MATLAB with HFSS
        projName
        designName
        VBSscriptName
        projDir
        hfssScriptfile
        fid
        
        % Properties for my EM design
        f
        k_0
        AP_X
        AP_Y
        dx
        dy
    end

    methods
        function obj = hfss_test(projName, designName, VBSscriptName, ...
                projDir, f, k_0, AP_X, AP_Y,dx, dy)

            obj.projName = projName;
            obj.designName = designName;
            obj.VBSscriptName = VBSscriptName;
            obj.projDir = projDir;

            obj.f = f;
            obj.k_0 = k_0;
            obj.AP_X = AP_X;
            obj.AP_Y = AP_Y;
            obj.dx= dx;
            obj.dy= dy;
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
            
            varName = 'f';
            value = obj.f;
            hfssCreateVariable(obj.fid, varName, value);
            
%             varName = 'lambda';
%             value = '300/fc';
%             hfssCreateVariable(obj.fid, varName, value, units);
                        
            varName = 'k_0';
            value = obj.k_0;
            hfssCreateVariable(obj.fid, varName, value, units);

        end

        function runVBS(obj)

            fclose(obj.fid); % close the vbs file
            runScript = ['cscript' ' ' obj.hfssScriptfile];
            system(runScript);

        end
    end
end