classdef control_joint < handle
    %UNTITLED 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        m_world,%double[3]
        m_head,%double[3]
        m_shoulder_l,%double[3]
        m_shoulder_r,%double[3]
        m_leg_l,%double[3]
        m_leg_r,%double[3]
        m_knee_l,%double[3]
        m_knee_r,%double[3]
        m_mesh%control_mesh[]
        m_a;%constant
    end
    
    methods
        function obj = control_joint(m_mesh)
            obj.m_world = [0 0 0];
            obj.m_head = [0.006061,-3.55271e-15,2.42653];
            obj.m_shoulder_l = [0,0.469285,2.14514];
            obj.m_shoulder_r = [0,-0.469285,2.14514];
            obj.m_leg_l = [0 0 0];
            obj.m_leg_r = [0 0 0];
            obj.m_knee_l = [0 0 0];
            obj.m_knee_r = [0 0 0];
            obj.m_mesh = m_mesh;
            obj.m_a = 0.5;
        end
        
        function move_world(obj,x,y,z,alpha,beta,gammar)
            for i = 1:size(obj.m_mesh,2)
                for j = 1:16
                    n = [obj.m_mesh(i).m_point(j).m_x
                        obj.m_mesh(i).m_point(j).m_y
                        obj.m_mesh(i).m_point(j).m_z
                        1]';
                    T1 = [1 0 0 0;
                        0 1 0 0;
                        0 0 1 0;
                        -obj.m_world(1) -obj.m_world(2) -obj.m_world(3) 1];
                    T2 = [1 0 0 0;
                        0 1 0 0;
                        0 0 1 0;
                        x y z 1;];
                    T3 = [1 0 0 0;
                        0 cos(alpha) sin(alpha) 0;
                        0 -sin(alpha) cos(alpha) 0;
                        0 0 0 1];
                    T4 = [cos(beta) 0 -sin(beta) 0;
                        0 1 0 0;
                        sin(beta) 0 cos(beta) 0;
                        0 0 0 1];
                    T5 = [cos(gammar) sin(gammar) 0 0;
                        -sin(gammar) cos(gammar) 0 0;
                        0 0 1 0;
                        0 0 0 1;];
                    T6 = [1 0 0 0;
                        0 1 0 0;
                        0 0 1 0;
                        obj.m_world(1) obj.m_world(2) obj.m_world(3) 1];
                    temp = n * T1 * T2 * T3 * T4 * T5 * T6;
                    obj.m_world(1) = obj.m_world(1) + x;
                    obj.m_world(2) = obj.m_world(2) + y;
                    obj.m_world(3) = obj.m_world(3) + z;
                    obj.m_mesh(i).m_point(j).m_x = temp(1);
                    obj.m_mesh(i).m_point(j).m_y = temp(2);
                    obj.m_mesh(i).m_point(j).m_z = temp(3);
                end
            end
        end
        
        function move_head(obj,x,y,z,alpha,beta,gammar)
            for i = 1:size(obj.m_mesh,2)
                for j = 1:16
                    if obj.m_mesh(i).m_point(j).m_level == 1
                        n = [obj.m_mesh(i).m_point(j).m_x
                            obj.m_mesh(i).m_point(j).m_y
                            obj.m_mesh(i).m_point(j).m_z
                            1]';
                        T1 = [1 0 0 0;
                            0 1 0 0;
                            0 0 1 0;
                            -obj.m_head(1) -obj.m_head(2) -obj.m_head(3) 1];
                        T2 = [1 0 0 0;
                            0 1 0 0;
                            0 0 1 0;
                            x y z 1;];
                        T3 = [1 0 0 0;
                            0 cos(alpha) sin(alpha) 0;
                            0 -sin(alpha) cos(alpha) 0;
                            0 0 0 1];
                        T4 = [cos(beta) 0 -sin(beta) 0;
                            0 1 0 0;
                            sin(beta) 0 cos(beta) 0;
                            0 0 0 1];
                        T5 = [cos(gammar) sin(gammar) 0 0;
                            -sin(gammar) cos(gammar) 0 0;
                            0 0 1 0;
                            0 0 0 1;];
                        T6 = [1 0 0 0;
                            0 1 0 0;
                            0 0 1 0;
                            obj.m_head(1) obj.m_head(2) obj.m_head(3) 1];
                        temp = n * T1 * T2 * T3 * T4 * T5 * T6;
                        obj.m_mesh(i).m_point(j).m_x = temp(1);
                        obj.m_mesh(i).m_point(j).m_y = temp(2);
                        obj.m_mesh(i).m_point(j).m_z = temp(3);
                    else
                        continue
                    end
                end
            end
            obj.m_head(1) = obj.m_head(1) + x;
            obj.m_head(2) = obj.m_head(2) + y;
            obj.m_head(3) = obj.m_head(3) + z;
        end
        
        function move_shoulder_l(obj,x,y,z,alpha,beta,gammar)
            for i = 1:size(obj.m_mesh,2)
                for j = 1:16
                    if obj.m_mesh(i).m_point(j).m_level == 2 %|| obj.m_mesh(i).m_point(j).m_level == 21
                        n = [obj.m_mesh(i).m_point(j).m_x
                            obj.m_mesh(i).m_point(j).m_y
                            obj.m_mesh(i).m_point(j).m_z
                            1]';
                        T1 = [1 0 0 0;
                            0 1 0 0;
                            0 0 1 0;
                            -obj.m_shoulder_l(1) -obj.m_shoulder_l(2) -obj.m_shoulder_l(3) 1];
                        T2 = [1 0 0 0;
                            0 1 0 0;
                            0 0 1 0;
                            x y z 1;];
                        T3 = [1 0 0 0;
                            0 cos(alpha) sin(alpha) 0;
                            0 -sin(alpha) cos(alpha) 0;
                            0 0 0 1];
                        T4 = [cos(beta) 0 -sin(beta) 0;
                            0 1 0 0;
                            sin(beta) 0 cos(beta) 0;
                            0 0 0 1];
                        T5 = [cos(gammar) sin(gammar) 0 0;
                            -sin(gammar) cos(gammar) 0 0;
                            0 0 1 0;
                            0 0 0 1;];
                        T6 = [1 0 0 0;
                            0 1 0 0;
                            0 0 1 0;
                            obj.m_shoulder_l(1) obj.m_shoulder_l(2) obj.m_shoulder_l(3) 1];
                        temp = n * T1 * T2 * T3 * T4 * T5 * T6;
                        obj.m_mesh(i).m_point(j).m_x = temp(1);
                        obj.m_mesh(i).m_point(j).m_y = temp(2);
                        obj.m_mesh(i).m_point(j).m_z = temp(3);
                    else
                        continue
                    end
                end
            end
            obj.m_shoulder_l(1) = obj.m_shoulder_l(1) + x;
            obj.m_shoulder_l(2) = obj.m_shoulder_l(2) + y;
            obj.m_shoulder_l(3) = obj.m_shoulder_l(3) + z;
        end
        
        function move_shoulder_r(obj,x,y,z,alpha,beta,gammar)
            for i = 1:size(obj.m_mesh,2)
                for j = 1:16
                    if obj.m_mesh(i).m_point(j).m_level == 3 || obj.m_mesh(i).m_point(j).m_level == 31
                        n = [obj.m_mesh(i).m_point(j).m_x
                            obj.m_mesh(i).m_point(j).m_y
                            obj.m_mesh(i).m_point(j).m_z
                            1]';
                        T1 = [1 0 0 0;
                            0 1 0 0;
                            0 0 1 0;
                            -obj.m_shoulder_r(1) -obj.m_shoulder_r(2) -obj.m_shoulder_r(3) 1];
                        T2 = [1 0 0 0;
                            0 1 0 0;
                            0 0 1 0;
                            x y z 1;];
                        T3 = [1 0 0 0;
                            0 cos(alpha) sin(alpha) 0;
                            0 -sin(alpha) cos(alpha) 0;
                            0 0 0 1];
                        T4 = [cos(beta) 0 -sin(beta) 0;
                            0 1 0 0;
                            sin(beta) 0 cos(beta) 0;
                            0 0 0 1];
                        T5 = [cos(gammar) sin(gammar) 0 0;
                            -sin(gammar) cos(gammar) 0 0;
                            0 0 1 0;
                            0 0 0 1;];
                        T6 = [1 0 0 0;
                            0 1 0 0;
                            0 0 1 0;
                            obj.m_shoulder_r(1) obj.m_shoulder_r(2) obj.m_shoulder_r(3) 1];
                        temp = n * T1 * T2 * T3 * T4 * T5 * T6;
                        obj.m_mesh(i).m_point(j).m_x = temp(1);
                        obj.m_mesh(i).m_point(j).m_y = temp(2);
                        obj.m_mesh(i).m_point(j).m_z = temp(3);
                    else
                        continue
                    end
                end
            end
            obj.m_shoulder_r(1) = obj.m_shoulder_r(1) + x;
            obj.m_shoulder_r(2) = obj.m_shoulder_r(2) + y;
            obj.m_shoulder_r(3) = obj.m_shoulder_r(3) + z;
        end
        
    end
end

