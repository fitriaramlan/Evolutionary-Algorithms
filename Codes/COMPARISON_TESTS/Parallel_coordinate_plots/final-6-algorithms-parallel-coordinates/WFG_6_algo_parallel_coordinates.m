for p=1:9
obj= 2
    NAME={'GREA','NSGA-III','SPEA2+SDE','IBEA','SRA','HYPE','ISDE+'};
   
%i=15;
if obj==2
    if p==1
        i=[5    9    10    12    27    14     5]
    elseif p==2
        i=[3    1    4    15     6    12    27]
    elseif p==3
        i=[19   26    24   14    18     8    22]
    elseif p==4
        i=[23   12    24   21     3    27    20]
    elseif p==5
        i=[29   7    16    29    17    14     7]
    elseif p==6
        i=[26   24    27   6    17     6    19]
    elseif p==7
        i=[30   5     3    22    21    16    24]
    elseif p==8
        i=[6   10    17     5     4     5    27]
    else 
        i=[6    25    15    5    11    14    25]
    end

elseif obj==4
    if p==1
        i=[25    20     5      5    23    11    21]
    elseif p==2
        i=[ 7     26    12   6    26     3    28]
    elseif p==3
        i=[5     1    21     21    24    26    20]
    elseif p==4
        i=[21    28    19       25    16    18    24]
    elseif p==5
        i=[ 21   19    23    14     7    22    18]
    elseif p==6
        i=[ 3    14    12    17    13    11     5]
    elseif p==7
        i=[ 12    25    22    17    19    26     2]
    elseif p==8
        i=[ 7      13    18    29     8    16    26]
    else 
        i=[  8      12    15    19     4    27    16]
    end
   
elseif obj==6
   if p==1
        i=[24    27     9      14    30     9    11]
    elseif p==2
        i=[26    27    27     15    19    13     8]
    elseif p==3
        i=[23    19     2    29     4    20    24]
    elseif p==4
        i=[ 3     21    30    15     7    30    27]
    elseif p==5
        i=[ 8     9    18     15    18     1    14]
    elseif p==6
        i=[ 3     15    29     9    15    27     1]
    elseif p==7
        i=[27      3    23    8    20    20    10]
    elseif p==8
        i=[ 14     10    20    30    24    30    13]
    else 
        i=[ 3      9    14      9    26    23     4]
    end
elseif obj==8
   if p==1
        i=[21    27     5     29    26    22    20]
    elseif p==2
        i=[ 3     20     5     3     1    15    16]
    elseif p==3
        i=[29    22     7      23     2    25     1]
    elseif p==4
        i=[30   23    11      12    29    22    16]
    elseif p==5
        i=[1    24    21     14     8     5     9]
    elseif p==6
        i=[29     3    22      4     6    18     1]
    elseif p==7
        i=[12     25    6     14    13    26     1]
    elseif p==8
        i=[7    30    17      10    30    16    27]
    else 
        i=[ 4   27    11     16    30    18     8]
    end
else 
    if p==1
        i=[30    28    25     29    23    14    21]
    elseif p==2
        i=[25      1    29    11     2    15    20]
    elseif p==3
        i=[15    16     8      7    23    24    11]
    elseif p==4
        i=[18   23    28     29     3    14     4]
    elseif p==5
        i=[28    19     4      4    15    29     7]
    elseif p==6
        i=[1    13     7      27    15    19    28]
    elseif p==7
        i=[24    11     9      23     5     1    13]
    elseif p==8
        i=[ 30    13    27     12    22    22    16]
    else 
        i=[23     1    26     15    20    22    12]
    end    
end

for j=1:7

    switch j
%         case 1
%            % i=2
%              eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\KnEA_org_WFgpop\KnEA','_',num2str(p),'_',num2str(obj),'_',num2str(i(1))]);
%             %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\KnEA_org_WFgpop\KnEA_1_10_20;
        case 2
           % i=25
            eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\GrEA_W\GrEA_W','_',num2str(p),'_',num2str(obj),'_',num2str(i(1))]);
            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\GrEA_W\GrEA_W_1_10_20;
%         case 3
%             %i=5
%             eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\BiGE_W\BiGE_W','_',num2str(p),'_',num2str(obj),'_',num2str(i(3))]);
%             %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\WFG_files\BiGE_W\BiGE_W_1_10_20;
        case 4
           % i=29
             eval(['load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_W\NSGAIII-ENSW','_',num2str(p),'_',num2str(obj),'_',num2str(i(2))]);

            %load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_W\NSGAIII-ENSW_1_10_20;
        case 5
            %i=25
                 eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i(3))]);

            %load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG\SPEA2+SDE-our-WFG_1_10_20;
%         case 6
%             %i=20
%                  eval(['load D:\OUR_CODES\two_archive\two-archiv-wfg-new\result-wfz\Two-Archive2','_',num2str(p),'_',num2str(obj),'_',num2str(i(6))]);
% 
%             %load D:\OUR_CODES\two_archive\two-archiv-wfg-new\result-wfz\Two-Archive2_1_10_20;
%         case 7
%             %i=29
%       eval(['load D:\OUR_CODES\MOEA-D\RES-MOEA-D\popof_MOEAD-wfg\MOEAD_wfg','_',num2str(p),'_',num2str(obj),'_',num2str(i(7))]);
%            
%             %load D:\OUR_CODES\MOEA-D\RES-MOEA-D\popof_MOEAD-wfg\MOEAD_wfg_1_10_20;
%         case 8
%            % i=2
%               eval(['load D:\OUR_CODES\AGE-II\AGE-II-WFG\RES-AGE-II-WFG-org\AGE-II_WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i(8))]);
%    
%             %load D:\OUR_CODES\AGE-II\AGE-II-WFG\RES-AGE-II-WFG-org\AGE-II_WFG_1_10_20;
        case 9
           % i=17
                 eval(['load D:\OUR_CODES\IBEA\IBEA-WFG\RES-IBEA-WFG-org\IBEA-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i(4))]);

            %load D:\OUR_CODES\IBEA\IBEA-WFG\RES-IBEA-WFG-org\IBEA-WFG_1_10_20;
        case 10
           % i=16
                 eval(['load D:\OUR_CODES\SRA\SRA-WFG\RES-SRA-WFG-org\SRA-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i(5))]);

            %load D:\OUR_CODES\SRA\SRA-WFG\RES-SRA-WFG-org\SRA-WFG_1_10_20;
        case 11
           % i=13
            eval(['load D:\OUR_CODES\HYPE\HYPE-WFG\RES-HYPE-WFG-org\HYPE-WFG','_',num2str(p),'_',num2str(obj),'_',num2str(i(6))]);
            %load D:\OUR_CODES\our_indicator\WFG\WFG-ISDE+\WFG-MSDE+GRIDdiv-10_1_10_20;
        otherwise
             eval(['load D:\OUR_CODES\our_indicator\WFG\WFG-ISDE+_sir\WFG-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(7))]);
    end
     for k= 1: size(F,1)
        %figure(j);
        subplot(2,4,j);
        title(NAME(j));
        figure(p);
       WFG(p)=plot(F(k,:));
        hold on
    end
     
    clc;
end
fname ='C:\Users\TRINADH-ECIS LAB\Desktop\PLOTS\WFG';

   saveas(gca,fullfile(fname,sprintf('WFG%d-%d-OBJe.jpg',p,obj)),'jpg');
   clear all;
   clc
   end
    
    