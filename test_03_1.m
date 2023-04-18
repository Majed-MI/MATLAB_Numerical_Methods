clc;
clear all;
infile = 'EXPERIMENT_03.txt';
data = load(infile, '-ascii');
input_1 = data(:,1);
input_2 = data(:,2);
n=length(input_1);
linear_correlation=(n*sum(input_1.*input_2)-sum(input_1)*sum(input_2))/sqrt((n*sum(input_1.^2)-(sum(input_1))^2)*(n*sum(input_2.^2)-(sum(input_2))^2));
fprintf("The Linear Correlation is : %.5f\n",linear_correlation);

[A,I] = sort(input_1,'descend');
for i=1:n
    rx(I(i))=i;
end
[B,L] = sort(input_2,'descend');
for i=1:n
    ry(L(i))=i;
end
d=rx-ry;
rho=1-((6.* sum(d.^2))/(n*(n^2 -1)));
fprintf('Rank Correlation =%.4f\n',rho);

length_x=length(input_1);
length_y=length(input_2);

input_1st=input_1';
input_2nd=input_2';
c= concat(input_1st, input_1);
A=[input_1st ones(length_x,1)];
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

