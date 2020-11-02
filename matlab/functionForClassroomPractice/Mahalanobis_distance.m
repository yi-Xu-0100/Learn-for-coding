clc;
clear;
sample=fix(rand(10,3)*50);
% ���ú����������Э����Ȼ��������Ͼ����ŷʽ����
scov=cov(sample);
[m,n]=size(sample);
D=zeros(m,n);
K=D;
for i=1:m
    for j=1:m
        %�������Ͼ���
        D(i,j)=((sample(i,:)-sample(j,:))*(scov\(sample(i,:)-sample(j,:))'))^0.5;
        %����ŷʽ����
        K(i,j)=norm(sample(i,:)-sample(j,:));
    end
end
%�����Ͼ����ŷʽ�������ʹ��ϡ�����洢
D=sparse(D);
K=sparse(K);
%ֱ�Ӽ������Ͼ����ŷʽ�����ϡ�����
Y = pdist(sample,'mahal');
Y = sparse(squareform(Y));
L = pdist(sample);
L = sparse(squareform(L));
% %��֤���
tol=0.0000001;
max(abs(Y(:)-D(:))) < tol
max(abs(K(:)-L(:))) < tol