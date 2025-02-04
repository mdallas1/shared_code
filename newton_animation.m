function newton_animation()

% clear old plots
close all;

% plot function (defined below)
figure(1)
t=linspace(0,5);
plot(t,ff(t),'Linewidth',1.5);
fontSize = 15;
title('f(x)=cosh(x)+cos(x)-2.5','FontSize',fontSize);
%title('f(x)=x-10*sin(x)-1','FontSize',fontSize);
%set bounds on y-axis 
ylim([-7 7]);
%ylim([-10 10]);
hold on;

% set initial iterate for Newton's method
x=3; x0=x;
% set counter to zero
i=0;

%set number of iterations to plot
iters=7;

for i=1:iters

  %brings the plot window to the front when running the code
  shg

  %update counter
  i=i+1;

  %plot the current iterate on the x-axis and the point (x,f(x)) on the graph of f
  plot(x,ff(x),'+m','Linewidth',1.5);
  plot(x,0,'*r','Linewidth',1.5);
  %text(3.4,3.5,['( x , f(x) )'],'FontSize',15);
  text(2.5,-0.5,['( x , f(x) )'],'FontSize',15);
  text(2.5,-0.5*i-0.5,['( ' num2str(x) ' , ' num2str(ff(x)) ' )'],'FontSize',15);


  %plot the tangent line of ff at the point x
  m=ffp(x);
  y=ff(x);
  zero=x-ff(x)/ffp(x);
  t=linspace(zero,x);
  plot(t,t_line(t,x,ff(x),ffp(x)),'m','Linewidth',1.5);
  xaxis = linspace(0,5);
  plot(xaxis,zeros(length(xaxis)))

  % uncomment the next three lines to make the window zoom in on x=0
  %if abs(x)>0.05
  %	xlim([-x,x]);
  %end

  %make octave wait 0.5 seconds before continuing to produce an animation effect
  pause(0.5);

  %update iterate. Note that "zero" defined above is just a Newton iteration
  x=zero;
end

%---------------------------------------
%define functions
function fout = ff(x)
  fout = cosh(x)+cos(x)-2.5;
	%fout = x-2*sin(x)-1;
  end

function fout = ffp(x)
  fout = sinh(x)-sin(x);
	%fout = 1-2*cos(x);
  end

%this function is used to produce the tangent line at a point x
function fout = t_line(x,a,b,m)
  fout = m*(x-a)+b;
  end

end
