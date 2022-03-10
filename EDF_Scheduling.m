clc
clear all
close all
n=input('Enter no of processes:')
sum=0;
for i=1:n
    bt(i)=input('Enter burst time:')
    p(i)=input('Enter period:')
end
for i=1:n
    sum=sum+(bt(i)/p(i));
end
if (sum>1)
    disp('These Processes are not Schedulable!!!!')
    else
    disp('These Processes are Schedulable!!!!')
end
stack=0
ct=p
flag=0
[M I]=min(p(:))
for j=1:n
    for i=1:n
    if(min(p))
    [M I]=min(p(:))
    p(I)=p(I)+ct(I)
    end
    stack=stack+bt(I)
    if (stack>M)
        flag=1
        disp('Deadline missed!!!!!!!!!')
        fprintf('Deadline is missed by P%d\n',I)
        break

    end
    end
    if (flag==1)
        break
    end
end