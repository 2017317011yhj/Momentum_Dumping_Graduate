clear all;
close all;
clc;

deg2rad = pi/180;
km2m    = 1000;

Simulation_Time = 10000;
% ss_kep
TS_Kep_init = [(6371.8 + 550)*km2m 0 45*deg2rad 0*deg2rad 0*deg2rad 0.00000*deg2rad];
TS_state0   = kepel_statvec(TS_Kep_init);
% ts_kep
SS_Kep_init = [(6371.8 + 550)*km2m 0 45*deg2rad 0*deg2rad 0*deg2rad 0.00002*deg2rad];
SS_state0   = kepel_statvec(SS_Kep_init);
% get relative pos
relative_state0 = TS_state0 - SS_state0;
relative_pos0   = [relative_state0(1), relative_state0(2), relative_state0(3)]';
relative_vel0   = [relative_state0(4), relative_state0(5), relative_state0(6)]';

open_system('relative_test.slx');

% sim('relative_test',Simulation_Time); 


% [dfdt, State] = get_cheif_init_state(initial_condition)

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



