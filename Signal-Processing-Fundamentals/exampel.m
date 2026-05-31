t=(-2e-03:0.02e-03:2e-03); 
x=exp(j*2000*pi*t);    

y=real(x);     
z=imag(x);    
subplot(2,1,1)    
plot(x,'-.k') 
axis square     
title('exp(jwt)') 
xlabel('Real') 
ylabel('Imaginary') 
subplot(2,1,2) 
plot(t,y,'-',t,z,':') 
title('Re[exp(jwt)] and Im[exp(jwt)] vs t w=1000*2*pi') 
xlabel('Time (s)') 
grid on 
legend('Re[exp(j\omegat)]','Im[exp(j\omegat)]',-1)