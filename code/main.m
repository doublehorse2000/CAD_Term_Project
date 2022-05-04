initial;
scrsz = get(0,'ScreenSize');
figure1=figure('Position',[0 0 1920 1080-80]);
for j = 1: (FPS * time)
    hold on;
    view(73,18);
    xlim([-3 5]);ylim([-3 3]);zlim([-3 3]);
    axis image;axis off;
    joint.move_head(0,0,0,head(j),0,0);
    joint.move_shoulder_l(0,0,0,shoulder_l(j),shoulder_l(j),0);
    joint.move_shoulder_r(0,0,0,shoulder_r(j),0,0);
    for i = 1:size(joint.m_mesh,2)
        [Sx,Sy,Sz] = joint.m_mesh(i).make_mesh();
    end
    drawnow;
    frame = getframe(figure1);
    im{j} = frame2im(frame);
    pause(1/FPS);
    clf;
end
filename = 'fufu.gif';
for i = 1:FPS*time
    [A,map] = rgb2ind(im{i},256);
    if i == 1
        imwrite(A,map,filename,'gif','LoopCount',inf,'DelayTime',0.1);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.1);
    end
end
close all;
hold off;