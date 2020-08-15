for obj= 4:2:10
    
    objective=obj
    
    Result=cell(7,1);
    
    for p = 1:7
        
        run = 30;
        
        %-----------------------------------------------------------------------------------------
        C = [ ];
        
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
            
            eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
            
            C = [ C ; FunctionValue ];
            
        end
        for i = 1:30
            
            eval(['load D:\OUR_CODES\two_archive\two-archiv-me-dtlz-new\result-DTLZ\Two-Archive2','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
            
            C = [ C ; FunctionValue ];
            
        end
        for i = 1:30
            
            eval(['load D:\OUR_CODES\MOEA-D\RES-MOEA-D\MOEAD-d\MOEAD_dtlz','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
            
            C = [ C ; FunctionValue ];
            
        end
        
        for i = 1:30
            
            eval(['load D:\OUR_CODES\AGE-II\AGE-II-DTLZ\RES-AGE-II_DTLZ-org\AGE-II-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
            
            C = [ C ; FunctionValue ];
            
        end
        for i = 1:30
            
            eval(['load D:\OUR_CODES\IBEA\IBEA-DTLZ\RES-IBEA-DTLZ-org\IBEA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
            
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
            
            eval(['load D:\OUR_CODES\our_indicator\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
            
            C = [ C ; FunctionValue ];
            
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
   save(['D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\RESULT-LOOP\DTLZ' num2str(p) '_M' num2str(obj) '.mat'],'K');
save(['D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\RESULT-LOOP\S_DTLZ' num2str(p) '_M' num2str(obj) '.mat'],'S');     
%         V1 = zeros(1,30);
%         V2 = zeros(1,30);
%         V3 = zeros(1,30);
%         V4 = zeros(1,30);
%         V5 = zeros(1,30);
%         V6 = zeros(1,30);
%         V7 = zeros(1,30);
%         V8 = zeros(1,30);
%         V9 = zeros(1,30);
%         V10 = zeros(1,30);
%         V11 = zeros(1,30);
%         V12 = zeros(1,30);
%         V13 = zeros(1,30);
%         V14 = zeros(1,30);
%         
%         for i = 1:30
%             
%             eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\KnEA_D\KnEA-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V1(i) = IGD(FunctionValue,K);
%             
%         end
%         
%         
%         for i = 1:30
%             
%             eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\GrEA_D\GrEA_D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V2(i) = IGD(FunctionValue,K);
%             
%         end
%         
%         for i = 1:30
%             
%             eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\BiGE_D\BiGE_D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V3(i) = IGD(FunctionValue,K);
%             
%         end
%         
%         for i = 1:30
%             
%             eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V4(i) = IGD(FunctionValue,K);
%             
%         end
%         for i = 1:30
%             
%             eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V5(i) = IGD(FunctionValue,K);
%             
%         end
%         for i = 1:30
%             
%             eval(['load D:\OUR_CODES\two_archive\two-archiv-me-dtlz-new\result-DTLZ\Two-Archive2','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V6(i) = IGD(FunctionValue,K);
%             
%         end
%         
%         for i = 1:30
%             
%             eval(['load D:\OUR_CODES\MOEA-D\RES-MOEA-D\MOEAD-d\MOEAD_dtlz','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V7(i) = IGD(FunctionValue,K);
%             
%         end
%         for i = 1:30
%             
%             eval(['load D:\OUR_CODES\AGE-II\AGE-II-DTLZ\RES-AGE-II_DTLZ-org\AGE-II-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V8(i) = IGD(FunctionValue,K);
%             
%         end
%         for i = 1:30
%             
%             eval(['load D:\OUR_CODES\IBEA\IBEA-DTLZ\RES-IBEA-DTLZ-org\IBEA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V9(i) = IGD(FunctionValue,K);
%             
%         end
%         for i = 1:30
%             
%             eval(['load D:\OUR_CODES\SRA\SRA-DTLZ\RES-SRA-DTLZ-org\SRA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V10(i) = IGD(FunctionValue,K);
%             
%         end
%         for i = 1:30
%             
%             eval(['load D:\OUR_CODES\HYPE\HYPE-DTLZ\RES-HYPE-DTLZ-org\HYPE-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V11(i) =IGD(FunctionValue,K);
%             
%         end
%         
%         
%         
%         %%
%         % for i = 1:30
%         %
%         %     eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\sde+grid-withoutparetobased\MSDE+GRID-DTLZ\DTLZ-MSDE+GRID-GR+GCD+EXPw\DTLZ-MSDE+GRIDdiv-10','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%         %
%         %     V7(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
%         %
%         % end
%         %%
%         
%         %%%%%%%%
%         for i = 1:30
%             
%             eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\sde+grid-withoutparetobased\MSDE+GRID-DTLZ\2.OURalgorithm_indicator_in_Ma+ES_disprev(05-09)\mating_dis_prevGen(05-09)\DTLZ-MSDE+GRIDdiv-10','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V12(i) = IGD(FunctionValue,K);
%             
%         end
%         
%         for i = 1:30
%             
%             eval(['load D:\OUR_CODES\our_indicator_diffNORm\DTLZ\DTLZ-ISDE-Nocorner\DTLZ-ISDE-Nocorner','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V13(i) = IGD(FunctionValue,K);
%             
%         end
%         for i = 1:30
%             
%             eval(['load D:\OUR_CODES\our_indicator_diffNORm\DTLZ\DTLZ-ISDE-onlyMIN_corner\DTLZ-ISDE-Nocorner','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%             
%             V14(i) = IGD(FunctionValue,K);
%             
%         end
%         %    %% old IGD EXAMPLE
%         %         for i = 1 : 30
%         %
%         %             eval(['load D:\IGDcal\KnEA-ENSD\KnEA-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
%         %
%         %             V1(i) = IGD(FunctionValue,K);
%         %
%         %         end
%         %
%         
%         %%
%         Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6);mean(V7),std(V7);...
%             mean(V8),std(V8);mean(V9),std(V9);mean(V10),std(V10);mean(V11),std(V11);mean(V12),std(V12);mean(V13),std(V13);mean(V14),std(V14)];
%         
%         disp(Result{p})
%         fprintf('\n');
%         
%         %% statistical test
%         [~,a1] = ranksum(V1,V14);
%         [~,a2] = ranksum(V2,V14);
%         [~,a3] = ranksum(V3,V14);
%         [~,a4] = ranksum(V4,V14);
%         [~,a5] = ranksum(V5,V14);
%         [~,a6] = ranksum(V6,V14);
%         [~,a7] = ranksum(V7,V14);
%         [~,a8] = ranksum(V8,V14);
%         [~,a9] = ranksum(V9,V14);
%         [~,a10] = ranksum(V10,V14);
%         [~,a11] = ranksum(V11,V14);
%         [~,a12] = ranksum(V12,V14);
%         [~,a13] = ranksum(V13,V14);
%         ST=[a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13]
%         %% best run
%         
%         [~,r1] = sort(V1);x1=r1(30);
%         [~,r2] = sort(V2);x2=r2(30);
%         [~,r3] = sort(V3);x3=r3(30);
%         [~,r4] = sort(V4);x4=r4(30);
%         [~,r5] = sort(V5);x5=r5(30);
%         [~,r6] = sort(V6);x6=r6(30);
%         [~,r7] = sort(V7);x7=r7(30);
%         [~,r8] = sort(V8);x8=r8(30);
%         [~,r9] = sort(V9);x9=r9(30);
%         [~,r10] = sort(V10);x10=r10(30);
%         [~,r11] = sort(V11);x11=r11(30);
%         [~,r12] = sort(V12);x12=r12(30);
%         [~,r13] = sort(V13);x13=r13(30);
%         [~,r14] = sort(V14);x14=r14(30);
%         best=[x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14]
%         %
%         %%
         clear C;
        
    end
    
end


