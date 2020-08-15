%%%%%%%%%%%%%
for obj=[2 4 6 8 10]
   
objective=obj
Result=cell(7,1);
best_HV=cell(7,1);
for p=2
run = 30; 
%-----------------------------------------------------------------------------------------     
C = [ ];

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\GrEA_D\GrEA_D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
for i = 1:30
    
    eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end

for i = 1:30   
    
    eval(['load D:\OUR_CODES\SRA\SRA-DTLZ\RES-SRA-DTLZ-org\SRA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
for i = 1:30   
    
    eval(['load D:\OUR_CODES\HYPE\HYPE-DTLZ\RES-HYPE-DTLZ-org\HYPE-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
for i = 1:30   
    
    eval(['load D:\OUR_CODES\IBEA\IBEA-DTLZ\RES-IBEA-DTLZ-org\IBEA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
%**************
for i = 1:30   
    
    eval(['load D:\OUR_CODES\our_indicator\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end


for i = 1:30   
    
    eval(['load D:\OUR_CODES\ISDE+-with_random5Weights\DTLZ\code-for_sortingondiffobj_isde+\sort-oN_OBJ_isde+\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
%max ISDE
for i = 1:30   
    
    eval(['load D:\OUR_CODES\ISDE+-with_random5Weights\DTLZ\sort-OBJ-MAXisde\Sort_On_obj_min_ISDE+\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end

 S = F_output(C);
 Point  = max(S,[],1);
 
 V1 = zeros(1,30);
 V2 = zeros(1,30);
 V3 = zeros(1,10);
 V4 = zeros(1,10);
 V5 = zeros(1,30);
 V6 = zeros(1,30);
 V7 = zeros(1,30);
 V8 = zeros(1,30);
 V9 = zeros(1,30);
for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\GrEA_D\GrEA_D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V1(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V2(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V3(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\SRA\SRA-DTLZ\RES-SRA-DTLZ-org\SRA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V4(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\HYPE\HYPE-DTLZ\RES-HYPE-DTLZ-org\HYPE-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V5(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end

for i = 1:30
    
    eval(['load D:\OUR_CODES\IBEA\IBEA-DTLZ\RES-IBEA-DTLZ-org\IBEA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V6(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
%**************

for i = 1:30
    
    eval(['load D:\OUR_CODES\our_indicator\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V7(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end

% for i = 1:30
%     
%     eval(['load D:\OUR_CODES\ISDE+-with_random5Weights\DTLZ\DTLZ-ISDE+_random5weights\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     V2(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
%     
% end
for i = 1:30
    
    eval(['load D:\OUR_CODES\ISDE+-with_random5Weights\DTLZ\code-for_sortingondiffobj_isde+\sort-oN_OBJ_isde+\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V8(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\ISDE+-with_random5Weights\DTLZ\sort-OBJ-MAXisde\Sort_On_obj_min_ISDE+\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V9(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end

Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6);mean(V7),std(V7);mean(V8),std(V8);mean(V9),std(V9)];
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