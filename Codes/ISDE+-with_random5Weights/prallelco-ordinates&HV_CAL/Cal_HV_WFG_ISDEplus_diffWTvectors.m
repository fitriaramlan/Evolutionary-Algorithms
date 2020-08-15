for obj= 2:2:10
   
Result=cell(9,1);
objective = obj
for p= 1:9
    %Problem=p

run = 30; 
%-----------------------------------------------------------------------------------------     
C = [ ];


 for i = 1:30
    
    eval(['load D:\OUR_CODES\our_indicator\WFG\WFG-ISDE+_sir\WFG-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
 end
 for i = 1:30
    
    eval(['load D:\OUR_CODES\ISDE+-with_random5Weights\WFG_sort_on_OBJ\WFG-sort_diff_OBJ\WFG-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

 
 
 S = F_output(C); 

 V1 = zeros(1,30);
 V2 = zeros(1,30);

 

   for i = 1 : 30
     
     eval(['load D:\OUR_CODES\our_indicator\WFG\WFG-ISDE+_sir\WFG-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V1(i) = Hypervolume(F,1.1.*(ones(1,size(F,2))),1000);
     
   end

  
 
    for i = 1 : 30
     
     eval(['load D:\OUR_CODES\ISDE+-with_random5Weights\WFG_sort_on_OBJ\WFG-sort_diff_OBJ\WFG-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V2(i) = Hypervolume(F,1.1.*(ones(1,size(F,2))),1000);
     
   end


  
  
  best_HV{p} = [max(V1);max(V2)];
disp(best_HV{p})
Result{p} = [mean(V1),std(V1);mean(V2),std(V2)];
disp(Result{p})
fprintf('\n');
% %   %% statistical test
% [~,a1] = ranksum(V1,V3);
% [~,a2] = ranksum(V2,V3);
% 
% ST=[a1,a2]
% %% best run
% 
 [~,r1] = sort(V1);x1=r1(30);%m1=r1(15);
 [~,r2] = sort(V2);x2=r2(30);%m2=r2(15);
% [~,r3] = sort(V3);x3=r3(30);%m3=r3(15);
% 
 best =[x1,x2]
% avgrun =[m1,m2,m3]
clear C;

end

end