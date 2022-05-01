initial;
scrsz = get(0,'ScreenSize');
figure1=figure('Position',[0 0 1920 1080-80]);
hold on;
view(94,5);
xlim([-3 5]);ylim([-3 3]);zlim([-3 3]);
axis image;axis off;
for i = 1:size(joint.m_mesh,2)
    [Sx,Sy,Sz] = joint.m_mesh(i).make_mesh();
end
hold off;