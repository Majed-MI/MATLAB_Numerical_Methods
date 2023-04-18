clc;
clear all;
data = textread('EXPERIMENT_03.txt');
input_1 = data(:,1)';
input_2 = data(:,2)';

length_a = length(input_1); length_b = length(input_2);
Correlation_coefficient=(length_a*sum(input_1.*input_2)-sum(input_1)*sum(input_2))...
/sqrt((length_a*sum(input_1.^2)-(sum(input_1))^2)*(length_a*sum(input_2.^2)-(sum(input_2))^2))

[A,I] = sort(input_1,'descend');
for i=1:length_a
    rx(I(i))=i;
end
[B,L] = sort(input_2,'descend');
for i=1:length_a
    ry(L(i))=i;
end
d=rx-ry;
Rank_Correlation=1-((6.* sum(d.^2))/(length_a*(length_a^2 -1)))

%% Calculation for Line Fitting
input_1=input_1';
input_2=input_2';
A=[input_1 ones(length_a,1)];
an=A'*A;
bn=A'*input_2;
xn=an\bn;
hold on; grid on;
a1=linspace(1,10);
b1=xn(1).*a1+xn(2);
Line_fitting_Error=A*xn-input_2;
Line_error=sum(Line_fitting_Error);
fprintf("The Error of Line is %d\n",Line_error);
fprintf("The Equation of Line Fitting is y=(%f)*x+(%f)\n",xn(1),xn(2));

%% Calculation for Parabola Fitting
A=[input_1.^2 input_1 ones(length_a,1)];
ap=A'*A;
bp=A'*input_2;
xp=ap\bp;
hold on; grid on;
x2=linspace(1,10);
y2=xp(1).*x2.^2+xp(2).*x2+xp(3);
plot(input_1,input_2,'ob',a1,b1,'r',input_1,input_2,'r*',x2,y2,'k');
Parabola_fitting_Error=A*xp-input_2;
Parabola_Error=sum(Parabola_fitting_Error);
fprintf("The Error of Parabola is %d\n",Parabola_Error);
fprintf("The Equation for Parabola Fitting is y=(%f)*x^2+(%f)*x+(%f)\n",xp(1),xp(2),xp(3));