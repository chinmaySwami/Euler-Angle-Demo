clear all;

% Creating four points emulating marker oriented above the plane
rsho = [2 1 1];
lsho = [1 1 1];
chst = [1.5 2 1];
c7 = [1.5 0 1];
rfinA = [1 2 1];
rfinB = [1 2.5 0];
rfinC = [1 3 -1];
rfinD = [1 3.5 -2];
rfinE = [1 1 -1];

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
plot3(rfinA(1),rfinA(2),rfinA(3),'oc');
plot3(rfinB(1),rfinB(2),rfinB(3),'oc');
plot3(rfinC(1),rfinC(2),rfinC(3),'oc');
plot3(rfinD(1),rfinD(2),rfinD(3),'oc');
plot3(rfinE(1),rfinE(2),rfinE(3),'oc');

xlabel(' x ');
ylabel(' Y ');
zlabel(' Z ');
xlim([-2 5])
ylim([-2 5])
zlim([-2 5])

pause(8)
run_transform = true;

if run_transform
    % orienting the point 4 in same plane as other 3 points
    % Plane 1 = 1,2,3
    % Creating vector between points 1 and 2
    vec12 = rsho - lsho;
    vec12_p = [lsho; lsho+vec12];
    vec12_UV = vec12./vecnorm(vec12);
    plot3(vec12_p(:,1),vec12_p(:,2),vec12_p(:,3),'c', 'LineWidth',0.5);

    % Creating vector between points 1 and 3
    vec13 = chst - lsho;
    vec13_p = [lsho; lsho+vec13];
    vec13_UV = vec13./vecnorm(vec13);
    plot3(vec13_p(:,1),vec13_p(:,2),vec13_p(:,3),'c', 'LineWidth',0.5);

    % Creating vector between points 2 and 3
    vec23 = chst - lsho;
    vec23_p = [lsho; lsho+vec23];
    vec23_UV = vec23./vecnorm(vec23);
    plot3(vec23_p(:,1),vec23_p(:,2),vec23_p(:,3),'c', 'LineWidth',0.5);

     % computing new axis perpendicular to the desired plane
    ih = cross(vec12_UV, vec13_UV);
    ih_UV = ih./vecnorm(ih);
    vec1i_p = [lsho; lsho+ih];
    plot3(vec1i_p(:,1),vec1i_p(:,2),vec1i_p(:,3),'c', 'LineWidth',0.5)

    % Creating vector between points 2 and 4
    vec24 = c7 - lsho;
    vec24_p = [lsho; lsho+vec24];
    vec24_UV = vec24./vecnorm(vec24);
    plot3(vec24_p(:,1),vec24_p(:,2),vec24_p(:,3),'m', 'LineWidth',0.5);
    
%     Creating vectors to rfin
    
    vec_lsho_rfinA = rfinA - lsho;
    vec_lsho_rfinA_p = [lsho; lsho+vec_lsho_rfinA];
    vec_lsho_rfinA_UV = vec_lsho_rfinA./vecnorm(vec_lsho_rfinA);
    plot3(vec_lsho_rfinA_p(:,1),vec_lsho_rfinA_p(:,2),vec_lsho_rfinA_p(:,3),'g', 'LineWidth',0.5);
    
    
    vec_lsho_rfinB = rfinB - lsho;
    vec_lsho_rfinB_p = [lsho; lsho+vec_lsho_rfinB];
    vec_lsho_rfinB_UV = vec_lsho_rfinB./vecnorm(vec_lsho_rfinB);
    plot3(vec_lsho_rfinB_p(:,1),vec_lsho_rfinB_p(:,2),vec_lsho_rfinB_p(:,3),'g', 'LineWidth',0.5);
    
    vec_lsho_rfinC = rfinC - lsho;
    vec_lsho_rfinC_p = [lsho; lsho+vec_lsho_rfinC];
    vec_lsho_rfinC_UV = vec_lsho_rfinC./vecnorm(vec_lsho_rfinC);
    plot3(vec_lsho_rfinC_p(:,1),vec_lsho_rfinC_p(:,2),vec_lsho_rfinC_p(:,3),'g', 'LineWidth',0.5);
    
    vec_lsho_rfinD = rfinD - lsho;
    vec_lsho_rfinD_p = [lsho; lsho+vec_lsho_rfinD];
    vec_lsho_rfinD_UV = vec_lsho_rfinD./vecnorm(vec_lsho_rfinD);
    plot3(vec_lsho_rfinD_p(:,1),vec_lsho_rfinD_p(:,2),vec_lsho_rfinD_p(:,3),'g', 'LineWidth',0.5);
    
    vec_lsho_rfinE = rfinE - lsho;
    vec_lsho_rfinE_p = [lsho; lsho+vec_lsho_rfinE];
    vec_lsho_rfinE_UV = vec_lsho_rfinE./vecnorm(vec_lsho_rfinE);
    plot3(vec_lsho_rfinE_p(:,1),vec_lsho_rfinE_p(:,2),vec_lsho_rfinE_p(:,3),'g', 'LineWidth',0.5);
    
    
    % Computing angle between vectors
    
    angle = atan2(norm(cross(ih,vec_lsho_rfinA)), dot(ih,vec_lsho_rfinA));
    angle_rshoA = rad2deg(angle)
    
    angle = atan2(norm(cross(ih,vec_lsho_rfinB)), dot(ih,vec_lsho_rfinB));
    angle_rshoB = rad2deg(angle)
    
    angle = atan2(norm(cross(ih,vec_lsho_rfinC)), dot(ih,vec_lsho_rfinC));
    angle_rshoC = rad2deg(angle)
    
    angle = atan2(norm(cross(ih,vec_lsho_rfinD)), dot(ih,vec_lsho_rfinD));
    angle_rshoD = rad2deg(angle)
    
    angle = atan2(norm(cross(ih,vec_lsho_rfinE)), dot(ih,vec_lsho_rfinE));
    angle_rshoE = rad2deg(angle)
    
   end
