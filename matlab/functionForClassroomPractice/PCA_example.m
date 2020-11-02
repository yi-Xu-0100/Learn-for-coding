%% 数据导入及设置参数
clc;
clear;
A = xlsread('./PCAdata.xlsx','B2:I16');
T=0.9;
[DS,PV,result_report] = PCA(A,T);
%% 输出模型及结果报告
disp('特征值及其贡献率、累计贡献率:')
DS
disp('信息保留率T对应的主成分与特征向量:')
PV
disp('主成分的分及排序（按第四列的总分进行降序排列，前3列为各主成分得分，第五列为企业编号）')
result_report