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
fprintf("X= [");
fprintf("%d ",input_2);
fprintf("]\n");
length_y=length(input_2);

input_1st_4=input_1';
input_2nd_4=input_2';
A=[sin(input_1st_4) ones(length_x,1)];
as=A'*A;
bs=A'*input_2nd_4;
xs=as\bs;
hold on; grid on;
x3=linspace(1,100);
y3=xs(1).*sin(x3)+xs(2);
plot(input_1st_4,input_2nd_4,'y*',x3,y3,'b');
err=A*xs-input_2nd_4;
fprintf("The Updated Equation for Least Curve is y=(%f)*exp(x)+(%f)\n",xs(1),xs(2));