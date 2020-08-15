%NAME={'KNEA','GREA','BIGE','NSGA-III','SPEA2+SDE','Two-Ar2','MOEA/D','AGE-II','IBEA','SRA','HYPE','ISDE+'};


% NAME={'KNEA','GREA','BIGE','NSGA-III','SPEA2+SDE','Two-Ar2','MOEA/D','AGE-II','IBEA','SRA','HYPE','ISDE+'};
for p=1:7
    obj= 10
    %NAME={'ISDE+','ISDE+-rand_5Wtvectors','all pop'};
    NAME={'ISDE+','ISDE+-rand_5Wtvectors','Isde+with_SOB_Sort'};
    %i=15;
    if obj==2
        if p==1
            i=[3 8 12];
        elseif p==2
            i=[21 12 27];
        elseif p==3
            i=[16 17 9];
        elseif p==4
            i=[19 27 16];
        elseif p==5
            i=[13 19 22];
        elseif p==6
            i=[2 29 18];
        else
            i=[29 10 17];
        end
        
    elseif obj==4
        if p==1
            i=[26 13 8];
        elseif p==2
            i=[24 19 26];
        elseif p==3
            i=[17 30 12];
        elseif p==4
            i=[21 8 9];
        elseif p==5
            i=[5 3 4];
        elseif p==6
            i=[24 9 5];
        else
            i=[29 28 30];
        end
        
    elseif obj==6
        if p==1
            i=[1 7 14];
        elseif p==2
            i=[21 17 18];
        elseif p==3
            i=[26 26 20];
        elseif p==4
            i=[5 24 24];
        elseif p==5
            i=[14 4 19];
        elseif p==6
            i=[15 17 18];
        else
            i=[3 14 14];
        end
    elseif obj==8
        if p==1
            i=[28 13 24];
        elseif p==2
            i=[27 11 3];
        elseif p==3
            i=[30 30 2];
        elseif p==4
            i=[4 28 21];
        elseif p==5
            i=[16 21 10];
        elseif p==6
            i=[18 23 6];
        else
            i=[16 16 29];
        end
    else
        if p==1
            i=[11 28 4];
        elseif p==2
            i=[15 23 29];
        elseif p==3
            i=[30 30 10];
        elseif p==4
            i=[7 13 12];
        elseif p==5
            i=[28 2 19];
        elseif p==6
            i=[14 5 29];
        else
            i=[15 3 11];
        end
    end
    
    
    for j=1:3
        
        switch j
            %
            case 1
                
                eval(['load D:\OUR_CODES\our_indicator\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(1))]);
                
            case 2
                
                eval(['load D:\OUR_CODES\ISDE+-with_random5Weights\DTLZ\DTLZ-ISDE+_random5weights\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(2))]);
            case 3
                
                eval(['load D:\OUR_CODES\ISDE+-with_random5Weights\DTLZ\code-for_sortingondiffobj_isde+\sort-oN_OBJ_isde+\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(3))]);
                %% plotting all population
                %          case 3
                %             eval(['load D:\OUR_CODES\our_indicator_diffSOB\DTLZ\DTLZ-ISDE+_sir\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(1))]);
                %             a=FunctionValue;
                %             eval(['load D:\OUR_CODES\ISDE+-with_random5Weights\DTLZ\DTLZ-ISDE+_random5weights\DTLZ-ISDE+','_',num2str(p),'_',num2str(obj),'_',num2str(i(2))]);
                %            FunctionValue=[a;FunctionValue];
                %%
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
    
    fname ='D:\OUR_CODES\ISDE+-with_random5Weights\prallelco-ordinates&HV_CAL\Plots-trail-3';
    
    saveas(gca,fullfile(fname,sprintf('DTLZ-best%d-%dOBJ.jpg',p,obj)),'jpg');
    clear all;
    clc
end


