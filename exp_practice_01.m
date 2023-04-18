clc;
clear;
x=textread('data_ungrouped.txt');
t=length(x);
fprintf("Total length:%f\n",t);
a=sum(x)/t;
fprintf('Mean is %f\n',a);
sd=sqrt((((sum(x.^2))/t)-((sum(x))/t).^2));
fprintf('Standard Deviation is %f\n',sd);