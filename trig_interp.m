function out = trig_interp(x,c,n)
		if rem(n,2) > 0 
			mu = 1;	
		else 
			mu = 0;
		end
		M = (n-mu)/2;
		% exponential form 	
		e_sum = 0; mm = [-(M+mu):M];
		if mu == 1
			c(1) = 0.5*c(1); % evidently we need to half c_{M+1} 
		end
		for k = 1:length(c)
			e_sum += c(k)*exp(1i*mm(k)*x);
		end
		out = e_sum + mu*c(1)*exp(1i*(M+1)*x);
