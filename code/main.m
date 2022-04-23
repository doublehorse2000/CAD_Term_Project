initial;

figure(1)
hold on;
for i = 1:size(joint.m_mesh)
    [Sx,Sy,Sz] = joint.m_mesh(i).make_mesh();
    surf(Sx,Sy,Sz);colormap(jet);
end
xlim([-3 3]);ylim([-3 3]);zlim([-3 3]);
view(71,48);
axis equal;
axis off;
hold off;