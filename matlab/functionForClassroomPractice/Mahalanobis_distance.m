clc;
clear;
sample=fix(rand(10,3)*50);
% 内置函数计算矩阵协方差然后计算马氏距离和欧式距离
scov=cov(sample);
[m,n]=size(sample);
D=zeros(m,n);
K=D;
for i=1:m
    for j=1:m
        %计算马氏距离
        D(i,j)=((sample(i,:)-sample(j,:))*(scov\(sample(i,:)-sample(j,:))'))^0.5;
        %计算欧式距离
        K(i,j)=norm(sample(i,:)-sample(j,:));
    end
end
%将马氏距离和欧式距离矩阵使用稀疏矩阵存储
D=sparse(D);
K=sparse(K);
%直接计算马氏距离和欧式距离的稀疏矩阵
Y = pdist(sample,'mahal');
Y = sparse(squareform(Y));
L = pdist(sample);
L = sparse(squareform(L));
% %验证结果
tol=0.0000001;
max(abs(Y(:)-D(:))) < tol
max(abs(K(:)-L(:))) < tol