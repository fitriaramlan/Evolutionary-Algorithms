
for obj=[4 6 8 10]
    
objr=obj

Result=cell(7,1);

for p=1:7
%p = 1

run = 15; 

%-----------------------------------------------------------------------------------------     
C = [ ];

for i = 1:30
 
 eval(['load D:\ARCHIVE-BASED\NAGA-II\NSGA-II-DTLZ\NSGA-II-DTLZ_ORG\NSGA-II_D\NSGA-II','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; FunctionValue ];

end

for i = 1:30
  
eval(['load D:\ARCHIVE-BASED\KnEAoriginal\pop_KnEA-ENSD_org\KnEA-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
 
 C = [ C ; FunctionValue ];
  end
 
% for i = 1:30
%  
%  eval(['load D:\ARCHIVE-BASED\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-nichecount\NSGA-II-niche','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
% 
%  C = [ C ; FunctionValue ];
% 
%  end

 
 

 for i = 1:15
 
 eval(['load D:\ARCHIVE-BASED\KnEAoriginal\KNEA-NSGA-combined1\KnEA-NSGA-mod1','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; FunctionValue ];

 end

for i = 1:30
 
 eval(['load D:\ARCHIVE-BASED\KnEAoriginal\KnEA+NSGA-II-test-pop1-2\KnEA-NSGA-pop1&pop2','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; FunctionValue ];

 end

 S = F_output(C);

 Point  = max(S,[],1);
 
 V1 = zeros(1,30);
 V2 = zeros(1,30);
  V3 = zeros(1,15);
  V4 = zeros(1,15);
%  V5 = zeros(1,30);
%  V6 = zeros(1,30);
 
 for i = 1:30
 
 eval(['load D:\ARCHIVE-BASED\NAGA-II\NSGA-II-DTLZ\NSGA-II-DTLZ_ORG\NSGA-II_D\NSGA-II','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 V1(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);

 end
 
  for i = 1:30
 
 eval(['load D:\ARCHIVE-BASED\KnEAoriginal\pop_KnEA-ENSD_org\KnEA-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 V2(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
 
 end

 
 for i = 1:15
 
 eval(['load D:\ARCHIVE-BASED\KnEAoriginal\KNEA-NSGA-combined1\KnEA-NSGA-mod1','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 V3(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);

 end

for i = 1:30
 
 eval(['load D:\ARCHIVE-BASED\KnEAoriginal\KnEA+NSGA-II-test-pop1-2\KnEA-NSGA-pop1&pop2','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 V4(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);

 end
%  
% %   
%  
%   for i = 1:15
%  
%  eval(['load D:\ARCHIVE-BASED\KnEAoriginal\KNEA-NSGA-combined1\KnEA-NSGA-mod1','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
% 
%  V3(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
%  
%  end
%  for i = 1:30
%      
%      eval(['load D:\ARCHIVE-BASED\KnEAoriginal\KnEA+NSGA-II-test\KnEA-NSGA-pop1','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%      
%      V4(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
%      
%  end

%Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6)];
%Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4)];
Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4)];

disp(Result{p})
fprintf('\n');
    
clear C;

end

end