function [] = finalProject()
    global gui;
    global R;
    R = 8.314;
 gui.fig = figure('numbertitle', 'off', 'name', 'Van Der Waals Equation'); 
 gui.temperature = uicontrol('style','edit','units', 'normalized', 'position', [.05 .04 .10 .05]);
 gui.temperatureLabel = uicontrol('style','text','string','temperature in K','units', 'normalized', 'position', [.05 .14 .10 .10]);
 gui.criticalTemperature = uicontrol('style','edit','units', 'normalized', 'position', [.15 .04 .10 .05]);
 gui.criticalTemperatureLabel = uicontrol('style','text','string',' critical temperature in K','units', 'normalized', 'position', [.15 .14 .10 .10]);
 gui.criticalPressure = uicontrol('style','edit','units', 'normalized', 'position', [.25 .04 .10 .05]);
 gui.criticalPressureLabel =uicontrol('style','text','string','critical pressure in Pa','units', 'normalized', 'position', [.25 .14 .10 .10]);
 gui.specificVolume = uicontrol('style','edit','units', 'normalized', 'position', [.35 .04 .10 .05]);
 gui.specificVolumeLabel = uicontrol('style','text','string','volume in m^3/mol','units', 'normalized', 'position', [.35 .14 .10 .10]);

end
function [] = calculateAVariable()

end
function [] = calculateBVariable()

end
function [] = calculateTermOne()

end
function [] = calculateTermTwo()

end
function [] = calculatePressure()
P = calculateTermOne - calculateTermTwo;
end
