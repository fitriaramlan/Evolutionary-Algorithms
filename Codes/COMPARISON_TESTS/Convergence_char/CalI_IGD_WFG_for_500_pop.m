for obj=6
    
    Result=cell(2,1);
    
    for p = 1 : 9
        
        objective = obj
        
       % Problem = p
        
        run = 30;
        
        %-----------------------------------------------------------------------------------------
        C = [ ];
        
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
    
    eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

for i = 1:30
    
    eval(['load D:\OUR_CODES\two_archive\two-archiv-wfg-new\result-wfz\Two-Archive2','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\MOEA-D\RES-MOEA-D\popof_MOEAD-wfg\MOEAD_wfg','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end

for i = 1:30
    
    eval(['load D:\OUR_CODES\AGE-II\AGE-II-WFG\RES-AGE-II-WFG-org\AGE-II_WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end
for i = 1:30
    
    eval(['load D:\OUR_CODES\IBEA\IBEA-WFG\RES-IBEA-WFG-org\IBEA-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
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
    
    eval(['load D:\OUR_CODES\our_indicator\WFG\WFG-ISDE+_sir\WFG-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
 end
 
        
       
        S = F_output(C);
        
        Point  = max(S,[],1);
        
        FrontValue       = ENS_SS(S);
        
        DistanceValue    = F_distance(S,FrontValue);
        
        [~,M ] = sort(DistanceValue','descend');
        
        MM = size(M,1);
        
        if MM >= 500
            
            K = S(M(1:500),:);
            
        else
            
            K = S(M(1:MM),:);
        end
        
 save(['D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\RESULT-WFG\WFG' num2str(p) '_M' num2str(obj) '.mat'],'K');
save(['D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\RESULT-WFG\S_WFG' num2str(p) '_M' num2str(obj) '.mat'],'S'); 
      
        
        clear C;
        
        
    end
    
end