%NAME={'KNEA','GREA','BIGE','NSGA-III','SPEA2+SDE','Two-Ar2','MOEA/D','AGE-II','IBEA','SRA','HYPE','ISDE+'};


   % NAME={'KNEA','GREA','BIGE','NSGA-III','SPEA2+SDE','Two-Ar2','MOEA/D','AGE-II','IBEA','SRA','HYPE','ISDE+'};
    for p=1:7
obj= 8
    NAME={'ISDE+','ISDE+-rand_5Wtvectors','all pop'};
   
%i=15;
if obj==2
    if p==1
        i=[19 19]
    elseif p==2
        i=[16 15]
    elseif p==3
        i=[13 22]
    elseif p==4
        i=[18 2]
    elseif p==5
        i=[17 13]
    elseif p==6
        i=[24 30]
    else
        i=[27 11]
    end

elseif obj==4
    if p==1
        i=[22 2]
    elseif p==2
        i=[23 15]
    elseif p==3
        i=[5 29]
    elseif p==4
        i=[18 7]
    elseif p==5
        i=[3 13]
    elseif p==6
        i=[26 2]
    else
        i=[25 13]
    end
   
elseif obj==6
     if p==1
        i=[20 3]
    elseif p==2
        i=[3 20]
    elseif p==3
        i=[28 17]
    elseif p==4
        i=[25 27]
    elseif p==5
        i=[4 1]
    elseif p==6
        i=[17 1]
    else
        i=[24 23]
    end
elseif obj==8
    if p==1
        i=[17 16 ]
    elseif p==2
        i=[15 26]
    elseif p==3
        i=[19 12] 
    elseif p==4
        i=[9 9]
    elseif p==5
        i=[1 16]
    elseif p==6
        i=[24 21]
    else
        i=[23 16]
    end
else 
  if p==1
        i=[10 6]
    elseif p==2
        i=[16 5]
    elseif p==3
        i=[24 27]
    elseif p==4
        i=[13 2]
    elseif p==5
        i=[29 24]
    elseif p==6
        i=[15 26]
    else
        i=[15 24]
    end
end

   
for j=1:3

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
            eval(['load D:\OUR_CODES\ISDE+-with_random5Weights\DTLZ\DTLZ-ISDE+_random5weights\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(2))]);
            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD_1_10_20;
        
         case 3
            eval(['load D:\OUR_CODES\our_indicator_diffSOB\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(1))]);
            a=FunctionValue;
            eval(['load D:\OUR_CODES\ISDE+-with_random5Weights\DTLZ\DTLZ-ISDE+_random5weights\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(2))]);
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
        subplot(1,3,j);
        title(NAME(j));
        figure(p);
        DTLZ(p)=plot(FunctionValue(k,:));
        hold on
    end
     
    clc;
end

fname ='D:\OUR_CODES\our_indicator_diffSOB\plots\isde&isderand5';

   saveas(gca,fullfile(fname,sprintf('DTLZ-best%d-%dOBJ.jpg',p,obj)),'jpg');
   clear all;
   clc
end

  
    