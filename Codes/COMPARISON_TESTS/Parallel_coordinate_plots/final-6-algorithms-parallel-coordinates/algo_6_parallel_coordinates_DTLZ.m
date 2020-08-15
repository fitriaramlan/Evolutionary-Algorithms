%NAME={'KNEA','GREA','BIGE','NSGA-III','SPEA2+SDE','Two-Ar2','MOEA/D','AGE-II','IBEA','SRA','HYPE','ISDE+'};


   % NAME={'KNEA','GREA','BIGE','NSGA-III','SPEA2+SDE','Two-Ar2','MOEA/D','AGE-II','IBEA','SRA','HYPE','ISDE+'};
    for p=1:7
obj= 2
    NAME={'GREA','NSGA-III','SPEA2+SDE','IBEA','SRA','HYPE','ISDE+'};
   
%i=15;
if obj==2
    if p==1
        i=[11  25  19   8   21  24   3]
    elseif p==2
        i=[12   5  28  26   22  8   14]
    elseif p==3
        i=[29  13  22   4   28  29   5]
    elseif p==4
        i=[24  29  23   4   30  22  11]
    elseif p==5
        i=[8   26   9  17    9  22   8]
    elseif p==6
        i=[5    6  16  29   26  23  21]
    else
        i=[17  21  22   9   14  24   5]
    end

elseif obj==4
    if p==1
        i=[11    23   4   8    29    10    18]
    elseif p==2
        i=[22   28   23   25   30   15   24]
    elseif p==3
        i=[28    13    12     5    16    28    12]
    elseif p==4
        i=[20     10    12    23    13    14    21]
    elseif p==5
        i=[30   22     1       14    16    17    25]
    elseif p==6
        i=[18    19     9     14    28    12    18]
    else
        i=[12     5     7     20    23     7    25]
    end
   
elseif obj==6
    if p==1
        i=[20    22    21     16    25    26    27]
    elseif p==2
        i=[15     6     3    15    16    29    20]
    elseif p==3
        i=[27    30    29     30    29    29    30]
    elseif p==4
        i=[24    25     7    12    20    28    29]
    elseif p==5
        i=[14    24    30    6    20     3    10]
    elseif p==6
        i=[25    24    25     28    27    14     4]
    else
        i=[12    16     3       5    13     9    24]
    end
elseif obj==8
    if p==1
        i=[7   23    17     9    15     2    24]
    elseif p==2
        i=[20   28    11   28     3    16    14]
    elseif p==3
        i=[ 30   30    30    30    30    30    30]
    elseif p==4
        i=[20   24     2     24    28    13    28]
    elseif p==5
        i=[7   1    27       8     7     8    23]
    elseif p==6
        i=[9   24    13      10    18    21    12]
    else
        i=[22   23    28    1     6    24    24]
    end
else 
    if p==1
        i=[2   29     6     9    28     9    29]
    elseif p==2
        i=[30    29    30     30    12     5    29]
    elseif p==3
        i=[30   30    30    30    30    30    30]
    elseif p==4
        i=[30     30    30    29    30    30    30]
    elseif p==5
        i=[1     1    16      28     5    17    22]
    elseif p==6
        i=[23     29    26     17    15    27    30]
    else
        i=[1    11    11     17     8    17     7]
    end    
end

   
for j=1:7

    switch j
%         case 1
%             %i=13
%              eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\KnEA_D\KnEA-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i(1))]);
%             %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\KnEA_D\KnEA-ENSD_1_10_20;
        case 1
            %i=15
           eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\GrEA_D\GrEA_D','_',num2str(p),'_',num2str(obj),'_',num2str(i(1))]);
            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\GrEA_D\GrEA_D_1_10_20;
%         case 3
%             %i=15
%             eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\BiGE_D\BiGE_D','_',num2str(p),'_',num2str(obj),'_',num2str(i(3))]);
%            % load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\BiGE_D\BiGE_D_1_10_20;
        case 2
           %i=15
            eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i(2))]);
            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD_1_10_20;
        case 3
           % i=15
            eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i(3))]);
            %load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ_1_10_20;
%         case 6
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
        case 4
            %i=15
             eval(['load D:\OUR_CODES\IBEA\IBEA-DTLZ\RES-IBEA-DTLZ-org\IBEA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i(4))]);
            %load D:\OUR_CODES\IBEA\IBEA-DTLZ\RES-IBEA-DTLZ-org\IBEA-DTLZ_1_10_20;
        case 15
           %i=15
            eval(['load D:\OUR_CODES\SRA\SRA-DTLZ\RES-SRA-DTLZ-org\SRA-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i(5))]);
            %load D:\OUR_CODES\SRA\SRA-DTLZ\RES-SRA-DTLZ-org\SRA-DTLZ_1_10_20;
        case 6
            eval(['load D:\OUR_CODES\HYPE\HYPE-DTLZ\RES-HYPE-DTLZ-org\HYPE-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i(6))]);
        
        otherwise
            eval(['load D:\OUR_CODES\our_indicator\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(7))]);
    end
    for k= 1: size(FunctionValue,1)
        %figure(p);
        subplot(2,4,j);
        title(NAME(j));
        figure(p);
        DTLZ(p)=plot(FunctionValue(k,:));
        hold on
    end
     
    clc;
end

fname ='C:\Users\TRINADH-ECIS LAB\Desktop\PLOTS\DTLZ';

   saveas(gca,fullfile(fname,sprintf('DTLZ-best%d-%dOBJ.jpg',p,obj)),'jpg');
   clear all;
   clc
end

  
    