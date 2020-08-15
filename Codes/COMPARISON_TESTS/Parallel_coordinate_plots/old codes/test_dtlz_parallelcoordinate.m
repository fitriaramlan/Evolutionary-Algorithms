for test=[1 2 3]
for  p=1
obj=4
%i=15;
% 1=best,2=median 3= worst

if test==1
    i=[17 11 17 1 28 5 30 30 8 15 25 7 10]
elseif test==2
     i=[2 26 25 9 18 3 15 15 12 14 26 9 26]    
else 
     i=[12 9 15 22 14 17 1 1 12 25 22 12 11]
end
    
   
for j=1:13

    switch j
        case 1
            %i=13
             eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\KnEA_D\KnEA-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i(1))]);
            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\KnEA_D\KnEA-ENSD_1_10_20;
        case 2
            %i=15
           eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\GrEA_D\GrEA_D','_',num2str(p),'_',num2str(obj),'_',num2str(i(2))]);
            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\GrEA_D\GrEA_D_1_10_20;
        case 3
            %i=15
            eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\BiGE_D\BiGE_D','_',num2str(p),'_',num2str(obj),'_',num2str(i(3))]);
           % load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\BiGE_D\BiGE_D_1_10_20;
        case 4
           %i=15
            eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i(4))]);
            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD_1_10_20;
        case 5
           % i=15
            eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i(5))]);
            %load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ_1_10_20;
        case 6
          % i=15
            eval(['load D:\OUR_CODES\two_archive\two-archiv-me-dtlz-new\result-DTLZ\Two-Archive2','_',num2str(p),'_',num2str(obj),'_',num2str(i(6))]);
           % load D:\OUR_CODES\two_archive\two-archiv-me-dtlz-new\result-DTLZ\Two-Archive2_1_10_20;
        case 7
           % i=14
            eval(['load D:\OUR_CODES\MOEA-D\RES-MOEA-D\MOEAD-d\MOEAD_dtlz','_',num2str(p),'_',num2str(obj),'_',num2str(i(7))]);
            %load D:\OUR_CODES\MOEA-D\RES-MOEA-D\MOEAD-d\MOEAD_dtlz_1_10_20;
        case 8
           % i=25
            eval(['load D:\OUR_CODES\AGE-II\AGE-II-DTLZ\RES-AGE-II_DTLZ-org\AGE-II-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i(8))]);
            %load D:\OUR_CODES\AGE-II\AGE-II-DTLZ\RES-AGE-II_DTLZ-org\AGE-II-DTLZ_1_10_20;
        case 9
            %i=15
             eval(['load D:\OUR_CODES\IBEA\IBEA-DTLZ\RES-IBEA-DTLZ-org\IBEA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i(9))]);
            %load D:\OUR_CODES\IBEA\IBEA-DTLZ\RES-IBEA-DTLZ-org\IBEA-DTLZ_1_10_20;
        case 10
           %i=15
            eval(['load D:\OUR_CODES\SRA\SRA-DTLZ\RES-SRA-DTLZ-org\SRA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i(10))]);
            %load D:\OUR_CODES\SRA\SRA-DTLZ\RES-SRA-DTLZ-org\SRA-DTLZ_1_10_20;
         case 11
            %i=15
            eval(['load D:\OUR_CODES\our_indicator\DTLZ\DTLZ-ISDE+\DTLZ-MSDE+GRIDdiv-10','_',num2str(p),'_',num2str(obj),'_',num2str(i(11))]);
        case 12
            %i=15
            eval(['load D:\OUR_CODES\our_indicator_diffNORm\DTLZ\DTLZ-ISDE-Nocorner\DTLZ-ISDE-Nocorner','_',num2str(p),'_',num2str(obj),'_',num2str(i(12))]);
            %load D:\OUR_CODES\our_indicator\DTLZ\DTLZ-ISDE+\DTLZ-MSDE+GRIDdiv-10_1_10_20;
        otherwise
            eval(['load D:\OUR_CODES\our_indicator_diffNORm\DTLZ\DTLZ-ISDE-onlyMIN_corner\DTLZ-ISDE-Nocorner','_',num2str(p),'_',num2str(obj),'_',num2str(i(12))]);
    end
    for k= 1: size(FunctionValue,1)
        %figure(j);
        subplot(3,5,j);
        figure(test);
        DTLZ(p)=plot(FunctionValue(k,:));
        hold on
    end
     
    clc;
end
fname ='C:\Users\TRINADH-ECIS LAB\Desktop\PLOTS\DTLZ';

   saveas(gca,fullfile(fname,sprintf('DTLZ-%d-test%d-OBJ%d-no corner ele.jpg',test,p,obj)),'jpg');
   clear all;
   clc
end
end



    