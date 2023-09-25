function hfssLP(fid, PortName, ObjName, iLStart, iLEnd, Resistance, Mag, Phase)

% ObjName = name of the object on which you want to assign the lumped port
% iLStart = starting point of the integration line 
% iLEnd = ending point of the integration line


% How to call the funtion
% hfssLP(fid, "PortName", "ObjectName", [1, 2, 3], [1, 2, 3], 170, 1, Phase);

fprintf(fid, '\n'); % always start with the next line
fprintf(fid, 'Set oModule = oDesign.GetModule("BoundarySetup") \n');
fprintf(fid, 'oModule.AssignLumpedPort _\n');
fprintf(fid, 'Array("NAME:1", "Objects:=", Array("%s"), _\n',ObjName);

fprintf(fid, '"RenormalizeAllTerminals:=", true, "DoDeembed:=", false, Array("NAME:Modes", Array("NAME:Mode1", "ModeNum:=", 1, "UseIntLine:=",  _\n');
fprintf(fid, 'true, Array("NAME:IntLine", "Start:=", Array("%fmm", "%fmm", "%fmm"), _\n', iLStart(1), iLStart(2), iLStart(3));
fprintf(fid, '"End:=", Array("%fmm", "%fmm", "%fmm")), _\n', iLEnd(1), iLEnd(2), iLEnd(3) );
fprintf(fid, '"AlignmentGroup:=", 0, "CharImp:=", "Zpi", "RenormImp:=", "%fohm")), _\n', Resistance);
fprintf(fid, '"ShowReporterFilter:=", false, "ReporterFilter:=", Array(true), "Impedance:=", "%fohm") \n', Resistance);

fprintf(fid, 'oDesign.ChangeProperty Array("NAME:AllTabs", _\n');
fprintf(fid, 'Array("NAME:HfssTab", Array("NAME:PropServers",  _\n');
fprintf(fid, '"BoundarySetup:1"), Array("NAME:ChangedProps", _\n');
fprintf(fid, 'Array("NAME:Name", "Value:=", "%s")))) \n', PortName);

fprintf(fid, '\n'); % always start with the next line
fprintf(fid, 'Set oModule = oDesign.GetModule("Solutions") \n');
fprintf(fid, 'oModule.EditSources Array(Array("IncludePortPostProcessing:=", _\n');
fprintf(fid, 'false, "SpecifySystemPower:=", false), _\n');
fprintf(fid, 'Array("Name:=", "%s:1",, _\n', PortName);
fprintf(fid, '"Magnitude:=", "%fW",, _\n', Mag);
fprintf(fid, '"Phase:=", "%fdeg")) \n', Phase);

end