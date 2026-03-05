function [statvec] = orbit_maker(kepel)
% kepler_el
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

% kep_a = kepel(1);
% kep_e = kepel(2);
% kep_i = kepel(3);
% kep_r = kepel(4);
% kep_p = kepel(5);
% kep_m = kepel(6);

kep_m = (0:0.01:2*pi)';

for i=1:length(kep_m)
    kepel_ = [kepel(1),kepel(2),kepel(3),kepel(4),kepel(5),kep_m(i,:)];
    statvec(i,:) = kepel_statvec(kepel_);
end



end

