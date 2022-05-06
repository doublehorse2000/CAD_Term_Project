initial;
scrsz = get(0,'ScreenSize');
figure1=figure('Position',[0 0 1920 1080]);
v = VideoWriter('fufu.avi','Uncompressed AVI');
v.FrameRate = 60;
open(v);
for j = 1: 769
    hold on;
    view(73,18);
    xlim([-3 5]);ylim([-3 3]);zlim([-3 3]);
    axis image;axis off;
    for i = 1:size(joint.m_mesh,2)
        [Sx,Sy,Sz] = joint.m_mesh(i).make_mesh();
    end
    joint.move_head(0,0,0,head(j),0,0);
    joint.move_shoulder_l(0,0,0,shoulder_l(1,j),0,shoulder_l(2,j));
    joint.move_shoulder_r(0,0,0,shoulder_r(1,j),0,shoulder_r(2,j));
    F = getframe(gcf);
    writeVideo(v,F);
    clf;
end
close(v);
close all;
hold off;