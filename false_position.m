
clc;
clear all;
str = ('exp(-x)*sin(x)')  ;
f = inline(str);
a = input('Enter the lower limit, a:  ');
b = input('Enter the upper limit, b:  ');
% n = input('Enter the maximum no. of iterations, n: ');
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

while(abs(err(i)) > maxerror && i < n && f(x(i))~= 0)
    xm=(xl*f(xu)-xu*f(xl))/(f(xu)-f(xl));
    temp=xl;
    xl=xm;
    if f(xl)*f(xu)>0
        xl=temp;
        xu=xm;
    end
    if f(xl)==0
        x(i+1)=xl;
        err(i+1)=0;
        i=i+1;
    elseif f(xu)==0
        x(i+1)=xu;
        err(i+1)=0;
        i=i+1;
    else 
        err(i+1)=(xl-xu)/2;
        x(i+1)=xm;
        i=i+1;
    end
end
root=x(i);
fprintf("The Root for False position method=%.5f\n",root);
itr=i;
fprintf("The iteration no. for false position method=%d\n",itr);
ii=1:i;
k=1;
fprintf("No. of iteration                Error                    f(x)\t\n");
for k=1:i
    fprintf("%d                              %f                    %s\n",k,abs(err(k)),f(k));
end
    

plot(ii,err,'r--');
legend('False position Method');
xlabel('number of iteration');
ylabel('errors');