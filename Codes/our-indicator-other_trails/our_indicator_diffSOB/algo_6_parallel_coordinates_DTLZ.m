%NAME={'KNEA','GREA','BIGE','NSGA-III','SPEA2+SDE','Two-Ar2','MOEA/D','AGE-II','IBEA','SRA','HYPE','ISDE+'};


   % NAME={'KNEA','GREA','BIGE','NSGA-III','SPEA2+SDE','Two-Ar2','MOEA/D','AGE-II','IBEA','SRA','HYPE','ISDE+'};
    for p=1:7
obj= 8
    NAME={'ISDE+','ISDE+-randW1','ISDE+-randW2','all pop'};
   
%i=15;
if obj==2
    if p==1
        i=[9 3 2]
    elseif p==2
        i=[6 5 6]
    elseif p==3
        i=[9 7 5]
    elseif p==4
        i=[4 7 10]
    elseif p==5
        i=[2 6 1]
    elseif p==6
        i=[10 10 8]
    else
        i=[4 9 1]
    end

elseif obj==4
    if p==1
        i=[ 4 10 9]
    elseif p==2
        i=[10 6 9]
    elseif p==3
        i=[6 7 10]
    elseif p==4
        i=[4 7 2]
    elseif p==5
        i=[1 2 2]
    elseif p==6
        i=[2 9 7]
    else
        i=[1 2 7]
    end
   
elseif obj==6
     if p==1
        i=[3 6 10 ]
    elseif p==2
        i=[1 10 8]
    elseif p==3
        i=[1 6 6]
    elseif p==4
        i=[7 6 7]
    elseif p==5
        i=[4 8 6]
    elseif p==6
        i=[5 5 8]
    else
        i=[8 10 3]
    end
elseif obj==8
    if p==1
        i=[10 8 9 ]
    elseif p==2
        i=[9 6 5]
    elseif p==3
        i=[8 4 2] 
    elseif p==4
        i=[7 1 7]
    elseif p==5
        i=[3 2 6]
    elseif p==6
        i=[5 5 6]
    else
        i=[7 9 3]
    end
else 
  if p==1
        i=[8 7 9 ]
    elseif p==2
        i=[5 8 7]
    elseif p==3
        i=[5 2 10]
    elseif p==4
        i=[3 5 2]
    elseif p==5
        i=[5 10 5]
    elseif p==6
        i=[4 2 2]
    else
        i=[7 2 8]
    end
end

   
for j=1:4

    switch j
%         case 1
%             %i=13
%              eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\KnEA_D\KnEA-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i(1))]);
%             %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\KnEA_D\KnEA-ENSD_1_10_20;
        case 1
            %i=15
           eval(['load D:\OUR_CODES\our_indicator_diffSOB\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(1))]);
            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\GrEA_D\GrEA_D_1_10_20;
%        
        case 2
           %i=15
            eval(['load D:\OUR_CODES\our_indicator_diffSOB\DTLZ\DTLZ-Isde-diff_SOB\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(2))]);
            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD_1_10_20;
        case 3
           % i=15
            eval(['load D:\OUR_CODES\our_indicator_diffSOB\DTLZ\DTLZ-Isde-diff_SOB-RAND\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(3))]);
            %load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ_1_10_20;
         case 4
            eval(['load D:\OUR_CODES\our_indicator_diffSOB\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(1))]);
            a=FunctionValue;
            eval(['load D:\OUR_CODES\our_indicator_diffSOB\DTLZ\DTLZ-Isde-diff_SOB\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(2))]);
            a=[a;FunctionValue];
            eval(['load D:\OUR_CODES\our_indicator_diffSOB\DTLZ\DTLZ-Isde-diff_SOB-RAND\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(3))]);
            FunctionValue=[a;FunctionValue];
%           % i=15
%             eval(['load D:\OUR_CODES\two_archive\two-archiv-me-dtlz-new\result-DTLZ\Two-Archive2','_',num2str(p),'_',num2str(obj),'_',num2str(i(6))]);
%            % load D:\OUR_CODES\two_archive\two-archiv-me-dtlz-new\result-DTLZ\Two-Archive2_1_10_20;
%         case 7
%            % i=14
%             eval(['load D:\OUR_CODES\MOEA-D\RES-MOEA-D\MOEAD-d\MOEAD_dtlz','_',num2str(p),'_',num2str(obj),'_',num2str(i(7))]);
%             %load D:\OUR_CODES\MOEA-D\RES-MOEA-D\MOEAD-d\MOEAD_dtlz_1_10_20;
%         case 8
%            % i=25
%             eval(['load D:\OUR_CODES\AGE-II\AGE-II-DTLZ\RES-AGE-II_DTLZ-org\AGE-II-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i(8))]);
%             %load D:\OUR_CODES\AGE-II\AGE-II-DTLZ\RES-AGE-II_DTLZ-org\AGE-II-DTLZ_1_10_20;
%         case 4
%             %i=15
%              eval(['load D:\OUR_CODES\IBEA\IBEA-DTLZ\RES-IBEA-DTLZ-org\IBEA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i(4))]);
%             %load D:\OUR_CODES\IBEA\IBEA-DTLZ\RES-IBEA-DTLZ-org\IBEA-DTLZ_1_10_20;
%         case 15
%            %i=15
%             eval(['load D:\OUR_CODES\SRA\SRA-DTLZ\RES-SRA-DTLZ-org\SRA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i(5))]);
%             %load D:\OUR_CODES\SRA\SRA-DTLZ\RES-SRA-DTLZ-org\SRA-DTLZ_1_10_20;
%         case 6
%             eval(['load D:\OUR_CODES\HYPE\HYPE-DTLZ\RES-HYPE-DTLZ-org\HYPE-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i(6))]);
%         
%         otherwise
%             eval(['load D:\OUR_CODES\our_indicator\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(7))]);
    end
    for k= 1: size(FunctionValue,1)
        %figure(p);
        subplot(1,4,j);
        title(NAME(j));
        figure(p);
        DTLZ(p)=plot(FunctionValue(k,:));
        hold on
    end
     
    clc;
end

fname ='D:\OUR_CODES\our_indicator_diffSOB\plots';

   saveas(gca,fullfile(fname,sprintf('DTLZ-best%d-%dOBJ.jpg',p,obj)),'jpg');
   clear all;
   clc
end

  
    