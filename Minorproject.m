pump_close (a)
clear all;
close all;
a = arduino('/dev/cu.usbserial-0001','uno');
h = animatedline;
ax = gca;
ax.YGrid = 'on';
title('MOISTURE LEVEL');
ylabel('Voltage');
xlabel('Time');
figure (1)
starttime = 0;
ax.YLim = [0 4];
tic; % timer start
moisture = readVoltage(a,"A0");
stop = 1; %while loop condition
xdata = []; % List store for the x and y data
ydata = []; %List store for the x and y data
counter = 0; %statrt of the counter
Wet = 3.4311;
dry = 2.7851;
while stop
    moisture = readVoltage(a,"A0");
    Condition Dry
    for i = 1: stop
        counter = counter + 1; % adds one to the counter
        if moisture > Wet % If statement to sckec the status of the souil
            disp ('I am really hungry; Dry Soil') % display teh status of the soil
            pump_open (a) % Sunction to start teht pump
            Condition Almsot wet
        elseif moisture > dry % If statement to check the status of the souil when its wet but not fully wet; If true, If false jumps to Elseif
            disp ('A little bit more; Wet Soil Not enough yet') % display teh status of the soil
            pump_open (a) % Function to start teht pump
        elseif moisture <= dry % If statement to check the status of the souil when its wet but not fully wet If true, If false jumps to else
            disp ('I am Full; Enough water') % display teh status of the soil
            pump_close (a) % Function to stop the pump
        else
            stop = 0; %elose if non of the above statement are true
        end
        ydata = [ydata; moisture]; % Store Y data
        xdata = [xdata; counter];  %Store X data
        Plot_graph_one (ax,h,moisture,starttime,toc) % Live graph of teh mositure
        Plot_graph (ydata,xdata) % Graph of the Linear fit using Function
    end
end

