
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
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-niche-distance(3)\NSGA-II-niche','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGAENS-SDE_only_Dtlz\NSGAENS-SDE_D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-shifting-dis(3)\NSGA-II-niche','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
%%%%% random2 and M
for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-shift(3)-SOB-mean(M)\NSGA-II-shift(3)-SOB-mean(M)','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\test\NSGA-II-shift(3)-SOB-distance-random)','_',num2str(p),'_',num2str(obj),'_',num2str(i),' Population FunctionValue time']);
    
    C = [ C ; FunctionValue ];
    
end


% for i = 1:30
%     
%     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-shift(3)+sumR-dtlz\NSGA-II-shift(3)+sumR','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     C = [ C ; FunctionValue ];
%     
% end
% for i = 1:30
%     
%     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-shift(3)-KnEAdis-dtlz\NSGA-II-shift(3)-KnEAdis','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     C = [ C ; FunctionValue ];
%     
% end

% for i = 1:30
%     
%     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-NICHE-D-ALL_MEAN\NSGA-II-niche-NEWDIS','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     C = [ C ; FunctionValue ];
%     
% end
% for i = 1:30
%     
%     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-newdis+shifting\NSGA-II-nichedis+shifting','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
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
 V7 = zeros(1,30);
 V8 = zeros(1,30);
 V9 = zeros(1,30);
 V10 = zeros(1,30);
 for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NAGA-II\NSGA-II-DTLZ\NSGA-II-DTLZ_ORG\NSGA-II_D\NSGA-II','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V1(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
 
for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\KnEA_D\KnEA-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V2(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end


for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\GrEA_D\GrEA_D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V3(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\BiGE_D\BiGE_D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V4(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V5(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-niche-distance(3)\NSGA-II-niche','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V6(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGAENS-SDE_only_Dtlz\NSGAENS-SDE_D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V7(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-shifting-dis(3)\NSGA-II-niche','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V8(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
%%%%
for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-shift(3)-SOB-mean(M)\NSGA-II-shift(3)-SOB-mean(M)','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V9(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\test\NSGA-II-shift(3)-SOB-distance-random)','_',num2str(p),'_',num2str(obj),'_',num2str(i), ' Population FunctionValue time']);
    
    V10(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
% for i = 1:30
%     
%     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-shift(3)+sumR-dtlz\NSGA-II-shift(3)+sumR','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     V8(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
%     
% end
% for i = 1:30
%     
%     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-shift(3)-KnEAdis-dtlz\NSGA-II-shift(3)-KnEAdis','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     V9(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
%     
% end

% for i = 1:30
%     
%     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-NICHE-D-ALL_MEAN\NSGA-II-niche-NEWDIS','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     V8(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
%     
% end
% for i = 1:30
%     
%     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-DTLZ_ORG-me-mod\NSGA-II-newdis+shifting\NSGA-II-nichedis+shifting','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     V9(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
%     
% end
Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6);mean(V7),std(V7);mean(V8),std(V8);mean(V9),std(V9);mean(V10),std(V10)];
%Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4)];

disp(Result{p})
fprintf('\n');
    
clear C;

end

end