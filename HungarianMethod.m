tic
clc
clear all;
Cost=[8 10 12 6;11 11 15 8;9 6 15 14;15 14 9 7];
disp('Cost matrix');
disp(Cost);
b=Cost;
for i=1:size(Cost,1)
sub=min(Cost(i,:));
Cost(i,:)=Cost(i,:)-sub;
end
for i=1:size(Cost,2)
sub=min(Cost(:,i));
Cost(:,i)=Cost(:,i)-sub;
end
disp('after subtracting row minimum and column minimum');
disp(Cost);
while true
    temp=Cost;
    lines=0;
    while true
        minZ=inf;
        for i=1:size(temp,1)count=size(find(temp(i,:)==0),2);
            if(count>0 && count < minZ)
                minZ=count;
                d=1;
                y=find(temp(i,:)==0,1);
            end
        end
        for i=1:size(temp,2)
            count=size(find(temp(:,i)==0),1);
            if(count>0 && count < minZ)
                minZ=count;
                d=0;
                y=find(temp(:,i)==0,1);
            end
        end
        if minZ==inf
            break;
        end
        if d==1
            temp(:,y)=inf;else
            temp(y,:)=inf;
        end
        lines=lines+1;
       end
        sub=min(min(temp));
        if(lines~=4)
            for i=1:size(Cost,1)
                for j=1:size(Cost,2)
                    if(temp(i,j)~=inf)
                        Cost(i,j) = Cost(i,j)-sub;
                    elseif((size(find(temp(i,:)==inf),2)==4) && (size(find(temp(i,:)==inf),1)==4))
                        Cost(i,j)=Cost(i,j)+sub;
                    end
                end
            end
        end
        if(lines==4)
        break;
        end
        end
        %Hungarian Method starts
     disp('Modified cost matrix');
     disp(Cost);
        TCost=0;
         for i=size(Cost,1):-1:1
             for j=size(Cost,2):-1:1 if(Cost(i,j)==0)
                    TCost=TCost+b(i,j);
                 for k=size(Cost,2):-1:j+1
                     if(Cost(i,k)==0)
                    Cost(i,k)=inf;
                     end
                 end
                 for k=size(Cost,1):-1:1
                 if(Cost(k,j)==0)
                Cost(k,j)=inf;
                 end
                 if(Cost(i,k)==0)
                Cost(i,k)=inf;
                 end
             end
         end
     end
 end
disp('Total cost:');
disp(TCost);
Elapsedtime=toc
fprintf("Ishan Gupta-19BCE7467");