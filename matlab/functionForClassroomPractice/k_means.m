function [data,center] = k_means(sample,k)
    sample=fix(rand(10,3)*50);
    k=5;
    %count=1;
    %sample����������������k����Ԥ�ھ�����
    %data(i)�����i�����������ľ�����
    %center����������ĵ�λ��
    [m,n] = size(sample);
    if k > m
        disp('����Ҫ�������Ŀ�Ѿ��������ݵ���Ŀ���޷����࣡');
        return;
    end
    % ѡ����ʼ����
    for i=1:k
        % ��ʼ���ĵ�ѡȡ��ʽΪ���ӵ�һ�����ݿ�ʼ��ÿ��m/k���ѡȡһ�����ݵ㣬ֱ���õ�k���������
        c(i,:) = sample(1+(i-1)*fix(m/k),:);
    end
    while true
        % ����ÿ�����ݵ㵽������ĵľ��룬�����ݵ���뵽��֮����������
        for i=1:m
            % dis����ÿ�����ݵ㵽k��������ĵľ���
            for j=1:k
            dis(j)=sqrt(sum((c(j,:) - sample(i,:)).^2));
            end
            % �ҳ����ݵ���k����������У�������С��һ���������ݵ���뵽��һ����
            [~,index] = sort(dis);
            data(i) = index(1);
        end
        %���¼������ģ����ѻ��ֵ����ƽ��ֵ��Ϊ���ĵ�
        for i=1:k
            center(i,:)=mean([sample(find(data==i),:);zeros(1,n)]);
        end
        %������ĵ�ŷʽ�����С�����˳�
        if norm(center-c)<=0.0001%||count==100
            break
        else
            c=center;
        end
        %count=count+1;
    end
end