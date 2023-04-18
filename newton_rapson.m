syms x;
y = input('Enter non-linear equations: ');
a = input('Enter initial guess: ');
er = input('Tolerable error: ');
N = input('Enter maximum number of steps: ');

step = 1;


g = diff(y,x);


fa = eval(subs(y,x,a));

while abs(fa)> er
    fa = eval(subs(y,x,a));
    ga = eval(subs(g,x,a));
    if ga == 0
        disp('divided by zero.');
        break;
    end
    
    b = a - fa/ga;
    er(1,step)= a-b;
    fprintf('step=%d\na=%f\nf(a)=%f\n\n',step,a,fa);
    a = b;
    
    if step>N
       disp('Not convergent'); 
       break;
    end
    step = step + 1;
end

fprintf('Root is %f\n\n\n', a);
fprintf('Step is %f\n',step);
fprintf('err:%f\n',er);
figure(2);
plot(step,er)