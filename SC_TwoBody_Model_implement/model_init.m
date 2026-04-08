clear all;
close all;
clc;

% deg2rad = pi/180;
rpm2rad = (2*pi)/60;
rad2rpm = 1/rpm2rad;
dt = 0.01;

%		(1) - semimajor axis of the orbit in meters.
%		(2) - eccentricity.
%		(3) - inclinatsion in radians.
%		(4) - right ascension of ascending node in radians.
%		(5) - argument of perigee in radians.
%		(6) - mean anomaly in radians.
SC_Kepler = [(6371.2+600)*1000, 0.00221, 0*pi/180, 0*pi/180, 0, deg2rad(270)];
TS_Kepler = [(6371.2+600)*1000, 0.00221, 0*pi/180, 0*pi/180, 0, deg2rad(270)+0.000003];
SC_state0 = kepel_statvec (SC_Kepler);
TS_state0 = kepel_statvec (TS_Kepler);

SC_pos0 = [SC_state0(1),SC_state0(2),SC_state0(3)]';%ECI 
SC_vel0 = [SC_state0(4),SC_state0(5),SC_state0(6)]';%ECI 
TS_pos0 = [TS_state0(1),TS_state0(2),TS_state0(3)]';%ECI w_orbitw_orbitw_orbit
TS_vel0 = [TS_state0(4),TS_state0(5),TS_state0(6)]';%ECI 

REL_TS_POS_I_0 = TS_pos0 - SC_pos0;
REL_TS_VEL_I_0 = TS_vel0 - SC_vel0;

w_orbit = kepler6_to_orbit_rate(TS_Kepler); % orbit rate : [rad/s]

SC_Ib = [1257.52 -0.07285  -0.0345; % [kg m^2]
            -0.0728   11126.1   -24.1635;
            -0.0345  -24.1635   11354.6];
m_tot = 3019.19 ;%[kg]
wb0 = [0 0 0]';
ag0 = deg2rad([-5 5 -5]');
qb0 = eul2quat(ag0','ZYX')';
vI0 = [0 0 0]';
pI0 = [0 0 0]';

TS_Ib = diag([1 1 1]);
TS_wb0 = deg2rad([0 0 0]');
TS_qb0 = angle2quat(deg2rad(0),deg2rad(0),deg2rad(0),'ZYX')';

%% Reaction Wheel Configuration
% Fly_Wheel_Mass = 12;%[kg]
Iws = diag([1 1 1 1])*0.227;
RW_t_max = 0.2;
RW_Omegad_max = 4200*rpm2rad;
RS_Max_Speed = 4200*rpm2rad;

RW1_ROT = [0 45 0]';%ZYX [deg]
RW2_ROT = [0 0 -45]';%ZYX [deg]
RW3_ROT = [0 -45 0]';%ZYX [deg]
RW4_ROT = [0 0 45]';%ZYX [deg]
RW1_POS = [0.5 0 0]';%XYZ [m]
RW2_POS = [0 0.5 0]';%XYZ [m]
RW3_POS = [-0.5 0 0]';%XYZ [m]
RW4_POS = [0 -0.5 0]';%XYZ [m]

RW1_ROTM = angle2dcm(deg2rad(RW1_ROT(1)),deg2rad(RW1_ROT(2)),deg2rad(RW1_ROT(3)),'ZYX')';
RW2_ROTM = angle2dcm(deg2rad(RW2_ROT(1)),deg2rad(RW2_ROT(2)),deg2rad(RW2_ROT(3)),'ZYX')';
RW3_ROTM = angle2dcm(deg2rad(RW3_ROT(1)),deg2rad(RW3_ROT(2)),deg2rad(RW3_ROT(3)),'ZYX')';
RW4_ROTM = angle2dcm(deg2rad(RW4_ROT(1)),deg2rad(RW4_ROT(2)),deg2rad(RW4_ROT(3)),'ZYX')';

RW1_Axis = RW1_ROTM(:,3);
RW2_Axis = RW2_ROTM(:,3);
RW3_Axis = RW3_ROTM(:,3);
RW4_Axis = RW4_ROTM(:,3);
RW_As = [RW1_Axis,RW2_Axis,RW3_Axis,RW4_Axis];

Omega1_init = 1000*rpm2rad;
Omega2_init = 1000*rpm2rad;
Omega3_init = 1000*rpm2rad;
Omega4_init = 1000*rpm2rad;

%% RCS Configuration
RCS_F = 1.0;%[N]
RCS_PWM_Freq = 0.5;%[sec]
RCS_Sampling_time = 0.01;
% THR.info : https://satsearch.co/products/ecaps-22n-hpgp-thruster?utm_source=chatgpt.com
RCS_Facealpha = 1.0;

% % % % % % +Z Size % % % % % % % % %
RCS1_ROT = [0 90 0]';%ZYX [deg]
RCS2_ROT = [0 -90 0]';%ZYX [deg]
RCS3_ROT = [0 0 -90]';%ZYX [deg]
RCS4_ROT = [0 0 90]';%ZYX [deg]

RCS1_POS = [0.2 0 0.85]';%XYZ [m]
RCS2_POS = [-0.2 0 0.85]';%XYZ [m]
RCS3_POS = [0 0.2 0.85]';%XYZ [m]
RCS4_POS = [0 -0.2 0.85]';%XYZ [m]

RCS1_THR = [-1 0 0]';
RCS2_THR = [1 0 0]';
RCS3_THR = [0 -1 0]';
RCS4_THR = [0 1 0]';

% % % % % % -Z Size % % % % % % % % %
RCS5_ROT = [0 90 0]';%ZYX [deg]
RCS6_ROT = [0 -90 0]';%ZYX [deg]
RCS7_ROT = [0 0 -90]';%ZYX [deg]
RCS8_ROT = [0 0 90]';%ZYX [deg]

RCS5_POS = [0.2 0 -0.72]';%XYZ [m]
RCS6_POS = [-0.2 0 -0.72]';%XYZ [m]
RCS7_POS = [0 0.2 -0.72]';%XYZ [m]
RCS8_POS = [0 -0.2 -0.72]';%XYZ [m]

RCS5_THR = [-1 0 0]';
RCS6_THR = [1 0 0]';
RCS7_THR = [0 -1 0]';
RCS8_THR = [0 1 0]';

% % % % % % +Y Size % % % % % % % % %
RCS9_ROT   = [0 90 0]';%ZYX [deg]
RCS10_ROT = [0 -90 0]';%ZYX [deg]
RCS11_ROT = [0 180 0]';%ZYX [deg]
RCS12_ROT = [0 0 0]';%ZYX [deg]

RCS9_POS   = [0.2 0.85 0]';%ZYX [deg]
RCS10_POS = [-0.2 0.85 0]';%ZYX [deg]
RCS11_POS = [0 0.85 -0.2]';%ZYX [deg]
RCS12_POS = [0 0.85 0.2]';%ZYX [deg]

RCS9_THR  = [-1 0 0]';
RCS10_THR = [1 0 0]';
RCS11_THR = [0 0 1]';
RCS12_THR = [0 0 -1]';

% % % % % % -Y Size % % % % % % % % %
RCS13_ROT = [0 90 0]';%ZYX [deg]
RCS14_ROT = [0 -90 0]';%ZYX [deg]
RCS15_ROT = [0 180 0]';%ZYX [deg]
RCS16_ROT = [0 0 0]';%ZYX [deg]

RCS13_POS = [0.2 -0.85 0]';%ZYX [deg]
RCS14_POS = [-0.2 -0.85 0]';%ZYX [deg]
RCS15_POS = [0 -0.85 -0.2]';%ZYX [deg]
RCS16_POS = [0 -0.85 0.2]';%ZYX [deg]

RCS13_THR = [-1 0 0]';
RCS14_THR = [1 0 0]';
RCS15_THR = [0 0 1]';
RCS16_THR = [0 0 -1]';

RCS_Pos = [RCS1_POS , RCS2_POS , RCS3_POS , RCS4_POS ,...
           RCS5_POS , RCS6_POS , RCS7_POS , RCS8_POS ,...
           RCS9_POS , RCS10_POS, RCS11_POS, RCS12_POS,...
           RCS13_POS, RCS14_POS, RCS15_POS, RCS16_POS];

RCS_THR_vec = [RCS1_THR , RCS2_THR , RCS3_THR , RCS4_THR, ...
               RCS5_THR , RCS6_THR , RCS7_THR , RCS8_THR, ...
               RCS9_THR , RCS10_THR, RCS11_THR, RCS12_THR, ...
               RCS13_THR, RCS14_THR, RCS15_THR, RCS16_THR];


%% function
function statvec  = kepel_statvec(kepel)
%  [statvec] = kepel_statvec (kepel)
%	The function kepel_statvec transforms the keplerian
%	elements kepel into the corresponding state vector in
%	the same reference system.
%
% Input:
%	kepel
% 		vector containing the keplerian elements:
%		(1) - semimajor axis of the orbit in meters.
%		(2) - eccentricity.
%		(3) - inclinatsion in radians.
%		(4) - right ascension of ascending node in radians.
%		(5) - argument of perigee in radians.
%		(6) - mean anomaly in radians.
% Output:
%	statvec
%  		state vector in meters and meters/second.
%
% Authors:
%	Helio K. Kuga;
%	Valder M. Medeiros;
%	Valdemir Carrara		february/80		version 1.0
%	Valdemir Carrara		july 2005		(C version)
%   Valdemir Carrara            March/09        Matlab

EARTH_GRAVITY	= 3.9860064e+14;		% Earth's gravitational constant (m**3/s**2)

a    = kepel(1);	% semi-major axis
exc  = kepel(2);	% eccentricity

c1   = sqrt(1. - exc*exc);

%     rotation matrix

orb2iner = rotmaz(-kepel(4))*rotmax(-kepel(3))*rotmaz(-kepel(5));

%     Kepler's equation

E    = kepler(kepel(6), exc);

sE   = sin(E);
cE   = cos(E);
c3   = sqrt(EARTH_GRAVITY/a)/(1. - exc*cE);

%     state vector

statvec = [[a*(cE - exc), a*c1*sE, 0]*orb2iner', [-c3*sE, c1*c3*cE, 0]*orb2iner'];

end

function [eccentric] = kepler (mean_anomaly, eccentricity)
% [eccentric] = kepler (mean_anomaly, eccentricity)
%	The subroutine kepler finds a solution to the
%	kepler's equation.
%
% Input:
%	mean_anomaly
%		mean anomaly in radians.
%	eccentricity
%		eccentricity.
%
% Output:
%	eccentric
%		eccentric anomaly in radians.
%
% Authors:
%	Valder M. de Medeiros		june/81		version 2.0
%	Valdemir Carrara			july 2005	(C version)
%   Valdemir Carrara            March/09        Matlab

% http://www.jgiesen.de/kepler/kepler.html
exc2    = eccentricity*eccentricity;
am1     = mod (mean_anomaly, 2*pi);
am2     = am1 + am1;
am3     = am1 + am2;
shoot   = am1 + eccentricity*(1. - 0.125*exc2)*sin(am1) + ...
		0.5*exc2*(sin(am2) + 0.75*eccentricity*sin(am3));
shoot   = mod (shoot, 2*pi);

e1      = 1.0;
ic      = 0;

while ((abs(e1) > 1.e-12) && (ic <= 10)) 
	e1    = (shoot - am1 - eccentricity*sin(shoot)) / ...
			(1.0 - eccentricity*cos(shoot));
    shoot = shoot - e1;
    ic    = ic + 1;
end

if (ic >= 10)
    disp ('warning ** subroutine kepler did not converge in 10 iterations');
end

eccentric = shoot;
end

function [rot_mat] = rotmax (angle)
% [rot_mat] = rotmax (angle)
%   To obtain the rotation matrix around the X axis given the
%   rotation angle.
% inputs:
%   angle
%       rotation angle, in radians.
% outputs:
%   rot_mat
%       rotation matrix (3, 3)
%

% Valdemir Carrara, Sep, 1998

coan    =  cos(angle);
sian    =  sin(angle);

rot_mat =  [1, 0, 0; 0, coan, sian; 0, -sian, coan];

end

function [rot_mat] = rotmay (angle)
% [rot_mat] = rotmay (angle)
%   To obtain the rotation matrix around the Y axis given the
%   rotation angle.
% inputs:
%   angle
%       rotation angle, in radians.
% outputs:
%   rot_mat
%       rotation matrix (3, 3)
%

% Valdemir Carrara, Sep, 1998


coan    =  cos(angle);
sian    =  sin(angle);

rot_mat =  [coan, 0, -sian; 0, 1, 0; sian, 0, coan];

end

function [rot_mat] = rotmaz (angle)
% [rot_mat] = rotmaz (angle)
%   To obtain the rotation matrix around the Z axis given the
%   rotation angle.
% inputs:
%   angle
%       rotation angle, in radians.
% outputs:
%   rot_mat
%       rotation matrix (3, 3)
%

% Valdemir Carrara, Sep, 1998

coan    =  cos(angle);
sian    =  sin(angle);

rot_mat =  [coan, sian, 0; -sian, coan, 0; 0, 0, 1];
end


function out = kepler6_to_orbit_rate(kep)
%KEPLER6_TO_ORBIT_RATE  Kepler 6요소 -> orbit rate(mean motion) 반환
%
% kep = [a; e; i; RAAN; argp; M]  (rad)
%   a [m] 만으로 mean motion n이 결정.
% (1) - semimajor axis of the orbit in meters. 
% (2) - eccentricity. 
% (3) - inclinatsion in radians. 
% (4) - right ascension of ascending node in radians. 
% (5) - argument of perigee in radians. 
% (6) - mean anomaly in radians.
%
% out:
%   out.n_rad_s   : mean motion [rad/s]
%   out.n_deg_s   : mean motion [deg/s]
%   out.n_rev_day : mean motion [rev/day]
%   out.period_s  : orbital period [s]
%   out.period_min: orbital period [min]

mu = 3.986004418e14; % Earth [m^3/s^2]

a = kep(1);

% mean motion
n = sqrt(mu / (a^3));           % [rad/s]

out = n;

end