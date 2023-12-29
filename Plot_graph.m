function Plot_graph (ydata,xdata)
figure (2)
ypt = 1/(max(ydata)); %Convevet Highest value to 1 so The Wet soild would be donated by 1, 0 Being the dry
p = polyfit(xdata,ypt*ydata,1); % Ploynomial fit for teh data stored into x & y component
f = polyval(p,xdata); % Evulation of p at every x point
plot(xdata,ypt*ydata,'x',xdata,f,'-','LineWidth',1); % Live updating grah Ploting x data with converted y data as "x" and equation of line as "-"
eqn = string("y = " + p(1)) + "x + " + string(p(2)); %Writing the Equation of teh line p(1) being the slop and p2 being y intersept
text (min(xdata),max(ypt*ydata),eqn,"HorizontalAlignment","left","VerticalAlignment","middle")%%% Fixed  Bottom corner
legend('Moisture data','linear fit') % Label for graph
title('Live modle of moisture sencor'); % Label for graph
ylabel('Saturation of soil');% Label for graph
xlabel('Time');% Label for graph
end

%Citation 
% DeLand, S (2022) linear fit [MATLAB]. https://www.mathworks.com/matlabcentral/answers/27600-linear-fit
