# CAD_Term_Project
本仓库为数字化设计与制造的大作业

## Matlab脚本

### 1.control_joint类

```c++
class control_joint{
    double m_world[3];//
    double m_head[3];//level = 1
    double m_shoulder_l[3];//level = 2
    double m_shoulder_r[3];//level = 3
    control_mesh mesh[286];
    
    void move_world(double x,double y,double z,double alpha,double beta,double gammar);
    void move_head(double x,double y,double z,double alpha,double beta,double gammar);
    void move_shoulder_l(double x,double y,double z,double alpha,double beta,double gammar);
    void move_shoulder_r(double x,double y,double z,double alpha,double beta,double gammar);
};
```

### 2.control_mesh

```c++
class control_mesh{
    string type;
    int number;
    control_point m_point[16];
    void make_mesh();
};
```

### 3.control_point

```c++
class control_point{
    double m_x;
    double m_y;
    double m_z;
    int level;
};
```

## 动画

BPM:150   类型:4/4

* 在0-2拍，举起左手
* 在2-4拍，举起右手
* 在4-7拍，向前挥手
* 在7-8拍，归中

## 注意事项

非必要不要运行程序，否则会生成一个4.9GB的`avi`文件
