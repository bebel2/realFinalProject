function [] = finalProject()
    global gui;
    global R;
    R = 8.314;
 gui.fig = figure('numbertitle', 'off', 'name', 'Van Der Waals Equation'); 
 gui.temperature = uicontrol('style','slider');
 gui.temperatureLabel = uicontrol('style','text','string','slide to your temperature in Kelvin');
 gui.criticalTemperature = uicontrol('style','edit');
 gui.criticalPressure = uicontrol('style','edit');
 gui.specificVolume = uicontrol('style','edit');
    

end
function [] = aVariable()

end
function [] = bVariable()

end
function [] = termOne()

end
function [] = termTwo()

end

