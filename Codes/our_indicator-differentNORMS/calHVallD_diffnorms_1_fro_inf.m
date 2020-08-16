%%%%%%%%%%%%%
for obj=[2 4 6 8 10]
   
objective=obj
Result=cell(7,1);
%best_HV=cell(7,1);
for p=1:7
run = 30; 
%-----------------------------------------------------------------------------------------     
C = [ ];

for i = 1:30   
    
    eval(['load D:\OUR_CODES\our_indicator\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end

for i = 1:30   
    
    eval(['load D:\OUR_CODES\our_indicator-differentNORMS\DTLZ\DTLZ-ISDE+_diffNORMS_1_NORM\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
for i = 1:30   
    
    eval(['load D:\OUR_CODES\our_indicator-differentNORMS\DTLZ\DTLZ-isde+_FRO_norm\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
for i = 1:30   
    
    eval(['load D:\OUR_CODES\our_indicator-differentNORMS\DTLZ\DTLZ-ISDE+_diffNORMS_inf_NORM\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
for i = 1:30   
    
    eval(['load D:\OUR_CODES\our_indicator-differentNORMS\DTLZ\DTLZ-isde+_M_norm\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
for i = 1:30   
    
    eval(['load D:\OUR_CODES\our_indicator-differentNORMS\DTLZ\DTLZ-isde+_Lp-Norm\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
 S = F_output(C);
 Point  = max(S,[],1);
 
 V1 = zeros(1,30);
 V2 = zeros(1,30);
 V3 = zeros(1,30);
 V4 = zeros(1,30);
 V5 = zeros(1,30);
 V6 = zeros(1,30);
 %V7 = zeros(1,30);
 %V8 = zeros(1,30);



for i = 1:30
    
    eval(['load D:\OUR_CODES\our_indicator\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V1(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end

for i = 1:30
    
    eval(['load D:\OUR_CODES\our_indicator-differentNORMS\DTLZ\DTLZ-ISDE+_diffNORMS_1_NORM\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V2(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\our_indicator-differentNORMS\DTLZ\DTLZ-isde+_FRO_norm\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V3(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\our_indicator-differentNORMS\DTLZ\DTLZ-ISDE+_diffNORMS_inf_NORM\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V4(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\our_indicator-differentNORMS\DTLZ\DTLZ-isde+_M_norm\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V5(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\our_indicator-differentNORMS\DTLZ\DTLZ-isde+_Lp-Norm\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V6(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end

%Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6);mean(V7),std(V7);mean(V8),std(V8)];
%best_HV{p} = [max(V1);max(V2)];
%disp(best_HV{p})
Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6)];
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
[~,r3] = sort(V3);x3=r3(30);%m3=r3(15);
[~,r4] = sort(V4);x4=r4(30);
[~,r5] = sort(V5);x5=r5(30);
[~,r6] = sort(V6);x6=r6(30);
best =[x1,x2,x3,x4,x5,x6]
% avgrun =[m1,m2,m3]
clear C;

end

end