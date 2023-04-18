% Bisection Algorithm

clc;
clear all;
str = input('Enter a non-linear equation in terms of x: ','s')  ;
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
    xm=(xl+xu)/2;
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
fprintf("The Root for Bisection method=%.5f\n",root);
itr=i;
fprintf("The iteration no. for bisection method=%d\n",itr);
ii=1:i;

% False Position Algorithm

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
fprintf("The root for False Position Method=%.5f\n",rootf);
itrf=j;
fprintf("The iteration no. for False Position Method=%d\n",itrf);
ij=1:j;

%Newton Raphson Method

g = sym(str2func(['@(x)',str]));
derivative = diff(g);

xl2=a; xu2=b;
x2(1)=(xl2+xu2)/2;
error_newton(1)=(xu2-xl2)/2;
ni2=log((xl2-xu2)/maxerror)/log(2);
k=1;
guess_number=input("Enter the guess number for Newton Raphson Method:\n");

if derivative ~= 0
    while(abs(error_newton(k)) > maxerror && k < ni2  && f(x2(k))~= 0)
        xn=guess_number-f(guess_number)./diff(f(guess_number));
        temp=xl2;
        xl2=xn;
        if f(xl2)*f(xu2)>0
            xl2=temp;
            xu2=xn;
        end
        if f(xl2)==0
            x2(k+1)=xl2;
            error_newton(k+1)=0;
            k=k+1;
        elseif f(xu2)==0
            x2(k+1)=xu2;
            error_newton(k+1)=0;
            k=k+1;
        else 
            error_newton(k+1)=0;
            x2(k+1)=0;
            k=k+1;
        end
        if k>ni2
           disp('Not convergent'); 
           break;
        end
     end
end
rootn=x2(k);
fprintf("The Root for Newton Raphson method=%.5f\n",rootn);
itrn=k;
fprintf("The iteration no. for Newton Raphson method=%d\n",itrn);
ik=1:k;

%Fixed Point Iterative Method

xl3=a; xu3=b;
x3(1)=(xl3+xu3)/2;
error_fixed(1)=0;
ni3=log((xl2-xu2)/maxerror)/log(2);
l=1;
guess_number2=input("Enter the guess number for Fixed point Method:\n");

while(abs(error_fixed(l)) > maxerror && l < ni3  && f(x3(l))~= 0)
        for i=1:ni3
            xfi=f(guess_number2);
            fprintf("x%d=%f\n",i,xfi);
            error_fixed=xfi-guess_number2;
            if (abs(xfi-guess_number2)<maxerror)
                break
            end
            guess_number2=xfi;
        end
end

rootfi=x3(l);
fprintf("The Root for Fixed Point Iterative method=%.5f\n",rootfi);
itrfi=l;
fprintf("The iteration no. for Fixed Point Iterative method=%d\n",itrfi);
il=1:l;

plot(ii,err,'r--',ij,error,'b',ik,error_newton,'g*--',il,error_fixed,'m');
legend('Bisection Method','False Position Method','Newton Raphson Method','Fixed Point Iterative Method');
xlabel('number of iteration');
ylabel('errors');