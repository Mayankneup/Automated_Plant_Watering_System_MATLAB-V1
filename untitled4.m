clear all;
close all;
a = arduino('/dev/cu.usbserial-0001','uno');
SensorPin = "A0";
PumpPin = "D4";
ButtonPin = "D7";
buttonState = 0;

moistureData = []
time = []

tic
while(buttonState == 0)
    buttonState = readDigitalPin(a, ButtonPin);
    state = moisture(a, SensorPin);

    if(state(1) == "wet")
        writeDigitalPin(a, PumpPin, 0);
        disp("Soil is wet, no water needed")
    elseif(state(1) == "dry")
        writeDigitalPin(a, PumpPin, 1)
        disp("Soil is dry, watering...")
    else
        disp("this isnt supposed to happen!, soil isnt dry or wet")
    end

    figure(1)
    moistureData(end+1) = state(2);
    time(end+1) = toc;
    plot(time, moistureData);
    drawnow;
    writeDigitalPin(a, PumpPin, 0);
    figure (2)
        plot(moistureData, time); %%% DO magic here to get the other graph
        %
        %
%
%

end

function [plantState, moisture] = moisture(board, sensorPin)

    moisture = readVoltage(board, sensorPin);

    if(moisture > 3.5)
        disp("Dry");
        plantState = ["dry", moisture];
    elseif(moisture < 3.5 && moisture > 2.8)
        disp("wet, but could use more")
        plantState = ["dry", moisture];
    elseif(moisture <= 2.8)
        disp("Wet enough");
        plantState = ["wet", moisture];
    else
        disp("How did you get here??");
        plantState = ["Error", moisture]
    end
end