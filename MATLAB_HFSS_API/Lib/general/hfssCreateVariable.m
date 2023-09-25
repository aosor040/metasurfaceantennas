function hfssCreateVariable(fid, varName, value, units)
% Creates the VB Script necessary to create a variable for HFSS project.
%
% Parameters :
% fid:				file identifier of the HFSS script file.
% varName:          Name of the variable being created (Ex. 'a', 'height', etc).
% value:            Numerical value assigned to the variable (DOUBLE).
% Units:			Units of the variable (specify using either 'in', 'mm',
%                   'm' or anything else defined in HFSS).
if (nargin < 3)
    error('Insufficient number of arguments !');
elseif (nargin < 4)
    units = [];
end

fprintf(fid, '\n');
fprintf(fid, 'oDesign.ChangeProperty _\n');
fprintf(fid, 'Array("NAME:AllTabs", _\n');
fprintf(fid, 'Array("NAME:LocalVariableTab", _\n');
fprintf(fid, 'Array("NAME:PropServers", "LocalVariables"), _\n');
fprintf(fid, 'Array("NAME:NewProps", _\n');
fprintf(fid, 'Array("NAME:%s", _\n', varName);
fprintf(fid, '"PropType:=", "VariableProp", _\n');
fprintf(fid, '"UserDef:=", true, _\n');

if ischar(value(1,1))
    fprintf(fid, '"Value:=", "(%s)%s"))))\n', value, units);
else
    fprintf(fid, '"Value:=", "%f%s"))))\n', value, units);
end

end
