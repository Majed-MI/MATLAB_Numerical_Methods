% False Position Algorithm

clc;
clear all;
str = input('Enter a non-linear equation in terms of x: ','s')  ;
f = inline(str);
a = input('Enter the lower limit, a:  ');
b = input('Enter the upper limit, b:  ');
maxerror=0.0001;

while f(a)*f(b)>=0
    fprintf("Function has same signs at end points.\n");
    a=input("Please Enter the lower limit again :");
    b=input("Please Enter the upper limit again :");
end

xl=a; xu=b;
x(1)=(xl+xu)/2;
err(1)=(xu-xl)/2;
i=1;
n=log((xl-xu)/maxerror)/log(2);

xl1=a; xu1=b;
x1(1)=(xl1+xu1)/2;
error(1)=(xu1-xl1)/2;
ni=log((xl1-xu1)/maxerror)/log(2);

j=1;
while(abs(error(j)) > maxerror && j < ni && f(x1(j))~= 0)
    xf=(xl1*f(xu1)-xu1*f(xl1))/(f(xu1)-f(xl1));
    temp=xl1;
    xl1=xf;
    if f(xl1)*f(xu1)>0
        xl1=temp;
        xu1=xf;
    end
    if f(xl1)==0
        x1(j+1)=xl1;
        error(j+1)=0;
        j=j+1;
    elseif f(xu1)==0
        x1(j+1)=xu1;
        error(j+1)=0;
        j=j+1;
    else 
        error(j+1)=(xl1-xu1)/2;
        x1(j+1)=xf;
        j=j+1;
    end
end

rootf=x1(j);
fprintf("The root for Regula Falsi Method=%.5f\n",rootf);
itrf=j;
fprintf("The iteration no. for Regula Falsi Method=%d\n",itrf);
ij=1:j;

