close all;
clc;

t = out.tout;
SS_POS_I = out.SS_POS_I;

n = 600;
Re = 6378137;

% sphere
[x, y, z] = sphere(n);
X = Re * x;
Y = Re * y;
Z = Re * z;

% texture image
texfile = 'earth_texture.jpg';
img = imread(texfile);

% orientation fix
img = flipud(img);

figure('Color','k');
hold on; grid on;

% 변환 객체 생성
ht = hgtransform;

% Earth
hs = surf(X, Y, Z, img, ...
    'FaceColor', 'texturemap', ...
    'EdgeColor', 'none', ...
    'FaceLighting', 'gouraud', ...
    'SpecularStrength', 0.08, ...
    'DiffuseStrength', 0.9, ...
    'AmbientStrength', 0.35, ...
    'FaceAlpha', 0.5, ...
    'Parent', ht);   % <-- 여기 중요

% background
% set(gca, 'Color', 'k');
ax = gca;
ax.Color = 'k';
% axis equal off vis3d
axis equal on vis3d
ax.GridColor = [1 1 1];      % 흰색
ax.GridAlpha = 0.25;         % 투명도
ax.MinorGridColor = [1 1 1]; % minor grid 색
ax.MinorGridAlpha = 0.15;
ax.XColor = 'w';
ax.YColor = 'w';
ax.ZColor = 'w';

% camera
view(35, 22);
% camproj('perspective');

% lights
% camlight('headlight');
% light('Position', [1 0.2 1], 'Style', 'infinite');
% lighting gouraud
% material dull

quiver3(0,0,0,Re*2.0,0,0,'w','LineWidth',2);
quiver3(0,0,0,0,Re*2.0,0,'w','LineWidth',2);
quiver3(0,0,0,0,0,Re*2.0,'w','LineWidth',2);
text(Re*2.0,0,0, 'ECI X [m]', ...
    'Color', 'w', ...
    'FontSize', 12, ...
    'HorizontalAlignment', 'left', ...
    'VerticalAlignment', 'bottom');
text(0,Re*2,0, 'ECI Y [m]', ...
    'Color', 'w', ...
    'FontSize', 12, ...
    'HorizontalAlignment', 'left', ...
    'VerticalAlignment', 'bottom');
text(0,0,Re*2, 'ECI Z [m]', ...
    'Color', 'w', ...
    'FontSize', 12, ...
    'HorizontalAlignment', 'left', ...
    'VerticalAlignment', 'bottom');

xlabel('ECI X [m]', 'Color', 'w');
ylabel('ECI Y [m]', 'Color', 'w');
zlabel('ECI Z [m]', 'Color', 'w');

plot3(SS_POS_I(:,1), SS_POS_I(:,2), SS_POS_I(:,3), 'y-', 'LineWidth',2)
plot3(SS_POS_I(1,1), SS_POS_I(1,2), SS_POS_I(1,3), 'yo', 'MarkerSize',15,'MarkerFaceColor','b');
plot3(SS_POS_I(end,1), SS_POS_I(end,2), SS_POS_I(end,3), 'yd', 'MarkerSize',15,'MarkerFaceColor','b');

sat_pos_hlr = plot3(SS_POS_I(1,1), SS_POS_I(1,2), SS_POS_I(1,3), 'yo', 'MarkerSize',15,'MarkerFaceColor','b');

for i=1:500:length(t)
    set(sat_pos_hlr, 'XData', SS_POS_I(i,1), 'YData', SS_POS_I(i,2), 'ZData', SS_POS_I(i,3));

    drawnow;
end
