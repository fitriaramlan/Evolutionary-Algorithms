for obj= 2:2:10
   
Result=cell(9,1);
objective = obj
for p= 1:9
    %Problem=p

run = 30; 
%-----------------------------------------------------------------------------------------     
C = [ ];





for i = 1:30
    
    eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end


% for i = 1:30
%     
%     eval(['load D:\OUR_CODES\MOEA-D\RES-MOEA-D\popof_MOEAD-wfg\MOEAD_wfg','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     C = [ C ; F ];
%     
% end
% 
% for i = 1:30
%     
%     eval(['load D:\OUR_CODES\AGE-II\AGE-II-WFG\RES-AGE-II-WFG-org\AGE-II_WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     C = [ C ; F ];
%     
% end

for i = 1:30
    
    eval(['load D:\OUR_CODES\HYPE\HYPE-WFG\RES-HYPE-WFG-org\HYPE-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

 for i = 1:30
    
    eval(['load D:\OUR_CODES\our_indicator\WFG\WFG-ISDE+_sir\WFG-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
 end
 
 
 
 S = F_output(C); 

 V1 = zeros(1,30);
 V2 = zeros(1,30);
 V3 = zeros(1,30);
%  V4 = zeros(1,30);
%  V5 = zeros(1,30);
%  V6 = zeros(1,30);
%  V7 = zeros(1,30);
%  V8 = zeros(1,30);
%  V9 = zeros(1,30);
%  V10 = zeros(1,30);
%  V11 = zeros(1,30);
%  V12 = zeros(1,30); 
%  V13 = zeros(1,30); 



 

   for i = 1 : 30
     
     eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V5(i) = Hypervolume(F,1.1.*(ones(1,size(F,2))),1000);
     
   end

  
 
    for i = 1 : 30
     
     eval(['load D:\OUR_CODES\HYPE\HYPE-WFG\RES-HYPE-WFG-org\HYPE-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V11(i) = Hypervolume(F,1.1.*(ones(1,size(F,2))),1000);
     
   end


  
  for i = 1 : 30
     
     eval(['load D:\OUR_CODES\our_indicator\WFG\WFG-ISDE+_sir\WFG-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V12(i) = Hypervolume(F,1.1.*(ones(1,size(F,2))),1000);
     
  end
   
   
 %Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3)];
  
 %Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6);mean(V7),std(V7);mean(V8),std(V8);...
     mean(V9),std(V9);mean(V10),std(V10);mean(V11),std(V11);mean(V12),std(V12)];

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


  %% statistical test
[~,a1] = ranksum(V1,V3);
[~,a2] = ranksum(V2,V3);

ST=[a1,a2]
%% best run

[~,r1] = sort(V1);x1=r1(30);m1=r1(15);
[~,r2] = sort(V2);x2=r2(30);m2=r2(15);
[~,r3] = sort(V3);x3=r3(30);m3=r3(15);

best =[x1,x2,x3]
avgrun =[m1,m2,m3]
clear C;
  
end

end