clear all;

% Creating four points emulating marker oriented above the plane
% rsho = [2 1 1];
% lsho = [1 1 1];
% chst = [1.5 2 1];
% c7 = [1.5 0 1];
% rfin = [1 2 1; -1.5 2 1; 0 2.5 1.5; 1 2.5 0; 1 3 -1; 1 3.5 -2; 1 1 -1];

rsho = [-51.1391 912.716 1560.53];
lsho = [265.488 941.231 1470.6];
chst = [93.1327 792.174 1457.21];
c7 = [96.6188 962.327 1549.21];
rfin = [-685.262 922.024 1330.59];

% rfinA = [1 2 1];
% rfinB = [1 2.5 0];
% rfinC = [1 3 -1];
% rfinD = [1 3.5 -2];
% rfinE = [1 1 -1];

% Creating four points emulating marker oriented below the plane
% rsho = [1 1 2];
% lsho = [2 1 3];
% chst = [2 2 1];
% c7 = [1 2 0]; 

% Plotting 4 points
% figure;
plot3(rsho(1),rsho(2),rsho(3),'or');
hold on;
plot3(lsho(1),lsho(2),lsho(3),'or');
plot3(chst(1),chst(2),chst(3),'og');
plot3(c7(1),c7(2),c7(3),'ob');
plot3(rfin(1,1),rfin(1,2),rfin(1,3),'oc');
% plot3(rfin(2,1),rfin(2,2),rfin(2,3),'oc');
% plot3(rfin(3,1),rfin(3,2),rfin(3,3),'oc');
% plot3(rfin(4,1),rfin(4,2),rfin(4,3),'oc');
% plot3(rfin(5,1),rfin(5,2),rfin(5,3),'oc');
% plot3(rfin(6,1),rfin(6,2),rfin(6,3),'oc');

xlabel(' x ');
ylabel(' Y ');
zlabel(' Z ');
% xlim([-2 5])
% ylim([-2 5])
% zlim([-2 5])

pause(8)
run_transform = true;

if run_transform
    % orienting the point 4 in same plane as other 3 points
    % Plane 1 = 1,2,3
    % Creating vector between points 1 and 2
    vec12 = lsho - rsho;
    vec12_p = [rsho; rsho+vec12];
    vec12_UV = vec12./vecnorm(vec12);
    plot3(vec12_p(:,1),vec12_p(:,2),vec12_p(:,3),'c', 'LineWidth',0.5);

    % Creating vector between points 1 and 3
    vec13 = c7 - rsho;
    vec13_p = [rsho; rsho+vec13];
    vec13_UV = vec13./vecnorm(vec13);
    plot3(vec13_p(:,1),vec13_p(:,2),vec13_p(:,3),'c', 'LineWidth',0.5);

    % Creating vector between points 2 and 3
    vec23 = chst - rsho;
    vec23_p = [rsho; rsho+vec23];
    vec23_UV = vec23./vecnorm(vec23);
    plot3(vec23_p(:,1),vec23_p(:,2),vec23_p(:,3),'c', 'LineWidth',0.5);

     % computing new axis perpendicular to the desired plane
    ih = cross(vec13_UV, vec12_UV);
    ih_UV = ih./vecnorm(ih);
    vec1i_p = [rsho; rsho+ih];
    plot3(vec1i_p(:,1),vec1i_p(:,2),vec1i_p(:,3),'y', 'LineWidth',0.5)
    
%     Creating vectors to rfin
    vec_lsho_rfin = rfin - rsho;
    vec_lsho_rfin_UV = vec_lsho_rfin./vecnorm(vec_lsho_rfin')';
    
    angle = rfin(:,1);
    k=1
%     for k = 1:length(vec_lsho_rfin_UV)
        vec_lsho_rfin_p = [rsho; rsho+vec_lsho_rfin(k,:)];
        plot3(vec_lsho_rfin_p(:,1),vec_lsho_rfin_p(:,2),vec_lsho_rfin_p(:,3),'g', 'LineWidth',0.5);
        angle(k) = atan2(norm(cross(ih,vec_lsho_rfin_UV(k,:))), dot(ih,vec_lsho_rfin_UV(k,:)));
        angle_rsho = rad2deg(angle);
%     end
    angle_rsho
    
   end
