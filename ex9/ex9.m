%% Student ID
ID_STUDENT_1 = 302363049;
disp(ID_STUDENT_1)
%% 1 Discrete control 1
H=tf([0 21/2 -19/2],[1 -2 1],-1)
t=-pi:0.01:pi;
a=exp(-1i.*t);
plot(a,'r--')
hold on
rlocus(H)
axis equal

%% Discrete control 2
H=tf([0 1 0.2],[1 -1 0],-1)
t=-pi:0.01:pi;
a=exp(-1i.*t);
plot(a,'r--')
hold on
rlocus(H);
axis equal