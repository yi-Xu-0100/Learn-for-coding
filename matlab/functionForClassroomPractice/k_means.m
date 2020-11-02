function [data,center] = k_means(sample,k)
    sample=fix(rand(10,3)*50);
    k=5;
    %count=1;
    %sample代表输入样本矩阵，k代表预期聚类数
    %data(i)代表第i个样本所属的聚类标号
    %center代表聚类中心的位置
    [m,n] = size(sample);
    if k > m
        disp('你需要聚类的数目已经大于数据的数目，无法聚类！');
        return;
    end
    % 选定初始质心
    for i=1:k
        % 初始质心的选取方式为：从第一个数据开始，每隔m/k间隔选取一个数据点，直至得到k个类别中心
        c(i,:) = sample(1+(i-1)*fix(m/k),:);
    end
    while true
        % 计算每个数据点到类别中心的距离，把数据点归入到与之最近的类别中
        for i=1:m
            % dis保存每个数据点到k个类别中心的距离
            for j=1:k
            dis(j)=sqrt(sum((c(j,:) - sample(i,:)).^2));
            end
            % 找出数据点与k个类别中心中，距离最小的一个，该数据点归入到这一类中
            [~,index] = sort(dis);
            data(i) = index(1);
        end
        %重新计算中心，以已划分的类的平均值作为中心点
        for i=1:k
            center(i,:)=mean([sample(find(data==i),:);zeros(1,n)]);
        end
        %如果中心的欧式距离很小，则退出
        if norm(center-c)<=0.0001%||count==100
            break
        else
            c=center;
        end
        %count=count+1;
    end
end