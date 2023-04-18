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

input_1st=input_1';
input_2nd=input_2';
A=[input_1st ones(length_x,1)];
an=A'*A;
bn=A'*input_2nd;
xn=an\bn;
hold on; grid on;
x1=linspace(1,100);
y1=xn(1).*x1+xn(2);
plot(input_1st,input_2nd,'ob',x1,y1,'r');
err=A*xn-input_2nd;
fprintf("The Updated Equation for Least Square Line is y=(%f)*x+(%f)\n",xn(1),xn(2));