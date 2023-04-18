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

input_1st_2=input_1';
input_2nd_2=input_2';
A=[input_1st_2.^2 input_1st_2 ones(length_x,1)];
an=A'*A;
bn=A'*input_2nd_2;
xp=an\bn;
hold on; grid on;
x2=linspace(1,300);
y2=xp(1).*x2.^2+xp(2).*x2+xp(3);
plot(input_1st_2,input_2nd_2,'r*',x2,y2,'k');
err=A*xp-input_2nd_2;
fprintf("The Updated Equation for Least Parabola is y=(%f)*x^2+(%f)*x+(%f)\n",xp(1),xp(2),xp(3));