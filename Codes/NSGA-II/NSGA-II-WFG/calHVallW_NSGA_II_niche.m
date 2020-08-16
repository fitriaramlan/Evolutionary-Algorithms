for obj=  4:2:10
   
Result=cell(9,1);
objective = obj
for p= 1:9





run = 30; 
%-----------------------------------------------------------------------------------------     
C = [ ];

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II_Original_WFG\NSGA-II_W_org\NSGA-II','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\KnEA_org_WFgpop\KnEA','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\GrEA_W\GrEA_W','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\BiGE_W\BiGE_W','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_W\NSGAIII-ENSW','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGA-II-niche_dis(3)-wfg\NSGA-II-nichechange-wfg','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGAENS_only_SDE-org_wfg\NSGAENS_only_SDE-org_wfg','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

for i = 1:30
    
    eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGA-II-niche-shifting(3)\NSGA-II-niche-wfg_shifting(3)','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end
% for i = 1:30
%     
%     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGA-II-SHIFT(3)-sumR-wfg\NSGA-II-SHIFT(3)-sumR','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     C = [ C ; F ];
%     
% end
% for i = 1:30
%     
%     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGA-SHIFt(3)-KnEA-WFG\NSGA-SHIFt(3)-KnEA-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     C = [ C ; F ];
%     
% end

% for i = 1:30
%     
%     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGA-II-niche-wfg-dis_meanall\NSGA-II-niche-wfg_meanall','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     C = [ C ; F ];
%     
% end
% for i = 1:30
%     
%     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGA-II-niche-wfg-shifting\NSGA-II-niche-wfg-shifting','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%     
%     C = [ C ; F ];
%     
% end
 
 S = F_output(C); 

 V1 = zeros(1,30);
 V2 = zeros(1,30);
 V3 = zeros(1,30);
 V4 = zeros(1,30);
 V5 = zeros(1,30);
 V6 = zeros(1,30);
 V7 = zeros(1,30);
 V8 = zeros(1,30);
% V9 = zeros(1,30);


 for i = 1 : 30
     
     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II_Original_WFG\NSGA-II_W_org\NSGA-II','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V1(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
     
 end
 
 for i = 1 : 30
     
     eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\KnEA_org_WFgpop\KnEA','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V2(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
     
 end
 
 for i = 1 : 30
     
     eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\GrEA_W\GrEA_W','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V3(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
     
 end
 
 for i = 1 : 30
     
     eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\BiGE_W\BiGE_W','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V4(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
 end
 
 for i = 1 : 30
     
     eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_W\NSGAIII-ENSW','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V5(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
 end
 for i = 1 : 30
     
     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGA-II-niche_dis(3)-wfg\NSGA-II-nichechange-wfg','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V6(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
 end
 
  for i = 1 : 30
     
     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGAENS_only_SDE-org_wfg\NSGAENS_only_SDE-org_wfg','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V7(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
 end
 
 for i = 1 : 30
     
     eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGA-II-niche-shifting(3)\NSGA-II-niche-wfg_shifting(3)','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V8(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
 end
%  for i = 1 : 30
%      
%      eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGA-II-SHIFT(3)-sumR-wfg\NSGA-II-SHIFT(3)-sumR','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%      
%      F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
%      
%      V8(i) = Hypervolume(F,ones(1,size(F,2)),1000);
%      
%  end
%  for i = 1 : 30
%      
%      eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGA-SHIFt(3)-KnEA-WFG\NSGA-SHIFt(3)-KnEA-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%      
%      F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
%      
%      V9(i) = Hypervolume(F,ones(1,size(F,2)),1000);
%      
%  end
%   for i = 1 : 30
%      
%      eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGA-II-niche-wfg-dis_meanall\NSGA-II-niche-wfg_meanall','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%      
%      F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
%      
%      V8(i) = Hypervolume(F,ones(1,size(F,2)),1000);
%      
%  end
%  for i = 1 : 30
%      
%      eval(['load D:\ARCHIVE-BASED\NSGA-niche_changes\NSGA-II-WFG-ORG-me-mod\NSGA-II-niche-wfg-shifting\NSGA-II-niche-wfg-shifting','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%      
%      F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
%      
%      V9(i) = Hypervolume(F,ones(1,size(F,2)),1000);
%      
%  end
  
% Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4)];
  
 Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6);mean(V7),std(V7);mean(V8),std(V8)];


 disp(Result{p})
 fprintf('\n');
 


clear C;
  
end

end