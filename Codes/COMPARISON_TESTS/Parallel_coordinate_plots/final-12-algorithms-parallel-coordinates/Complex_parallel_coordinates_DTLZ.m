%NAME={'KNEA','GREA','BIGE','NSGA-III','SPEA2+SDE','Two-Ar2','MOEA/D','AGE-II','IBEA','SRA','HYPE','ISDE+'};


   % NAME={'KNEA','GREA','BIGE','NSGA-III','SPEA2+SDE','Two-Ar2','MOEA/D','AGE-II','IBEA','SRA','HYPE','ISDE+'};
    for p=1:7
obj= 10
    NAME={'KNEA','GREA','BIGE','NSGA-III','SPEA2+SDE','Two-Ar2','MOEA/D','AGE-II','IBEA','SRA','HYPE','ISDE+'};
   
%i=15;
if obj==2
    if p==1
        i=[26    11    24    25    19    13    30    30     8    21    24     3]
    elseif p==2
        i=[26    12     1     5    28     4    22    13    26    22     8    14]
    elseif p==3
        i=[28    29    27    13    22    11    30    30     4    28    29     5]
    elseif p==4
        i=[11    24    12    29    23    20    20    30     4    30    22    11]
    elseif p==5
        i=[10     8    14    26     9    23    11     8    17     9    22     8]
    elseif p==6
        i=[11     5    23     6    16    16    13    30    29    26    23    21]
    else
        i=[28    17     1    21    22    21    20    30     9    14    24     5]
    end

elseif obj==4
    if p==1
        i=[4    11     6    23     4    26    30    30     8    29    10    18]
    elseif p==2
        i=[22    22    27    28    23     3     1    11    25    30    15    24]
    elseif p==3
        i=[9    28    22    13    12    30    30    30     5    16    28    12]
    elseif p==4
        i=[23    20    27    10    12    24     3    30    23    13    14    21]
    elseif p==5
        i=[30    30     8    22     1     7    25    23    14    16    17    25]
    elseif p==6
        i=[27    18    24    19     9    12    28    23    14    28    12    18]
    else
        i=[20    12     9     5     7    25    29    30    20    23     7    25]
    end
   
elseif obj==6
    if p==1
        i=[17    20    24    22    21     2    30    30    16    25    26    27]
    elseif p==2
        i=[11    15    11     6     3     6     8    13    15    16    29    20]
    elseif p==3
        i=[10    27    30    30    29    30    30    30    30    29    29    30]
    elseif p==4
        i=[8    24     3    25     7    10    21    10    12    20    28    29]
    elseif p==5
        i=[24    14     7    24    30    11    11    23     6    20     3    10]
    elseif p==6
        i=[13    25     8    24    25    16    27    24    28    27    14     4]
    else
        i=[8    12     3    16     3     1    15    30     5    13     9    24]
    end
elseif obj==8
    if p==1
        i=[15     7     5    23    17    12    30    30     9    15     2    24]
    elseif p==2
        i=[6    20    11    28    11    26    14    15    28     3    16    14]
    elseif p==3
        i=[24    30    30    30    30    30    28    10    30    30    30    30]
    elseif p==4
        i=[29    20    10    24     2    11     8    15    24    28    13    28]
    elseif p==5
        i=[19     7    24     1    27     5    23    13     8     7     8    23]
    elseif p==6
        i=[27     9    24    24    13     4    30     7    10    18    21    12]
    else
        i=[27    22    23    23    28     1     2    30     1     6    24    24]
    end
else 
    if p==1
        i=[19     2    13    29     6     6    30    30     9    28     9    29]
    elseif p==2
        i=[23    30    22    29    30    24    28    14    30    12     5    29]
    elseif p==3
        i=[29    30    30    30    30    30    30    24    30    30    30    30]
    elseif p==4
        i=[30    30    30    30    30    30    30    25    29    30    30    30]
    elseif p==5
        i=[29     1     9     1    16    27    27    22    28     5    17    22]
    elseif p==6
        i=[5    23    24    29    26    16    14     7    17    15    27    30]
    else
        i=[6     1     6    11    11    13    23    30    17     8    17     7]
    end    
end

   
for j=1:12

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
            eval(['load D:\OUR_CODES\HYPE\HYPE-DTLZ\RES-HYPE-DTLZ-org\HYPE-DTLZ','_',num2str(p),'_',num2str(obj),'_',num2str(i(11))]);
        
        otherwise
            eval(['load D:\OUR_CODES\our_indicator\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(12))]);
    end
    for k= 1: size(FunctionValue,1)
        %figure(p);
        subplot(3,4,j);
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

  
    