function hfssCreateObjectCS(fid, CS_Name, Origin, xAxisPoint, yAxisPoint)
%% How to call the function?

% hfssCreateRelativeCS(fid, "Name", [{'-sub_h'}, {'-dy/2'}, {'h1'}]);


%% Script

% Preamble.
fprintf(fid, '\n');

fprintf(fid, 'oEditor = oDesign.SetActiveEditor("3D Modeler") _\n');
fprintf(fid, 'oEditor.CreateObjectCS _\n');

% ObjectCS Parameters
fprintf(fid, 'Array("NAME:ObjectCSParameters", "PartID:=", 6, _\n');

fprintf(fid, 'Array("NAME:Origin", "IsAttachedToEntity:=", true, "EntityID:=", 28, "PositionType:=", "OnVertex", "UParam:=", 0, "VParam:=", 0, "XPosition:=", "%s", _\n', Origin{1}, '"YPosition:=", "%s", _\n', Origin{2}, '"ZPosition:=", "%s", _\n', Origin{3}), _\n);
    
fprintf(fid, '"MoveToEnd:=", false, "ReverseXAxis:=", false, "ReverseYAxis:=", false, _\n');

fprintf(fid, 'Array("NAME:xAxisPos", "IsAttachedToEntity:=", true, "EntityID:=", 25, "PositionType:=", "OnVertex", "UParam:=", 0, "VParam:=",0,_\n');
fprintf(fid, '"XPosition:=", "%s", _\n', xAxisPoint{1}); 
fprintf(fid, '"YPosition:=", "%s", _\n', xAxisPoint{2});
fprintf(fid, '"ZPosition:=", "%s", _\n', xAxisPoint{3});


fprintf(fid, 'Array("NAME:yAxisPos", "IsAttachedToEntity:=",' true)
"EntityID:=", 25, "PositionType:=", "OnVertex", "UParam:=", 0, "VParam:=",0,_\n');
fprintf(fid, '"XPosition:=", "%s", _\n', yAxisPoint{1}); 
fprintf(fid, '"YPosition:=", "%s", _\n', yAxisPoint{2});
fprintf(fid, '"ZPosition:=", "%s", _\n', yAxisPoint{3});

% fprintf(fid, 'Array("NAME:yAxisPos", "IsAttachedToEntity:=", true, "EntityID:=", 27, "PositionType:=", "OnVertex", "UParam:=", 0, "VParam:=", 0, "XPosition:=", "0", "YPosition:=", "0", "ZPosition:=", "0")),  _\n');

fprintf(fid, 'Array("NAME:Attributes", "Name:=", "%s",_\n', CS_Name);


end