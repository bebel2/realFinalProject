function [] = finalProject()
    global gui;
    %The display should show the equation and give the user the ability to
    %input the critical temperature, critical pressure, and volume. This
    %information is typically given in the problem or you can look it up if
    %the element or chemical compound is given.
    gui.fig = figure('numbertitle', 'off', 'name', 'Van Der Waals Equation');
    gui.equationDisplay = uicontrol('style','text','units','normalized','string','P = (RT / V-b) - (a / V^2)','position',[.35 .6 .20 .15]);
    %Displays the equation for the user
    gui.temperature = uicontrol('style','edit','units', 'normalized', 'position', [.05 .04 .10 .05]);
    %edit box to input given temperature
    gui.temperatureLabel = uicontrol('style','text','string','temperature in K','units', 'normalized', 'position', [.05 .14 .10 .10]);
    % label for the edit box so the user knows where to put the information
    gui.criticalTemperature = uicontrol('style','edit','units', 'normalized', 'position', [.15 .04 .10 .05]);
    % edit box to input the critical temperature
    gui.criticalTemperatureLabel = uicontrol('style','text','string',' critical temperature in K','units', 'normalized', 'position', [.15 .14 .10 .10]);
    %label for the box
    gui.criticalPressure = uicontrol('style','edit','units', 'normalized', 'position', [.25 .04 .10 .05]);
    % edit box to input the critical pressure
    gui.criticalPressureLabel =uicontrol('style','text','string','critical pressure in Pa','units', 'normalized', 'position', [.25 .14 .10 .10]);
    %label for the critical pressure box
    gui.specificVolume = uicontrol('style','edit','units', 'normalized', 'position', [.35 .04 .10 .05]);
    % edit box to input the specific volume
    gui.specificVolumeLabel = uicontrol('style','text','string','volume in m^3/mol','units', 'normalized', 'position', [.35 .14 .10 .10]);
    % label for the specific volume box
    gui.startButton = uicontrol('style', 'pushbutton', 'units', 'normalized', 'string', 'calculate pressure', 'position', [.55 .14 .20 .05],'callback', {@calculatePressure});
    % This button calculates the pressure the system is at, defined by the
    % equation
    gui.startButton = uicontrol('style', 'pushbutton', 'units', 'normalized', 'string', 'calculate a', 'position', [.55 .34 .20 .05],'callback', {@calculateAVariable});
    %This callback only calculates the a variable
    gui.startButton = uicontrol('style', 'pushbutton', 'units', 'normalized', 'string', 'calculate b', 'position', [.55 .24 .20 .05],'callback', {@calculateBVariable});
    %This callback only calculates the b variable
end
function [P] = calculatePressure(source,event)
        %This function chain will calculate the whole equation after the
        %inputs are entered, once the calculate pressure button is clicked.
        %It will also display a message of what P is equal to.
    global gui
    %gives access to gui
    gui.source = gui;
    termOne = calculateTermOne();
    termTwo = calculateTermTwo();
    P = termOne - termTwo;
    text = strcat("P = ", num2str(P));
    %makes a message box with the answer to the equation
    msgbox(text, 'Calculation')

    function [termOne] = calculateTermOne()
   
    R = 8.314;
    T = str2double(gui.temperature.String);
    %takes the input in the edit box and reads it as a number
    V = str2double(gui.specificVolume.String);
    %takes the input in the edit box and reads it as a number
    b = calculateBVariable();
    
        function [b] = calculateBVariable()
        R = 8.314;
        criticalTemp = str2double(gui.criticalTemperature.String);
        %takes the input in the edit box and reads it as a number
        criticalPressure = str2double(gui.criticalPressure.String);
        %takes the input in the edit box and reads it as a number
        b = (R*criticalTemp) / (8*criticalPressure);
        end
        termOne = (R*T) / (V - b);

    end
    function [termTwo] = calculateTermTwo()
        
        R = 8.314;
        A = calculateAVariable();
        V = str2double(gui.specificVolume.String);
        %takes the input in the edit box and reads it as a number
            function [A] = calculateAVariable()
                R = 8.314;
                criticalTemp = str2double(gui.criticalTemperature.String);
                %takes the input in the edit box and reads it as a number
                criticalPressure = str2double(gui.criticalPressure.String);
                %takes the input in the edit box and reads it as a number
                A = (27*R^2*criticalTemp^2) / (64*criticalPressure);
            end
        termTwo = A / V^2;
    end
end
function [A] = calculateAVariable(source,event)
        % This function onlt calculates and displays the a value from the
        % equation in case it is asked for.
       global gui; 
       gui.source = gui;
       R = 8.314;
       criticalTemp = str2double(gui.criticalTemperature.String);
        criticalPressure = str2double(gui.criticalPressure.String);
           A = (27*R^2*criticalTemp^2) / (64*criticalPressure);
    text = strcat("a = ", num2str(A));
    msgbox(text, 'Calculation')
end
    function [b] = calculateBVariable(source,event)
    %This function only calculates and displays the b value from the
    %equation in case the problem asks for it.
    global gui
    gui.source = gui;
    R = 8.314;
        criticalTemp = str2double(gui.criticalTemperature.String);
        criticalPressure = str2double(gui.criticalPressure.String);
        b = (R*criticalTemp) / (8*criticalPressure);
    text = strcat("b = ", num2str(b));
    msgbox(text, 'Calculation')
    end
