function [DS,PV,result_report] = PCA(A,T)
%A为输入数据，T为预期留存率
%DS为特征值及其贡献率、累计贡献率
%PV的列向量为提取的主成分分量
%result_report前3列为各主成分得分，第五列为样本编号，按第四列总分降序排列
%% 数据标准化
[m,n] = size(A);
for i = 1:n
    SA(:,i) = (A(:,i) - mean(A(:,i)))/std(A(:,i));
end

%% 计算相关系数矩阵的特征值和特征向量
CM = cov(SA);                          %计算相关系数矩阵
[V,D] = eig(CM);                       %求协方差矩阵的特征向量V和特征值D

for j = 1:n
    DS(j,1)=D(n+1-j,n+1-j);                 %对特征值按降序排列
end
for i = 1:n
    DS(i,2) = DS(i,1)/sum(DS(:,1));         %贡献率
    DS(i,3) = sum(DS(1:i,1))/sum(DS(:,1));  %累计贡献率
end

%% 选择主成分及对应的特征向量
for K = 1:n
    if DS(K,3) >= T
        Com_num = K;
        break
    end
end

%% 提取主成分对应的特征向量
for j = 1:Com_num
    PV(:,j)=V(:,n+1-j);
end

%% 计算评价对象的主成分的分数
new_score = SA*PV;
for i = 1:m
    total_score(i,1)= sum(new_score(i,:));
    total_score(i,2)= i;
end
result_report = [new_score,total_score];    %将各主成分的分与总分放在同一个矩阵中
result_report = sortrows(result_report,-4); %将总分降序排列
end

