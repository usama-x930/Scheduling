clc
clear all
close all
n=input('Enter no of processes:')
tat=zeros(1,n);
wt=zeros(1,n);      
b=0;
t=0;
flag=0;
for i=1:n
    
    bt(i)=input('Enter Burst time;')
    qt(i)=input('Enter time slice;')
end

rem_time=[bt];
for i=1:n
    if(rem_time(i)>0) 
        flag=1
    end
end
while(flag==1)      
    flag=0
for i=1:1:n
    if(rem_time(i)>=qt(i))
        fprintf('P%d\n',i)
        for j=1:n
            if(j==i)
                rem_time(i)=rem_time(i)-qt(i)
            else if(rem_time(j)>0)
                    wt(j)=wt(j)+qt(j)
                end
            end
        end
    else if(rem_time(i)>0)             
            fprintf('P%d\n',i)
            for j=1:n
              if(j==i)
                rem_time(i)=0;                 
              else if(rem_time(j)>0)
                    wt(j)=wt(j)+rem_time(i)   
                  end 
              end
            end
        end
    end
end
 for i=1:n
        if(rem_time(i)>0)
            flag=1
        end
    end
end

for i=1:n
    tat(i)=wt(i)+bt(i);   
end
disp('Process   Burst time  Waiting time    TurnAround time')
for i=1:1:n
    fprintf('P%d\t\t\t%d\t\t\t%d\t\t\t\t%d\n',(i),bt(i),wt(i),tat(i));
    b=b+wt(i);
    t=t+tat(i);
end
fprintf('Average waiting time: %f\n',(b/n));
fprintf('Average turn around time: %f\n',(t/n));



