Start with a test automation design.

1. Check the file 'Initialization' in the functions folder to set all the directories and generated
	file destination.

2. Check the 'RunFile' and call the specific drawing script. In this example the drwaing script we made and 
will use is 'DrawingPolyline'. This is what we have created using standard HFSS functions. Try to understand it carefully
so that simillar method can be used to recreat complex geometries.

3. File 'Variables' and 'VariablesForHFSS'are related to the drawing script 'DrawingPolyline'.

4. When you run the 'RunFile', it will generate a .vbs file in the location where you defined (in the 'Initialization' file).

5.This will also open your HFSS and create a new project and new file and will start drwaing the geometry that you made with 
'DrawingPolyline'script. The final HFSS file will be saved in the location where you defined (in the 'Initialization' file).

6. If you want to do it without HFSS opened to save time, follow 'Steps for VBS to HFSS without GUI' file. It will still run the 
code in the background and will generate the final HFSS file and will be saved in the location where you defined 
(in the 'Initialization' file).



You can use the HMS_Initialization, HMS_RunFile and etc, from the functions for HMS design which I modified for my need. 