function [] = finalProject()
    global gui;
    global R;
    R = 8.314;
 gui.fig = figure('numbertitle', 'off', 'name', 'Van Der Waals Equation');
 gui.equationDisplay = uicontrol('style','text','units','normalized','string','P = (RT / V-b) - (a / V^2)','position',[.35 .6 .20 .15]);
 gui.temperature = uicontrol('style','edit','units', 'normalized', 'position', [.05 .04 .10 .05]);
 gui.temperatureLabel = uicontrol('style','text','string','temperature in K','units', 'normalized', 'position', [.05 .14 .10 .10]);
 gui.criticalTemperature = uicontrol('style','edit','units', 'normalized', 'position', [.15 .04 .10 .05]);
 gui.criticalTemperatureLabel = uicontrol('style','text','string',' critical temperature in K','units', 'normalized', 'position', [.15 .14 .10 .10]);
 gui.criticalPressure = uicontrol('style','edit','units', 'normalized', 'position', [.25 .04 .10 .05]);
 gui.criticalPressureLabel =uicontrol('style','text','string','critical pressure in Pa','units', 'normalized', 'position', [.25 .14 .10 .10]);
 gui.specificVolume = uicontrol('style','edit','units', 'normalized', 'position', [.35 .04 .10 .05]);
 gui.specificVolumeLabel = uicontrol('style','text','string','volume in m^3/mol','units', 'normalized', 'position', [.35 .14 .10 .10]);
 gui.startButton = uicontrol('style', 'pushbutton', 'units', 'normalized', 'string', 'calculate pressure', 'position', [.55 .14 .20 .05],'callback', {@calculatePressure});
end
function [P] = calculatePressure(source,event)
global gui
gui.source = gui;
P = termOne - termTwo;
end
function [termOne] = calculateTermOne(source,event)

   global R
    function [] = calculateBVariable()
        
    end
T = str2double(gui.temperature);
V = str2double(gui.specificVolume);

termOne = (R*T) / (V - b);

end
function [termTwo] = calculateTermTwo(source,event)
    function [A] = calculateAVariable()
    global R
    
    
    end
V = str2double(gui.specificVolume);
termTwo = A / V^2;
end

