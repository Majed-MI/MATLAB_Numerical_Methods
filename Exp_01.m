clc;
clear;
i=input('Enter 0 for Grouped data & 1 for Ungrouped data:');
if i==0
    marks=xlsread('Experiment_01_Grouped_Data.xlsx','a2:a8');
    xi=xlsread('Experiment_01_Grouped_Data.xlsx','b2:b8');
    fi=xlsread('Experiment_01_Grouped_Data.xlsx','c2:c8');
    cum_freq=xlsread('Experiment_01_Grouped_Data.xlsx','d2:d8');
    total_number=cum_freq(end);
    fprintf("Grouped Data:\n");
    Arithmatic_mean=sum((fi.*xi)/total_number);
    fprintf('The Arithmatic Mean for Grouped data is %f\n',Arithmatic_mean);
    Geometric_mean= exp((1/total_number)*sum(fi.*log(xi)));
    fprintf('The Geometric Mean for Grouped data is %f\n',Geometric_mean);
    Harmonic_mean=total_number/(sum(fi./xi));
    fprintf('The Harmonic Mean for Grouped data is %f\n',Harmonic_mean);
    Standard_deviation=sqrt((sum(fi.*(xi-Arithmatic_mean).^2))/total_number);
    fprintf('The Standard Deviation for Grouped data is %f\n',Standard_deviation);
    Variance=Standard_deviation^2;
    fprintf('The Variance for Grouped data is %f\n',Variance);
    First_moment=sum(fi.*(xi))/sum(fi);
    fprintf('The First Moment for Grouped data is %f\n',First_moment);
    Second_moment=sum(fi.*(xi-Arithmatic_mean).^2)/sum(fi);
    fprintf('The Second Moment for Grouped data is %f\n\n',Second_moment);
elseif i==12
    x=textread('Experiment_01_Ungrouped_Data.txt');
    total=length(x);
    fprintf("Ungrouped Data:\n");
    arithmatic_mean=sum(x)/total;
    fprintf('The Arithmatic Mean for Ungrouped data is %f\n',arithmatic_mean);
    geometric_mean=exp((1/total)*sum(log(x)));
    fprintf('The Geometric Mean for Ungrouped data is %f\n',geometric_mean);
    harmonic_mean=total/sum(1./x);
    fprintf('The Harmonic Mean for Ungrouped data is %f\n',harmonic_mean);
    standard_deviation=sqrt((((sum(x.^2))/total)-((sum(x))/total).^2));
    fprintf('The Standard Deviation for Ungrouped data is %f\n',standard_deviation);
    variance=standard_deviation^2;
    fprintf('The Variance for Ungrouped data is %f\n',variance);
    median_ungrouped=median(x);
    fprintf('The Median for Ungrouped data is %f\n',median_ungrouped);
    mode_ungrouped=mode(x);
    fprintf('The Mode for Ungrouped data is %f\n',mode_ungrouped);
    first_moment=sum(x)/total;
    fprintf('The First Moment for Ungrouped data is %f\n',first_moment);
    second_moment=sum((x-arithmatic_mean).^2)/total;
    fprintf('The Second Moment for Ungrouped data is %f\n',second_moment);
else
    fprintf("Wrong Input");
end