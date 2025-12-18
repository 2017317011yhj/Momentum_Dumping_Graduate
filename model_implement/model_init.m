clear all;
close all;
clc;

dt = 0.001;
SC_Kepler = [(6371.2+600)*1000, 0.00221, 0*pi/180, 0*pi/180, 0, 0];

w_orbit = kepler6_to_orbit_rate(SC_Kepler);%orbit rate : [rad/s]

%% 
% RW1
RW1_ROT = [0 45 0]';%ZYX [deg]
RW2_ROT = [0 0 -45]';%ZYX [deg]
RW3_ROT = [0 -45 0]';%ZYX [deg]
RW4_ROT = [0 0 45]';%ZYX [deg]
RW1_POS = [0.5 0 0]';%XYZ [m]
RW2_POS = [0 0.5 0]';%XYZ [m]
RW3_POS = [-0.5 0 0]';%XYZ [m]
RW4_POS = [0 -0.5 0]';%XYZ [m]


%%
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

%% 
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

%%
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

%%
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

%%
RCS_Pos = [RCS1_POS, RCS2_POS  ,RCS3_POS  ,RCS4_POS,...
                RCS5_POS, RCS6_POS  ,RCS7_POS  ,RCS8_POS,...
                RCS9_POS, RCS10_POS,RCS11_POS,RCS12_POS,...
                RCS13_POS, RCS14_POS,RCS15_POS,RCS16_POS];

RCS_THR_vec = [RCS1_THR,RCS2_THR,RCS3_THR,RCS4_THR, ...
                      RCS5_THR,RCS6_THR,RCS7_THR,RCS8_THR, ...
                      RCS9_THR,RCS10_THR,RCS11_THR,RCS12_THR, ...
                      RCS13_THR,RCS14_THR,RCS15_THR,RCS16_THR];


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

% out.n_rad_s   = n;
% out.n_deg_s   = n * (180/pi);
% out.n_rev_day = n * (86400/(2*pi));  % rev/day
% 
% out.period_s   = 2*pi / n;
% out.period_min = out.period_s / 60;

out = n;

end

