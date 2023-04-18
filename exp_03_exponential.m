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

input_1st_3=input_1';
input_2nd_3=input_2';
A=[exp(input_1st_3) ones(length_x,1)];
ae=A'*A;
be=A'*input_2nd_3;
xe=ae\be;
hold on; grid on;
x3=linspace(1,200);
y3=xe(1).*exp(x3)+xe(2);
plot(input_1st_3,input_2nd_3,'k*',x3,y3,'b');
err=A*xe-input_2nd_3;
fprintf("The Updated Equation for Least Curve is y=(%f)*exp(x)+(%f)\n",xe(1),xe(2));