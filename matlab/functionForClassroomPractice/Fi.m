function [result,x] = Fi(n)
%xΪһ������x(n)=Fi(n)
%resultΪx(end)
x=[1];
if n>1
    x(2)=1;
    if n>2
        for i=3:n
            x(i)=x(i-1)+x(i-2);
        end
    end
end
result=x(end);
end

