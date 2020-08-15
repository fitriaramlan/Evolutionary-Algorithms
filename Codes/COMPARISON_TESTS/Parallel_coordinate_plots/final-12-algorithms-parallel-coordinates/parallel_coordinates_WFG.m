for p=1:9
obj=10;
%i=15;
if p==1
    i=[26 2 26 15 13 17 8 2 9 24 2 19]
elseif p==2
    i=[9 15 23 18 19 16 15 15 25 1 11 25]
    
elseif p==3
    i=[26 6 27 14 17 12 12 20 10 17 10 12]
elseif p==4
    i=[29 14 2 2 10 30 22 8 14 29 4 29]
elseif p==5
    i=[9 19 5 25 10 6 6 14 15 1 15 28]
elseif p==6
    i=[20 29 26 12 17 29 30 15 19 4 18 16]
elseif p==7
    i=[23 5 1 15 29 22 11 28 6 10 9 22]
elseif p==8
    i=[24 20 24 10 24 27 30 15 17 10 19 10]
else 
    i=[30 25 7 12 21 28 9 8 17 24 7 18]
end

for j=1:12

    switch j
        case 1
           % i=2
             eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\KnEA_org_WFgpop\KnEA','_',num2str(p),'_',num2str(obj),'_',num2str(i(1))]);
            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\KnEA_org_WFgpop\KnEA_1_10_20;
        case 2
           % i=25
            eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\GrEA_W\GrEA_W','_',num2str(p),'_',num2str(obj),'_',num2str(i(2))]);
            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\GrEA_W\GrEA_W_1_10_20;
        case 3
            %i=5
            eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\BiGE_W\BiGE_W','_',num2str(p),'_',num2str(obj),'_',num2str(i(3))]);
            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\BiGE_W\BiGE_W_1_10_20;
        case 4
           % i=29
             eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_W\NSGAIII-ENSW','_',num2str(p),'_',num2str(obj),'_',num2str(i(4))]);

            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_W\NSGAIII-ENSW_1_10_20;
        case 5
            %i=25
                 eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i(5))]);

            %load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG_1_10_20;
        case 6
            %i=20
                 eval(['load D:\OUR_CODES\two_archive\two-archiv-wfg-new\result-wfz\Two-Archive2','_',num2str(p),'_',num2str(obj),'_',num2str(i(6))]);

            %load D:\OUR_CODES\two_archive\two-archiv-wfg-new\result-wfz\Two-Archive2_1_10_20;
        case 7
            %i=29
      eval(['load D:\OUR_CODES\MOEA-D\RES-MOEA-D\popof_MOEAD-wfg\MOEAD_wfg','_',num2str(p),'_',num2str(obj),'_',num2str(i(7))]);
           
            %load D:\OUR_CODES\MOEA-D\RES-MOEA-D\popof_MOEAD-wfg\MOEAD_wfg_1_10_20;
        case 8
           % i=2
              eval(['load D:\OUR_CODES\AGE-II\AGE-II-WFG\RES-AGE-II-WFG-org\AGE-II_WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i(8))]);
   
            %load D:\OUR_CODES\AGE-II\AGE-II-WFG\RES-AGE-II-WFG-org\AGE-II_WFG_1_10_20;
        case 9
           % i=17
                 eval(['load D:\OUR_CODES\IBEA\IBEA-WFG\RES-IBEA-WFG-org\IBEA-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i(9))]);

            %load D:\OUR_CODES\IBEA\IBEA-WFG\RES-IBEA-WFG-org\IBEA-WFG_1_10_20;
        case 10
           % i=16
                 eval(['load D:\OUR_CODES\SRA\SRA-WFG\RES-SRA-WFG-org\SRA-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i(10))]);

            %load D:\OUR_CODES\SRA\SRA-WFG\RES-SRA-WFG-org\SRA-WFG_1_10_20;
        case 11
           % i=13
            eval(['load D:\OUR_CODES\our_indicator\WFG\WFG-ISDE+\WFG-MSDE+GRIDdiv-10','_',num2str(p),'_',num2str(obj),'_',num2str(i(11))]);
            %load D:\OUR_CODES\our_indicator\WFG\WFG-ISDE+\WFG-MSDE+GRIDdiv-10_1_10_20;
        otherwise
             eval(['load D:\OUR_CODES\our_indicator_diffNORm\WFG\WFG-ISDE-nocorner\WFG-ISDE-NOcorner','_',num2str(p),'_',num2str(obj),'_',num2str(i(12))]);
    end
     for k= 1: size(F,1)
        %figure(j);
        subplot(3,4,j);
        figure(p);
       DTLZ(p)=plot(F(k,:));
        hold on
    end
     
    clc;
end
fname ='C:\Users\TRINADH-ECIS LAB\Desktop\PLOTS\WFG';

   saveas(gca,fullfile(fname,sprintf('WFG%d-%dOBJ-no corner ele.jpg',p,obj)),'jpg');
   clear all;
   clc
   end
    
    