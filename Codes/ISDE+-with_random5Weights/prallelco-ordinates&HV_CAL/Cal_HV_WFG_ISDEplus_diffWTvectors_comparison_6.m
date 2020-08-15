for obj= 2:2:10
   
Result=cell(9,1);
objective = obj
for p= 1:9
    %Problem=p

run = 30; 
%-----------------------------------------------------------------------------------------     
C = [ ];

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\GrEA_W\GrEA_W','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end
for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_W\NSGAIII-ENSW','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end


for i = 1:30
    
    eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\SRA\SRA-WFG\RES-SRA-WFG-org\SRA-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\HYPE\HYPE-WFG\RES-HYPE-WFG-org\HYPE-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\IBEA\IBEA-WFG\RES-IBEA-WFG-org\IBEA-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

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
 V3 = zeros(1,30);
 V4 = zeros(1,30);
 V5 = zeros(1,30);
 V6 = zeros(1,30);
 V7 = zeros(1,30);
 V8 = zeros(1,30);
 
 for i = 1 : 30
     
     eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\GrEA_W\GrEA_W','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V1(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
     
 end
 
 for i = 1 : 30
     
     eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_W\NSGAIII-ENSW','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V2(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
 end
 
 
 for i = 1 : 30
     
     eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V3(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
 end
 
 for i = 1 : 30
     
     eval(['load D:\OUR_CODES\SRA\SRA-WFG\RES-SRA-WFG-org\SRA-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V4(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
 end
 
 for i = 1 : 30
     
     eval(['load D:\OUR_CODES\HYPE\HYPE-WFG\RES-HYPE-WFG-org\HYPE-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V5(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
 end
 for i = 1 : 30
     
     eval(['load D:\OUR_CODES\IBEA\IBEA-WFG\RES-IBEA-WFG-org\IBEA-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V6(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
 end
 
 for i = 1 : 30
     
     eval(['load D:\OUR_CODES\our_indicator\WFG\WFG-ISDE+_sir\WFG-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V7(i) = Hypervolume(F,1.1.*(ones(1,size(F,2))),1000);
     
 end
 
 
 
 for i = 1 : 30
     
     eval(['load D:\OUR_CODES\ISDE+-with_random5Weights\WFG_sort_on_OBJ\WFG-sort_diff_OBJ\WFG-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V8(i) = Hypervolume(F,1.1.*(ones(1,size(F,2))),1000);
     
 end


  
Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6);mean(V7),std(V7);mean(V8),std(V8)];
%best_HV{p} = [max(V1);max(V2);max(V3)];
%disp(best_HV{p})
%Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3)];
disp(Result{p})
fprintf('\n');
% %   %% statistical test
% [~,a1] = ranksum(V1,V3);
% [~,a2] = ranksum(V2,V3);
% 
% ST=[a1,a2]
% %% best run
% 
% [~,r1] = sort(V1);x1=r1(30);%m1=r1(15);
% [~,r2] = sort(V2);x2=r2(30);%m2=r2(15);
 %[~,r3] = sort(V3);x3=r3(10);%m3=r3(15);
% 
% best =[x1,x2,x3]
% avgrun =[m1,m2,m3]
clear C;

end

end