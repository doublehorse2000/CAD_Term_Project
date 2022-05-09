% Copyright (C) 2022:
% - Hengyang Feng <hengyang9311@163.com>
% - Hanqi Zhu <277577697@qq.com>
% - Junxian Fang<bang990104@naver.com>
% All Rights Reserved.
classdef control_point < handle
    properties
        m_x,
        m_y,
        m_z,
        m_level
    end
    methods
        function obj = control_point(x,y,z,level)
            obj.m_y = x;
            obj.m_z = y;
            obj.m_x = z;
            obj.m_level = level;
        end
    end
end

