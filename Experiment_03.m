clc;
clear all;
m=input("How many numbers to input for x : ");
count = 0;
input_1=[];
fprintf("Enter the numbers accordingly\n");

while count < m
    x = input('');
    input_1=[input_1 x];
    count = count + 1;
end
input_1;
fprintf("X= [");
fprintf("%d ",input_1);
fprintf("]\n");
length_x=length(input_1);

n=input("How many numbers to input for y : ");

counter = 0;
input_2=[];
fprintf("Enter the numbers accordingly\n");
while counter < n
    y = input('');
    input_2=[input_2 y];
    counter = counter + 1;
end

input_2;
fprintf("Y= [");
fprintf("%d ",input_2);
fprintf("]\n");
length_y=length(input_2);

linear_correlation=(m*sum(input_1.*input_2)-sum(input_1)*sum(input_2))/sqrt((m*sum(input_1.^2)-(sum(input_1))^2)*(m*sum(input_2.^2)-(sum(input_2))^2));
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

input_1st=input_1';
input_2nd=input_2';
A=[input_1st ones(length_x,1)];
an=A'*A;
bn=A'*input_2nd;
xn=an\bn;
hold on; grid on;
subplot(4,1,1);
x1=linspace(1,100);
y1=xn(1).*x1+xn(2);
plot(input_1st,input_2nd,'ob',x1,y1,'r');
title('Line Fitting');
err=A*xn-input_2nd;
fprintf("The Updated Equation for Least Square Line is y=(%f)*x+(%f)\n",xn(1),xn(2));

input_1st_2=input_1';
input_2nd_2=input_2';
A=[input_1st_2.^2 input_1st_2 ones(length_x,1)];
ap=A'*A;
bp=A'*input_2nd_2;
xp=ap\bp;
hold on; grid on;
subplot(4,1,2);
x2=linspace(1,100);
y2=xp(1).*x2.^2+xp(2).*x2+xp(3);
plot(input_1st_2,input_2nd_2,'r*',x2,y2,'k');
title('Parabola Curve Fitting');
err=A*xp-input_2nd_2;
fprintf("The Updated Equation for Least Parabola is y=(%f)*x^2+(%f)*x+(%f)\n",xp(1),xp(2),xp(3));

input_1st_3=input_1';
input_2nd_3=input_2';
A=[exp(input_1st_3) ones(length_x,1)];
ae=A'*A;
be=A'*input_2nd_3;
xe=ae\be;
hold on; grid on;
subplot(4,1,3);
x3=linspace(1,200);
y3=xe(1).*exp(x3)+xe(2);
plot(input_1st_3,input_2nd_3,'k*',x3,y3,'r');
title('Exponential Curve Fitting');
err=A*xe-input_2nd_3;
fprintf("The Updated Equation for Least Exponential Curve is y=(%f)*exp(x)+(%f)\n",xe(1),xe(2));

input_1st_4=input_1';
input_2nd_4=input_2';
A=[sin(input_1st_4) ones(length_x,1)];
as=A'*A;
bs=A'*input_2nd_4;
xs=as\bs;
hold on; grid on;
subplot(4,1,4);
x4=linspace(1,100);
y4=xs(1).*sin(x3)+xs(2);
plot(input_1st_4,input_2nd_4,'r*',x4,y4,'b');
title('Sine Curve Fitting');
err=A*xs-input_2nd_4;
fprintf("The Updated Equation for Least Sine Curve is y=(%f)*exp(x)+(%f)\n",xs(1),xs(2));