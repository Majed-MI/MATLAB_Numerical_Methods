clc;
clear all;
infile = 'EXPERIMENT_03.txt';
data = load(infile, '-ascii');
x = data(:,1);
y = data(:,2);
m=length(x);
linear_correlation=(m*sum(x.*y)-sum(x)*sum(y))/sqrt((m*sum(x.^2)-(sum(x))^2)*(m*sum(y.^2)-(sum(y))^2));
fprintf("The Linear Correlation is : %.5f\n",linear_correlation);

[A,I] = sort(x,'descend');
for i=1:m
    rx(I(i))=i;
end
[B,L] = sort(y,'descend');
for i=1:m
    ry(L(i))=i;
end
d=rx-ry;
rho=1-((6.* sum(d.^2))/(m*(m^2 -1)));
fprintf('Rank Correlation =%.4f\n',rho);

input_1st=x';
input_2nd=y';
A=[input_1st ones(m,1)];
an=A'*A;
bn=A'*input_2nd;
xn=an\bn;
hold on; grid on;
subplot(2,1,1);
x1=linspace(1,100);
y1=xn(1).*x1+xn(2);
plot(input_1st,input_2nd,'ob',x1,y1,'r');
title('Line Fitting');
err=A*xn-input_2nd;
fprintf("The Updated Equation for Least Square Line is y=(%f)*x+(%f)\n",xn(1),xn(2));