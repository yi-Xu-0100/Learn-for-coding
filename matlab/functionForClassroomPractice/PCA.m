function [DS,PV,result_report] = PCA(A,T)
%AΪ�������ݣ�TΪԤ��������
%DSΪ����ֵ���乱���ʡ��ۼƹ�����
%PV��������Ϊ��ȡ�����ɷַ���
%result_reportǰ3��Ϊ�����ɷֵ÷֣�������Ϊ������ţ����������ֽܷ�������
%% ���ݱ�׼��
[m,n] = size(A);
for i = 1:n
    SA(:,i) = (A(:,i) - mean(A(:,i)))/std(A(:,i));
end

%% �������ϵ�����������ֵ����������
CM = cov(SA);                          %�������ϵ������
[V,D] = eig(CM);                       %��Э����������������V������ֵD

for j = 1:n
    DS(j,1)=D(n+1-j,n+1-j);                 %������ֵ����������
end
for i = 1:n
    DS(i,2) = DS(i,1)/sum(DS(:,1));         %������
    DS(i,3) = sum(DS(1:i,1))/sum(DS(:,1));  %�ۼƹ�����
end

%% ѡ�����ɷּ���Ӧ����������
for K = 1:n
    if DS(K,3) >= T
        Com_num = K;
        break
    end
end

%% ��ȡ���ɷֶ�Ӧ����������
for j = 1:Com_num
    PV(:,j)=V(:,n+1-j);
end

%% �������۶�������ɷֵķ���
new_score = SA*PV;
for i = 1:m
    total_score(i,1)= sum(new_score(i,:));
    total_score(i,2)= i;
end
result_report = [new_score,total_score];    %�������ɷֵķ����ַܷ���ͬһ��������
result_report = sortrows(result_report,-4); %���ֽܷ�������
end

