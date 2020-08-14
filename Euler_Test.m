clear all;

XYZ_Origin = [0 0 0];
XYZ =[3 0 0; 0 3 0; 0 0 3];

alp = 90; % Rotate around X Axis
bet = 90; % Rotate around Y Axis
gam = 90; % Rotate around Z Axis

% 3 plots in 1 figure 
figure;
plot3(XYZ_Origin(1),XYZ_Origin(2),XYZ_Origin(3),'o');
hold on
    
vecx = [XYZ_Origin; XYZ(1,:)];
vecy = [XYZ_Origin; XYZ(2,:)];
vecz = [XYZ_Origin; XYZ(3,:)];

plot3(vecx(:,1),vecx(:,2),vecx(:,3),'r', 'LineWidth',0.5);
plot3(vecy(:,1),vecy(:,2),vecy(:,3),'g', 'LineWidth',0.5);
plot3(vecz(:,1),vecz(:,2),vecz(:,3),'b', 'LineWidth',0.5);

xlabel(' x ');
ylabel(' Y ');
zlabel(' Z ');
xlim([-5 5])
ylim([-5 5])
zlim([-5 5])
title('Rotating sequence Z-X-Y around moving frame')


pause(8)
disp('Rotating around Z axis')

R_X = [1 0 0; 0 cosd(alp) -sind(alp); 0 sind(alp) cosd(alp)];
R_Y = [cosd(bet) 0 sind(bet) ; 0 1 0; -sind(bet) 0 cosd(bet)];
R_Z = [cosd(gam) -sind(gam) 0; sind(gam) cosd(gam) 0; 0 0 1];

% R_Mat = R_Z*R_Y*R_X
for i = 1:3
    if i == 1
        z = R_Z * XYZ;

        vecx = [XYZ_Origin; z(1,:)];
        vecy = [XYZ_Origin; z(2,:)];
        vecz = [XYZ_Origin; z(3,:)];

        plot3(vecx(:,1),vecx(:,2),vecx(:,3),'-.r', 'LineWidth',1);
        plot3(vecy(:,1),vecy(:,2),vecy(:,3),'-.g', 'LineWidth',1);
        plot3(vecz(:,1),vecz(:,2),vecz(:,3),'-.b', 'LineWidth',1);
        disp('Rotating around x Axis')
        title('Rotated around Z axis by 90 degrees')
        disp(z)
        pause(8)
    end
    if i == 2
        z = R_X * z;

        vecx = [XYZ_Origin; z(1,:)];
        vecy = [XYZ_Origin; z(2,:)];
        vecz = [XYZ_Origin; z(3,:)];

        plot3(vecx(:,1),vecx(:,2),vecx(:,3),'--r', 'LineWidth',1);
        plot3(vecy(:,1),vecy(:,2),vecy(:,3),'--g', 'LineWidth',1);
        plot3(vecz(:,1),vecz(:,2),vecz(:,3),'--b', 'LineWidth',1);
        disp('Rotating around Y Axis')
        title('Rotated around X axis by 90 degrees')
        disp(z)
        pause(8)
    end
    if i == 3
        z = R_Y * z;

        vecx = [XYZ_Origin; z(1,:)];
        vecy = [XYZ_Origin; z(2,:)];
        vecz = [XYZ_Origin; z(3,:)];

        plot3(vecx(:,1),vecx(:,2),vecx(:,3),'--r', 'LineWidth',2);
        plot3(vecy(:,1),vecy(:,2),vecy(:,3),'--g', 'LineWidth',2);
        plot3(vecz(:,1),vecz(:,2),vecz(:,3),'--b', 'LineWidth',2);
        title('Rotated around Y axis by 90 degrees')
        disp(z)
    end
   
end