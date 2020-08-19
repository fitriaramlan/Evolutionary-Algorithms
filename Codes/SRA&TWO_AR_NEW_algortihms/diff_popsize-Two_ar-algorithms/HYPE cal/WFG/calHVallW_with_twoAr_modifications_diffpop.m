%%% Two _ar modifications for developing the two indicator algorithm
% which includes modifications related to incrporating the GRID and SDE in
% mating and the divergence archive!!!
%%%%%%%%%%%%% includes rankSUM TEST(STATISTICAL TEST), Obtaining BEST AND avg RUN
for obj=  2:2:10
   
Result=cell(9,1);
objective = obj
for p= 1:9

run = 30; 
%-----------------------------------------------------------------------------------------     
C = [ ];


for i = 1:30
    
    eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\diff_popsize-Two_ar-algorithms\two-ar-diffPOP-NEW\two-archiv-wfg-diffPOP(NEW)\Two-Ar-WFG-diffPOP\Two-Archive2','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\SRA\SRA-WFG\RES-SRA-WFG-org\SRA-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

for i = 1:30
    
    eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\diff_popsize-Two_ar-algorithms\Two-ar-Grid_SDE_(unique_obj&POP)_diffpop\WFG_codefor_obj&POP\unique_POP-space_twoar_GRID+SDE-WFG\Two_Ar_GRID+SDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

for i = 1:30
    
    eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\diff_popsize-Two_ar-algorithms\Two-ar-Grid_SDE_(unique_obj&POP)_diffpop\WFG_codefor_obj&POP\unique_obj-space_twoar_GRID+SDE-WFG\Two_Ar_GRID+SDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end



 S = F_output(C); 

 V1 = zeros(1,30);
 V2 = zeros(1,30);
 V3 = zeros(1,30);
 V4 = zeros(1,30);
%  V5 = zeros(1,30);
%  V6= zeros(1,30);
%  V7 = zeros(1,30);

 
 for i = 1 : 30
     
     eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\diff_popsize-Two_ar-algorithms\two-ar-diffPOP-NEW\two-archiv-wfg-diffPOP(NEW)\Two-Ar-WFG-diffPOP\Two-Archive2','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V1(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
     
 end
 
 for i = 1 : 30
     
     eval(['load D:\OUR_CODES\SRA\SRA-WFG\RES-SRA-WFG-org\SRA-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V2(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
 end
 
 
 
 for i = 1 : 30
     
     eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\diff_popsize-Two_ar-algorithms\Two-ar-Grid_SDE_(unique_obj&POP)_diffpop\WFG_codefor_obj&POP\unique_POP-space_twoar_GRID+SDE-WFG\Two_Ar_GRID+SDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V3(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
 end
 
 for i = 1 : 30
     
     eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\diff_popsize-Two_ar-algorithms\Two-ar-Grid_SDE_(unique_obj&POP)_diffpop\WFG_codefor_obj&POP\unique_obj-space_twoar_GRID+SDE-WFG\Two_Ar_GRID+SDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V4(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
 end
 


 
   
 Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4)];
  
% Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6);mean(V7),std(V7);mean(V8),std(V8)];

 disp(Result{p})
 fprintf('\n');
 

clear C;
  
end

end