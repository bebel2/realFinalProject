function [] = finalProject()
    global gui;
    global R;
    R = 8.314;
 gui.fig = figure('numbertitle', 'off', 'name', 'Van Der Waals Equation'); 
 gui.temperature = uicontrol('style','edit','units','normalized','position', [.35 .04 .10 .05]);
 gui.temperatureLabel = uicontrol('style','text','string','temperature in K','units','normalized','position', [.35 .14 .11 .15]);
 gui.criticalTemperature = uicontrol('style','edit','units','normalized','position', [.15 .04 .10 .05]);
 gui.criticalTemperatureLabel = uicontrol('style','text','string',' critical temperature in K','units','normalized','position', [.15 .14 .11 .15]);
 gui.criticalPressure = uicontrol('style','edit','units','normalized','position', [.05 .04 .10 .05]);
 gui.criticalPressureLabel = uicontrol('style','text','string','critical pressure in Pa','units','normalized','position', [.05 .14 .11 .15]);
 gui.specificVolume = uicontrol('style','edit','units','normalized','position', [.25 .04 .10 .05]);
 gui.specificVolumeLabel = uicontrol('style','text','string','volume','units','normalized','position', [.25 .14 .10 .15]); 
 
end
function [] = aVariable()

end
function [] = bVariable()

end
function [] = termOne()

end
function [] = termTwo()

end
function [] = calculatePressure()
P = termOne - termTwo;
end

