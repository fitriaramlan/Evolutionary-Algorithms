
for obj=[4 6 8 10]
    
objr=obj

Result=cell(7,1);

for p=1:7
%p = 1

run = 30; 

%-----------------------------------------------------------------------------------------     
C = [ ];

for i = 1:30
 
 eval(['load D:\ARCHIVE-BASED\NAGA-II\NSGA-II-DTLZ\NSGA-II-DTLZ_ORG\NSGA-II_D\NSGA-II','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; FunctionValue ];

end

 for i = 1:30
 
 eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; FunctionValue ];

 end
 
 for i = 1:30
  
eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\KnEA_D\KnEA-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
 
 C = [ C ; FunctionValue ];
  end

  for i = 1:30
      
      eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\GrEA_D\GrEA_D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
      
      C = [ C ; FunctionValue ];
      
  end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\BiGE_D\BiGE_D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
  
for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\KnEA+NSGA-DTLZ\KnEA+NSGA-II-test-pop1-2\KnEA-NSGA-pop1&pop2','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
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
 
 for i = 1:30
 
 eval(['load D:\ARCHIVE-BASED\NAGA-II\NSGA-II-DTLZ\NSGA-II-DTLZ_ORG\NSGA-II_D\NSGA-II','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 V1(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);

 end
 
  for i = 1:30
 
 eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 V2(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
 
 end

 
 for i = 1:30
 
 eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\KnEA_D\KnEA-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 V3(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);

 end

for i = 1:30
 
 eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\GrEA_D\GrEA_D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 V4(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);

end

 for i = 1:30
 
 eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\BiGE_D\BiGE_D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 V5(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);

 end
 
 for i = 1:30
 
 eval(['load D:\ARCHIVE-BASED\KnEA+NSGA-DTLZ\KnEA+NSGA-II-test-pop1-2\KnEA-NSGA-pop1&pop2','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 V6(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);

 end


Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6)];
%Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4)];
%Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4)];

disp(Result{p})
fprintf('\n');
    
clear C;

end

end