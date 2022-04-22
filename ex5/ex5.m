%% Student ID
ID = 316098052;
disp(ID)
%% 1  Sketch a Root locus
s =tf('s');

H = 1/((s^2+2*s+2)*(s+1))

rlocus(H)

%% 2  State space system
%
% 1. The characteristic equation of the system is:
%
% $$s^{3}+s^{2}\left(2+k\right)+5s+1=0$$
%
% 2. Following the Routh Hurwitz algorithem:
%
% $$\left|\begin{array}{c}
%                     s^{3}\\
%                     s^{2}\\
%                     s^{1}\\
%                     s^{0}
%                     \end{array}\right|\begin{array}{cc}
%                     1 & 5\\
%                     2+k & 1\\
%                     \frac{5k+9}{k+2} & 0\\
%                     1 & 0
%                     \end{array}$$
%
% It can be obtained that for 
% $$k>-\frac{9}{5}$$
% the system is stable.
%
% 3. According to the equation that describes the feedback of the open loop:
%
% $$1+k\frac{s^{2}}{s^{3}+2s^{2}+5s+1}=0$$
%
% The Root Locus:

Q = [0 1 0 0]
P = [1 2 5 1]

rlocus(tf(Q,P))

%% 3 Pilot crane
%
% The system transfer function:
%
% $$H\left(s\right)=\frac{10k\left(s^{2}+10\right)}{s^{3}+20s+10k\left(s^{2}+10\right)}$$
%
% The characteristic equation:
%
% $$1+k\frac{10\left(s^{2}+10\right)}{s^{3}+20s}=0$$
%
% According to Routh Hurwitz algorithem, the system will be stabled for any
% positive k. Therefore from the Root Locus graph, the k that will bring the
% system to maximum damping rate (real part of the poles is smallest) is:
%
% $$k=0.4644$$

Q = [0 10 0 100];
P = [1 0 20 0];

rlocus(tf(Q,P))
[R,K] = rlocus(tf(Q,P));

min_array = real(R(2,:))*(-1);
index = find(min_array == max(min_array(:)));
k_optimal = K(index);
