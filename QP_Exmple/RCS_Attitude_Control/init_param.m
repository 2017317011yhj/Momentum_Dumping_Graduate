% Length([m]) of cube
Cube_L=0.3;
% Cube_Lx = 0.3;  
% Cube_Ly = 0.3;
% Cube_Lz = 0.3;
% Mass([kg]) of cube
M_c = 10; 

% Radius([m]) of cylinder(Reaction wheel)
R_rw=0.015; 
% Length([m]) of cylinder(Reaction wheel)
L_rw=0.01; 
% Mass([kg]) of cylinder(Reaction wheel)
M_rw=0.01; 
% MOI([kg*m^2]) of cylinder(Reaction wheel)
I_rw1=[1/4*M_rw*R_rw^2+1/12*M_rw*L_rw^2 0 0;
    0 1/4*M_rw*R_rw^2+1/12*M_rw*L_rw^2 0;
    0 0 1/2*M_rw*R_rw^2];
% % Reaction wheel MOI Matrix
% I_rw = diag([I_rw1 I_rw1 I_rw1 I_rw1]);

% Reaction wheel Rotation angle(°)(Euler Rotation 'ZYX' seq)
rw_ang = 30;
RW1_ang = [0 rw_ang 0];
RW2_ang = [0 0 -rw_ang];
RW3_ang = [0 -rw_ang 0];
RW4_ang = [0 0 rw_ang];
% Reaction wheel Position
RW1_Pos = [Cube_L/2 0 0]';
RW2_Pos = [0 Cube_L/2 0]';
RW3_Pos = [-Cube_L/2 0 0]';
RW4_Pos = [0 -Cube_L/2 0]';

% Unit vector matrix of Reaction wheel axis
As1 = [sind(rw_ang) 0 cosd(rw_ang)]';
As2 = [0 sind(rw_ang) cosd(rw_ang)]';
As3 = [-sind(rw_ang) 0 cosd(rw_ang)]';
As4 = [0 -sind(rw_ang) cosd(rw_ang)]';
As = [As1, As2, As3, As4];

% Give external torque ()
torque_ext = [0.006 0.007 -0.008]';

% Optional) Reaction wheel torque input for external torque cancellation
% torque_rw_input = As'*((As*As')\torque_ext);

% torque_rw_input = [torque_ext(3)/(4*cosd(rw_ang))+torque_ext(1)/(2*sind(rw_ang));
% torque_ext(3)/(4*cosd(rw_ang))+torque_ext(2)/(2*sind(rw_ang));
% torque_ext(3)/(4*cosd(rw_ang))-torque_ext(1)/(2*sind(rw_ang));
% torque_ext(3)/(4*cosd(rw_ang))-torque_ext(2)/(2*sind(rw_ang))];


