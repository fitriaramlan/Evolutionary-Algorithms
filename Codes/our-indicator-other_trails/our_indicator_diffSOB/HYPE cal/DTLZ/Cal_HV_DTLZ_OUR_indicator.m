
%%%%%%%%%%%%% FINAL VERSION OF hyper volume calculation for OUR INDICATOR
%%%%%%%%%%%%% includes rankSUM TEST(STATISTICAL TEST), Obtaining BEST AND avg RUN
for obj=  2:2:10
   
objective = obj

Result=cell(7,1);

for p=  1:7
problem = p;

run = 30; 

%-----------------------------------------------------------------------------------------     
C = [ ];


for i = 1:30   
    
    eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\TWO-Ar_GRID_SDE_algorithms\two_archive\two-archiv-me-dtlz-new\result-DTLZ\Two-Archive2','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

for i = 1:30   
    
    eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\TWO-Ar_GRID_SDE_algorithms\Two_Ar_GRID\Two_Ar_GRID-DTLZ\Two_Ar_GRID-DTLZ\Two-Ar_GRID','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end
for i = 1:30   
    
    eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\TWO-Ar_GRID_SDE_algorithms\Two-Ar_SDE\Two_Ar_SDE-DTLZ\Two_Ar_SDE-DTLZ\Two-Ar-SDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end
for i = 1:30   
    
    eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\TWO-Ar_GRID_SDE_algorithms\Two_Ar_GRID+SDE\Two_Ar_GRID+SDE-DTLZ\Two_Ar_GRID+SDE-DTLZ\Two-Ar-GRID+SDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F];
    
end

for i = 1:30   
    
   eval(['load D:\OUR_CODES\SRA\SRA-DTLZ\RES-SRA-DTLZ-org\SRA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue];
    
end
% for i = 1:30   
%     
%     eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\TWO-Ar_GRID_SDE_algorithms\Two-Ar_SDE_sqrt(N)\Two_Ar_SDE_sqrt(N)-DTLZ\Two_Ar_SDE_sqrt(N)-DTLZ\Two-Ar-SDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     C = [ C ; F];
%     
% end
for i = 1:30   
    
    eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\TWO-Ar_GRID_SDE_algorithms\Two_Ar_GRID+SDE_sqrt(N)\Two_Ar_GRID+SDE_sqrt(N)-DTLZ\Two_Ar_Grid+SDE_diffDIS\Two-Ar-GRID+SDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F];
    
end


% for i = 1:30   
%     
%     eval(['load D:\OUR_CODES\SRA\SRA-DTLZ\RES-SRA-DTLZ-org\SRA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     C = [ C ; FunctionValue ];
%     
% end
% 
% 
% 
% for i = 1:30   
%     
%     eval(['load D:\OUR_CODES\our_indicator\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     C = [ C ; FunctionValue ];
%     
% end

 S = F_output(C);
 Point  = max(S,[],1);
 
 V1 = zeros(1,30);
 V2 = zeros(1,30);
 V3 = zeros(1,30);
 V4 = zeros(1,30);
 V5 = zeros(1,30);
 V6 = zeros(1,30);
 %V7 = zeros(1,30);
    

for i = 1:30
    
    eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\TWO-Ar_GRID_SDE_algorithms\two_archive\two-archiv-me-dtlz-new\result-DTLZ\Two-Archive2','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V1(i) = Hypervolume(F,Point.*ones(1,size(F,2)),1000);
    
end

for i = 1:30
    
    eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\TWO-Ar_GRID_SDE_algorithms\Two_Ar_GRID\Two_Ar_GRID-DTLZ\Two_Ar_GRID-DTLZ\Two-Ar_GRID','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V2(i) = Hypervolume(F,Point.*ones(1,size(F,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\TWO-Ar_GRID_SDE_algorithms\Two-Ar_SDE\Two_Ar_SDE-DTLZ\Two_Ar_SDE-DTLZ\Two-Ar-SDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V3(i) = Hypervolume(F,Point.*ones(1,size(F,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\TWO-Ar_GRID_SDE_algorithms\Two_Ar_GRID+SDE\Two_Ar_GRID+SDE-DTLZ\Two_Ar_GRID+SDE-DTLZ\Two-Ar-GRID+SDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V4(i) = Hypervolume(F,Point.*ones(1,size(F,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\SRA\SRA-DTLZ\RES-SRA-DTLZ-org\SRA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    V5(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
% for i = 1:30
%     
%     eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\TWO-Ar_GRID_SDE_algorithms\Two-Ar_SDE_sqrt(N)\Two_Ar_SDE_sqrt(N)-DTLZ\Two_Ar_SDE_sqrt(N)-DTLZ\Two-Ar-SDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     V6(i) = Hypervolume(F,Point.*ones(1,size(F,2)),1000);
%     
% end
for i = 1:30
    
    eval(['load D:\OUR_CODES\SRA&TWO_AR_NEW_algortihms\TWO-Ar_GRID_SDE_algorithms\Two_Ar_GRID+SDE_sqrt(N)\Two_Ar_GRID+SDE_sqrt(N)-DTLZ\Two_Ar_Grid+SDE_diffDIS\Two-Ar-GRID+SDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    V6(i) = Hypervolume(F,Point.*ones(1,size(F,2)),1000);
    
end
%Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6);mean(V7),std(V7);...
            % mean(V8),std(V8);mean(V9),std(V9);mean(V10),std(V10);mean(V11),std(V11);mean(V12),std(V12)];
Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6)];

disp(Result{p})
 fprintf('\n');
%     %% statistical test
% [~,a1] = ranksum(V1,V12);
% [~,a2] = ranksum(V2,V12);
% [~,a3] = ranksum(V3,V12);
% [~,a4] = ranksum(V4,V12);
% [~,a5] = ranksum(V5,V12);
% [~,a6] = ranksum(V6,V12);
% [~,a7] = ranksum(V7,V12);
% [~,a8] = ranksum(V8,V12);
% [~,a9] = ranksum(V9,V12);
% [~,a10] = ranksum(V10,V12);
% [~,a11] = ranksum(V11,V12);
% % [~,a12] = ranksum(V12,V14);
% % [~,a13] = ranksum(V13,V14);
% ST=[a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11]
% %% best run
% 
% [~,r1] = sort(V1);x1=r1(30);m1=r1(15);
% [~,r2] = sort(V2);x2=r2(30);m2=r2(15);
% [~,r3] = sort(V3);x3=r3(30);m3=r3(15);
% [~,r4] = sort(V4);x4=r4(30);m4=r4(15);
% [~,r5] = sort(V5);x5=r5(30);m5=r5(15);
% [~,r6] = sort(V6);x6=r6(30);m6=r6(15);
% [~,r7] = sort(V7);x7=r7(30);m7=r7(15);
% [~,r8] = sort(V8);x8=r8(30);m8=r8(15);
% [~,r9] = sort(V9);x9=r9(30);m9=r9(15);
% [~,r10] = sort(V10);x10=r10(30);m10=r10(15);
% [~,r11] = sort(V11);x11=r11(30);m11=r11(15);
% [~,r12] = sort(V12);x12=r12(30);m12=r12(15);
% % [~,r13] = sort(V13);x13=r13(30);m13=r13(15);
% % [~,r14] = sort(V14);x14=r14(30);m14=r14(15);
% best =[x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12]
% avgrun =[m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12]
% 
%%
clear C;

end

end