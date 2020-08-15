NAME={'KnEA','GrEA','BiGE','NSGA_III','SPEA2+SDE','TWO_Ar2','MOEA-D','AGE-II','IBEA','SRA','our_ISDE+'};
for pp=3
    for MM=4
        %i=15;
        
       linespec = {'b--', 'r--', 'g--','k--','m--','c--','b-', 'r-', 'g-','k-','c-' };
        for jj=1:1:11
            
            eval(['load D:\OUR_CODES\COMPARISON_TESTS\Convergence_char\FINAL_PLOTvalues\',num2str(NAME{jj}),'_',num2str(pp),'_',num2str(MM),'.mat']);
            
            figure(1)
             hold on
            plot(FinalMean(:,1),FinalMean(:,2),linespec{jj});
            legendinfo1{jj}= [sprintf('%c',NAME{jj})];
           % legend(sprintf('%c',NAME{jj}))
           legend(legendinfo1)
          
            figure(2)
            hold on
            plot(FinalMean(:,1),FinalMean(:,3),linespec{jj});
            legendinfo2{jj}= [sprintf('%c',NAME{jj})];
            %legend(sprintf('%c',NAME{jj}))
            legend(legendinfo2)
            
            figure(3)
            hold on
            plot(FinalMean(:,1),FinalMean(:,4),linespec{jj});
            legendinfo3{jj}= [sprintf('%c',NAME{jj})];
           legend(legendinfo3)
            
        end %for loop
%         legend(legendinfo1)
%         legend(legendinfo2)
%         legend(legendinfo3)
    end % for OBJ
end % for Problem


%     for k= 1: size(FunctionValue,1)
%         %figure(j);
%         subplot(3,5,j);
%         title(NAME(j));
%         figure(p);
%         DTLZ(p)=plot(FunctionValue(k,:));
%         hold on
%     end
%      
%     clc;
% end
% keyboard
% fname ='C:\Users\TRINADH-ECIS LAB\Desktop\PLOTS\DTLZ';
% 
%    saveas(gca,fullfile(fname,sprintf('DTLZ-best%d-%dOBJ-no corner ele.jpg',p,obj)),'jpg');
%    clear all;
%    clc
%    end
