clc;
clear all;
Data = textread('EXPERIMENT_03.txt');
aData = Data(:,1)';
bData = Data(:,2)';

length_a = length(aData); length_b = length(bData);
Correlation_coefficient=(length_a*sum(aData.*bData)-sum(aData)*sum(bData))...
/sqrt((length_a*sum(aData.^2)-(sum(aData))^2)*(length_a*sum(bData.^2)-(sum(bData))^2))


%% Calculation for Line Fitting
aData=aData';
bData=bData';
A=[aData ones(length_a,1)];
an=A'*A;
bn=A'*bData;
xn=an\bn;
hold on; grid on;
subplot(2,1,1);
a1=linspace(1,100);
b1=xn(1).*a1+xn(2);
plot(aData,bData,'ob',a1,b1,'r');
title('Line Fitting');
Line_Error=A*xn-bData
fprintf("The Equation for Line Fitting is y=(%f)*x+(%f)\n",xn(1),xn(2));

%% Calculation for Parabola Fitting
A=[aData.^2 aData ones(length_a,1)];
ap=A'*A;
bp=A'*bData;
xp=ap\bp;
%%
hold on; grid on;
subplot(2,1,2);
x2=linspace(1,100);
y2=xp(1).*x2.^2+xp(2).*x2+xp(3);
plot(aData,bData,'r*',x2,y2,'k');
title('Parabola Curve Fitting');
Parabola_Error=A*xp-bData
fprintf("The Equation for Parabola Fitting is y=(%f)*x^2+(%f)*x+(%f)\n",xp(1),xp(2),xp(3));