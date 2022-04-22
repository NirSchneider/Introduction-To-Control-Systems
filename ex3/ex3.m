%% Student ID
ID = 316098052;
disp(ID)
%% 1 System modeling
% The system's equations are:
%
% $$\left(M+m\right)\ddot{x}+MLcos\theta\ddot{\theta}-MLsin\theta\dot{\theta}^{2}=-kx$$
%
% $$gsin\theta+cos\theta\ddot{x}+L\ddot{\theta}=0$$
%
% approximations - small thethas and derivative :
%
% $$\left(M+m\right)\ddot{x}+ML\ddot{\theta}=-kx$$
%
% $$\ddot{x}+L\ddot{\theta}=-g\theta$$
%
% The state variable differential matrix equation:
%
% $$\dot{x}=\left[\begin{array}{cccc}
%                   0 & 1 & 0 & 0\\
%                   -\frac{k}{m} & 0 & g\frac{M}{m} & 0\\
%                   0 & 0 & 0 & 1\\
%                   \frac{k}{Lm} & 0 & \frac{-g\left(M+m\right)}{Lm} & 0
%                   \end{array}\right]\cdot x$$
%
%% 2 System modeling 2
% the system's equation are:
%
% $$f-mg=ma$$
%
% KVL:
%
% $$L\dot{i}=v-iR$$
%
% The state variable differential matrix equation:
%
% $$\left[\begin{array}{c}
%                 \dot{x}_{1}\\
%                 \dot{x}_{2}\\
%                 \dot{x}_{3}
%                 \end{array}\right]=\left[\begin{array}{c}
%                 x_{2}\\
%                 \frac{k}{m}\left(\frac{I_{0}+x_{3}}{X_{0}+x_{1}}\right)^{2}-g\\
%                 \frac{1}{L}\left(-Rx_{3}+v\right)
%                 \end{array}\right]$$
%
% approximation - linear near the working point:
%
% $$Taylor\;:\qquad\frac{k}{m}\left(\frac{I_{0}+x_{3}}{X_{0}+x_{1}}\right)^{2}\cong\frac{k}{m}\left(-\frac{I_{0}^{2}}{X_{0}^{3}}x_{1}+\frac{I_{0}}{X_{0}^{2}}x_{3}\right)$$
%
% The linear state variable differential matrix equation:
%
% $$\left[\begin{array}{c}
%             \dot{x}_{1}\\
%             \dot{x}_{2}\\
%             \dot{x}_{3}
%             \end{array}\right]=\left[\begin{array}{ccc}
%             0 & 1 & 0\\
%             -\frac{k}{m}\frac{I_{0}^{2}}{X_{0}^{3}} & 0 & \frac{k}{m}\frac{I_{0}}{X_{0}^{2}}\\
%             0 & 0 & -\frac{R}{L}
%             \end{array}\right]\cdot\left[\begin{array}{c}
%             x_{1}\\
%             x_{2}\\
%             x_{3}
%             \end{array}\right]+\left[\begin{array}{c}
%             0\\
%             0\\
%             \frac{1}{L}
%             \end{array}\right]\cdot v$$
%
% The charcterized matrices and vectors of the system:
%
% $$C=\left[\begin{array}{ccc}
%                     1 & 0 & 0\end{array}\right]\qquad B=\left[\begin{array}{c}
%                     0\\
%                     0\\
%                     \frac{1}{L}
%                     \end{array}\right]\qquad A=\left[\begin{array}{ccc}
%                     0 & 1 & 0\\
%                     -\frac{k}{m}\frac{I_{0}^{2}}{X_{0}^{3}} & 0 & \frac{k}{m}\frac{I_{0}}{X_{0}^{2}}\\
%                     0 & 0 & -\frac{R}{L}
%                     \end{array}\right]$$
%
% Transfer function at Laplace plane:
%
% $$H\left(S\right)=\frac{X\left(s\right)}{V\left(s\right)}=C\left[sI-A\right]^{-1}B=\frac{18.19}{s^{3}+45.67s^{2}+2246s+102600}$$
%
L = 0.508;
R = 23.2;
I_0 = 1.06;
M = 1.75;
X_0 = 4.36*10^-3;
K = 2.9*10^-4;

A = [0 1 0; (-K*I_0^2)/(M*X_0^3) 0 (K*I_0)/(M*X_0^2); 0 0 -R/L];
B = [0 0 1/L]';
C = [1 0 0];
D = 0;

sys = ss(A, B, C, D);
tf(sys)

%% 3 Comparing two systems
A_1 = [0 1 0;0 0 1; -4 -5 -8];
B_1 = [0 0 4]';
C_1 = [1 0 0];
D_1 = 0;

sys1 = ss(A_1, B_1, C_1, D_1);
tf_sys1 = tf(sys1)

A_2 = [0.5 0.5 0.7071;-0.5 -0.5 0.7071; -6.364 -0.7071 -8];
B_2 = [0 0 4]';
C_2 = [0.7071 1.2929 0];
D_2 = 0;

sys2 = ss(A_2, B_2, C_2, D_2);
tf_sys2 = tf(sys2)
%%
% The two systems has the same transfer function.
%
%% 4 State-system response
A_1 = [0 1 ;-2 -3];
B_1 = [0 1]';
C_1 = [1 0];
D_1 = 0;
x_0 = [1 0]';
t = 0:0.04:8;  % 201 points
u_t = t*0;
sys1 = ss(A_1, B_1, C_1, D_1);
tf_sys1 = tf(sys1)

lsim(sys1,u_t,t,x_0)
%%
% The reponse type is ZIR, so the transfer function converge to constant value and in this case to zero, as expected.  
%
%% 5 State-system response 2
A_1 = [0 1 0 ;0 0 1; -3 -2 -5];
B_1 = [0 0 1]';
C_1 = [1 0 0];
D_1 = 0;
x_0 = [0 -1 1]';
t = 0:0.04:10;  
u_t = t*0;
sys1 = ss(A_1, B_1, C_1, D_1);
tf_sys1 = tf(sys1)

lsim(sys1,u_t,t,x_0)

t = 10;
[V, D] = eig(A_1*t);

TM = (V*diag(exp(diag(D))))* inv(V);

x_10 = TM*x_0

%%
% $$x\left(t\right)$ after 10 seconds get smaller and converge to zero and it
% fit with the response that is shown at section 2.

