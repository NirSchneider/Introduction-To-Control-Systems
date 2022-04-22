%% Student ID
ID = 316098052;
disp(ID)
%% 1  Sketch a Bode plot
% The crossover frequency is the frequency in which the equation satisfy:
%
% $$20log_{10}|G\left(jw\right)|=0dB$$

G_0 = tf([0 0 1000],[1 40 300]);
bode(G_0)
cross_freq = allmargin(G_0);
cross_freq.PMFrequency
%%
G_1 = tf([0 0 100],[1 1.2 20.2 4]);
bode(G_1)
cross_freq = allmargin(G_1);
cross_freq.PMFrequency
%%
G_2 = tf([0 50 5000],[1 51 50]);
bode(G_2)
cross_freq = allmargin(G_2);
cross_freq.PMFrequency
%%
G_3 = tf([100 1400 5000],[1 503 1502 1000]);
bode(G_3)
cross_freq = allmargin(G_3);
cross_freq.PMFrequency


%% 2  Space robot
%
% 1. The Bode diagram of the system:
%
% $$G_{c}G\left(s\right)=\frac{781\left(s+10\right)}{s^{2}+22s+484}$$
%

G_c = tf([0 781 7810],[1 22 484]);
bode(G_c)
[mag,phase,wout] = bode(G_c);
[M,I] = max(mag);
max_mag = M
freq_at_max_mag = wout(I)
phase_at_max_mag = phase(I)

%% 3 Closed loop system
%
% 1. Velocity error voefficient:
%
% The steady state of ramp input is:
%
% $$e\left(\infty\right)=\frac{1}{lim_{s\rightarrow0}sG_{C}G\left(s\right)}=\frac{4}{K}$$
%
% $$\frac{4}{K}=\frac{1}{K_{v}}$$
%
% Therefore the required K is:
%
% $$K=40$$
%%
% 2. Bode plot of the open-loop system:
%
% The transfer system is:
%
% $$G_{C}G\left(s\right)=\frac{40s+200}{s^{4}+12s^{3}+22s^{2}+20s}$$

G_c = tf([0 40 200],[1 12 22 20 0]);
bode(G_c)
cross_freq = allmargin(G_c);
cross_freq.PMFrequency
