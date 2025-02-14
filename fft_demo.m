function fft_demo()
	%{ 

		In class, we saw that trigonometric interpolation amounts 
		to computing the discrete Fourier transform of a vector v. 
		An interpretation of this is that we're taking a signal 
		in the time domain and transforming it into the frequency 
		domain. 

		The Fast Fourier Transform (fft) allows us to very quickly compute 
		the discrete Fourier transform. 

		This function demonstrates the fft by 
		taking an audio file in which a musical chord is 
		played and using the fft to identify the chord. 

	%} 
	
	close all;

	% read the audio file and return vector `chord' and sampling rate `fs'
	[chord,fs] = audioread('d_chord_32bit.wav'); 

	% uncomment line 23 to hear chord
	player = audioplayer(chord,fs); play(player); pause(4); return
	
	% define time domain 
	dt = 1/fs; t = 0:dt:length(chord)/fs;
	
	% uncomment line 29 to see audio file
	figure(1)
	plot(t(1:end-1),chord);

	% compute Fourier transform with fft and define frequency domain
	fft_chord = fft(chord,length(t)); hz = 1/(dt*length(t))*[0:length(t)-1];
	
	% compute **magnitudes** of Fourier transform coefficients to determine 
	% dominant frequencies 
	mag = fft_chord.*conj(fft_chord)/length(t);
	

	% read in individual notes
	[d,d_fs] = audioread('d_32.wav');
	[fsharp,fsharp_fs] = audioread('fsharp_32.wav');
	[a,a_fs] = audioread('a_32.wav');

	% plot chord fft and individual notes fft to determine notes in chord
	figure(2)
	hold on
	plot(hz,abs(fft(d,length(t))).^2/length(t),'r','linewidth',3.0);
	plot(hz,mag,'linewidth',3.0); xlim([0,1e3]);	
	legend('D note','Chord','fontsize',30);

	figure(3)
	hold on
	plot(hz,abs(fft(fsharp,length(t))).^2/length(t),'r','linewidth',3.0);
	plot(hz,mag,'linewidth',3.0); xlim([0,1e3]);
	legend('F# note','Chord','fontsize',30);
	
	figure(4)
	hold on 
	plot(hz,abs(fft(a,length(t))).^2/length(t),'r','linewidth',3.0);
	plot(hz,mag,'linewidth',3.0); xlim([0,1e3]);
	legend('A note','Chord','fontsize',30);
		
	figure(5)
	plot(hz,mag,'linewidth',3.0);

