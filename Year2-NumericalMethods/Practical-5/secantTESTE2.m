% PRACTICAL 5

% This MATLAB function finds the root of a predefined function (given
% at the command line), from one initial guess, by using the Secant
% method (using perturbation).
 

% ______________________________________________________________
%|                   Abdullah and Marisabel                     |
%|                       xx/xx/2017                             |
%|______________________________________________________________|

%Clearing the workspace, figures and the command window
clear all
clf
clc

% ______________________________________________________________
%|                        Relevant Nomenclature                        
%|______________________________________________________________

% xi: initial guess
% xi_n: the new estimate of the root
% ea: approximate error at iteration i+1
% p_dx: perturbation of delta_x, constant value = 0.001
                                  % let delta_x = dx for convenience
% f: function defined at the command line
% elim: the error limit, constant value = 0.000001%
% maxit: maximum number of iterations, contant value = 40




% ______________________________________________________________
%|                        Relevant equations                       
%|______________________________________________________________

% Initial guess:  x_i+1 = xi - (f(xi)dx/f(xi+dx)-f(xi))        (1)

% Approximate error: ea = |(x_i+1 - xi)/x_i+1)| * 100%         (2)


% Displaying on screen the purpose of this function
disp('This MATLAB function finds the root of a predefined function (given ')
disp('at the command line), from one initial guess, by using the Secant ')
disp('method (using perturbation).')

disp(' ') %blank line


% Asking user to define the function 
f_defined = input('Please enter a function:' ,'s');
f = inline(f_defined);


% Given values
p_dx = 0.001; % perturbation of dx
elim = 0.000001; % error limit
maxit = 40; % max number of iterations
xi(1) = -1; %intial guess

% No output in the MATLAB function as the results will be writen to screen
% for each iteration and plotted upon completion 

iteration = 0;



function [ ] = secante(f,xi,elim,maxit);

 for i= 3:1000
     xi(i) = xi(i-1) - (f(xi(i-1)))*((xi(i-1) - (xi(i-2))/(f(xi(i-1));
     
     iteration = iteration + 1;
     
     if abs((xi(i)-x(i-1))/x(i))*100<elim
         root = x(i);
         iteration = iteration;
         break
         
     end
 end


end









% ______________________________________________________________
%|                              END                    
%|______________________________________________________________
