function robotics()
	%{ 

		Implementation of Example 3.10 on page 103 of
		our book. 

		We use the book's program cubicspline.m to create the 
		splines here, but you may also use Octave's built in 
		function spline.m. Type help spline in the command 
		window to learn more about this function.  

	%}

	% we'll use the books program cubicspline.m 
	addpath('./textbook_algorithms'), close all

	% interpolate parametric data
	t1 = [0 1 2]; x1 = [0 1 4]; y1 = [0 2 4];
	t2 = [2 3 5]; x2 = [4 3 0]; y2 = [4 1 0]; 
	x1_vals = cubicspline(t1,x1,0:.01:2,0,[0 0]);
	%x1_vals = spline(t1,[0 x1 0],0:0.01:2); % Octave's built in complete spline
	y1_vals = cubicspline(t1,y1,0:.01:2,0,[0 0]);
	%y1_vals = spline(t1,[0 y1 0],0:0.01:2); 
	x2_vals = cubicspline(t2,x2,2:.01:5,0,[0 0]);
	%x2_vals = spline(t2,[0 x2 0],2:.01:5);
	y2_vals = cubicspline(t2,y2,2:.01:5,0,[0 0]);
	%y2_vals = spline(t2,[0 y2 0],2:.01:5);

	figure(1), hold on, grid on 
	plot(x1_vals,y1_vals,'linewidth',2.0,x2_vals,y2_vals,'linewidth',2.0);	
	plot([0 1 4 3 0],[0 2 4 1 0],'*k','linewidth',2.0);
	quiver(0.8,2.1,0.5,0.5,'b','linewidth',1.5);
	quiver(3.1,0.78,-0.5,-0.75,'r','linewidth',1.5);

