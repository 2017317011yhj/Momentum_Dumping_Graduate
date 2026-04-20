close all;
clc;

Re = 6378.137;
% Re = 0;

t = out.tout;
state = out.state;
f_vec = out.f_vec.*10000;
tran_flg = out.tran_flg;

pos = state(:,1:3)/1000;
vel = state(:,4:6)*2;

% w0 = [-6621.949926 -485.079670 -766.522384 ...
%       -0.009311    -9.175045    -4.536935 ...
%       5233.5];

figure;
[X,Y,Z] = sphere;
surf(X*Re,Y*Re,Z*Re);
grid on; hold on;
plot3(pos(1,1),pos(1,2),pos(1,3),'b.','MarkerSize',40);
grid on; hold on;
axis equal;
% axis([-200000 200000 -20000 20000 -20000 20000])
plot3(pos(:,1),pos(:,2),pos(:,3),'k-','LineWidth',3);

quiver3(0,0,0,10000,0,0,'k','LineWidth',3);
quiver3(0,0,0,0,10000,0,'k','LineWidth',3);
quiver3(0,0,0,0,0,10000,'k','LineWidth',3);
xlabel('Pos X[m]');
ylabel('Pos Y[m]');
zlabel('Pos Z[m]');
view(0, 90);

sat_pos_hadler = plot3(pos(1,1),pos(1,2),pos(1,3),'k.','MarkerSize',40);

for i=1:50:length(pos)
%     quiver3(pos(i,1),pos(i,2),pos(i,3),...
%             f_vec(i,1),f_vec(i,2),f_vec(i,3),'r','LineWidth',3)
    if tran_flg(i,1) == 1
        set(sat_pos_hadler, 'XData', pos(i,1), 'XData', pos(i,1), 'YData', pos(i,2), 'ZData', pos(i,3))
%         plot3(pos(i,1),pos(i,2),pos(i,3),'k.','MarkerSize',30);
%         quiver3(pos(i,1),pos(i,2),pos(i,3),...
%                 vel(i,1),vel(i,2),vel(i,3),'m','LineWidth',3)
    elseif tran_flg(i,1) == 2
        set(sat_pos_hadler, 'XData', pos(i,1), 'XData', pos(i,1), 'YData', pos(i,2), 'ZData', pos(i,3))
%         plot3(pos(i,1),pos(i,2),pos(i,3),'k.','MarkerSize',30);
%         quiver3(pos(i,1),pos(i,2),pos(i,3),...
%                 vel(i,1),vel(i,2),vel(i,3),'b','LineWidth',3)
    else
        set(sat_pos_hadler, 'XData', pos(i,1), 'XData', pos(i,1), 'YData', pos(i,2), 'ZData', pos(i,3))
%         plot3(pos(i,1),pos(i,2),pos(i,3),'k.','MarkerSize',30);
%         quiver3(pos(i,1),pos(i,2),pos(i,3),...
%                 vel(i,1),vel(i,2),vel(i,3),'g','LineWidth',3)
    end

%     quiver3(pos(i,1),pos(i,2),pos(i,3),...
%             vel(i,1),vel(i,2),vel(i,3),'b','LineWidth',3)
%     quiver3(pos(i,1),pos(i,2),pos(i,3),...
%             f_vec(i,1),f_vec(i,2),f_vec(i,3),'r','LineWidth',3)
    drawnow;
    pause((1/norm(vel))*100000);
end
