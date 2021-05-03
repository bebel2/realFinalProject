function [] = finalProject()
    global gui;

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
    termOne = calculateTermOne();
    termTwo = calculateTermTwo();
    P = termOne - termTwo;
    text = strcat("P = ", num2str(P));
    msgbox(text, 'Calculation')
end
function [termOne] = calculateTermOne()
    global gui
    R = 8.314;
    T = str2double(gui.temperature.String);
    V = str2double(gui.specificVolume.String);
    
    b = calculateBVariable();
    function [b] = calculateBVariable()
        criticalTemp = str2double(gui.criticalTemperature.String);
        criticalPressure = str2double(gui.criticalPressure.String);
        b = (R*criticalTemp) / (8*criticalPressure);
    end
    termOne = (R*T) / (V - b);

end
function [termTwo] = calculateTermTwo()
global gui;
R = 8.314;
A = calculateAVariable();
V = str2double(gui.specificVolume.String);
    function [A] = calculateAVariable()
        
        criticalTemp = str2double(gui.criticalTemperature.String);
        criticalPressure = str2double(gui.criticalPressure.String);
            A = (27*R^2*criticalTemp^2) / (64*criticalPressure);
    end
termTwo = A / V^2;
end

