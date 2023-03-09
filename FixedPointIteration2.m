%% Exercise Set 2.2 Problem 15.
% Numerical Analysis by R.L. Burden
% Author: Golnoosh Morshedi
% 9th Edition Page 66. 
% f(x) = 2 sin (pi*x) + x = 0.
% Fixed-Point Iteration to find solution for f(x)
% Error bound <1e-2
%-------------------------------------------------------------------------
function FPI15()
clear
clc
    x=1:0.01:2;         % pick an interval for input variable.
    figure()            % Open new figure
    plot(x,f(x))        % plot f(x)
    hold on
    xx=1.210;
    xxx=1.6832;
    plot(xx,f(xx),'yo','Linewidth',2)
    hold on
    plot(xxx,f(xxx),'ro','Linewidth',2)
    grid on             % Show grid lines
    grid minor
    % Making Title for figure
    title('f(x)=2*sin(pi*x)+x');xlabel('x');ylabel('f(x)')
    ylim([-1,1.5])
    % Ploting y=x and g(x) in new figure
    figure()
    y=x;
    plot(x,y,'b','Linewidth',2) 
    title('Fixed-Point Iteration for finding solution of f(x)')
    xlabel('Input Variable (X)')
    grid on ; grid minor
    hold on
    plot(x,g(x),'r','Linewidth',2)
    legend('y=x','g(x)'); ylim([1,2])
    %Initial Condition
    x0=1;
    x1=g(x0);
    iter=0;
    while abs(x1-x0)>1e-2
        % Plot a first point and its projection on both y=x & g(x)
        plot([x0 x0],[x0 g(x0)],'k','Linewidth',1)
        plot([x0 x1],[x0 g(x1)],'k--','Linewidth',1)
        % We can use pause command to see steps of convergence.
        %pause
        x0=x1;
        x1=g(x0);
        iter=iter+1;
    end
fprintf('A solution for (2*sin(pi*x)+x)after %d Iteration is: %.10g\n',iter,x1) 
% Declare f(x)
function out=f(x)
out=2.*(sin(pi.*x))+x;
% Translating f(x) in the form of x=g(x)
%Declare g(x)
function out=g(x)
out=(1/pi).*(asin(-x./2))+2;