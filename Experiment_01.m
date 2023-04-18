%Experiment on measures of central tendency, dispersion and moments.
clc;
clear;
i=input('Enter 1 for Grouped data & 2 for Ungrouped data:');
if i==1
    m=xlsread('Experiment_01_Grouped_Data.xlsx','a2:a8');
    xi=xlsread('Experiment_01_Grouped_Data.xlsx','b2:b8');
    fi=xlsread('Experiment_01_Grouped_Data.xlsx','c2:c8');
    n=100;
    fprintf("--------Grouped Data-----------\n");
    A=sum((fi.*xi)/n);
    fprintf('The Arithmatic Mean for Grouped data is %f\n',A);
    G= exp((1/n)*sum(fi.*log(xi)));
    fprintf('The Geometric Mean for Grouped data is %f\n',G);
    H=n/(sum(fi./xi));
    fprintf('The Harmonic Mean for Grouped data is %f\n',H);
    fc=xlsread('Experiment_01_Grouped_Data.xlsx','d2:d8');
    SD=sqrt((sum(fi.*(xi-A).^2))/n);
    fprintf('The Standard Deviation for Grouped data is %f\n',SD);
    V=SD^2;
    fprintf('The Variance for Grouped data is %f\n',V);
    FM=sum(fi.*(xi))/sum(fi);
    fprintf('The First Moment for Grouped data is %f\n',FM);
    SM=sum(fi.*(xi-A).^2)/sum(fi);
    fprintf('The Second Moment for Grouped data is %f\n\n',SM);
elseif i==2
    x=textread('Experiment_01_Ungrouped_Data.txt');
    t=length(x);
    fprintf("--------Ungrouped Data-----------\n");
    a=sum(x)/t;
    fprintf('The Arithmatic Mean for Ungrouped data is %f\n',a);
    g=exp((1/t)*sum(log(x)));
    fprintf('The Geometric Mean for Ungrouped data is %f\n',g);
    h=t/sum(1./x);
    fprintf('The Harmonic Mean for Ungrouped data is %f\n',h);
    sd=sqrt((((sum(x.^2))/t)-((sum(x))/t).^2));
    fprintf('The Standard Deviation for Ungrouped data is %f\n',sd);
    v=sd^2;
    fprintf('The Variance for Ungrouped data is %f\n',v);
    m=median(x);
    fprintf('The Median for Ungrouped data is %f\n',m);
    mo=mode(x);
    fprintf('The Mode for Ungrouped data is %f\n',mo);
    fm=sum(x)/t;
    fprintf('The First Moment for Ungrouped data is %f\n',fm);
    sm=sum((x-a).^2)/t;
    fprintf('The Second Moment for Ungrouped data is %f\n',sm);
else
    fprintf("Wrong Input");
end