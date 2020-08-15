p=1;
obj=10;
run=20;

for j=1:11

    switch j
        case 1
            load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\KnEA_D\KnEA-ENSD_num2str(p)_num2str(obj)_num2str(run);
        case 2
            load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\GrEA_D\GrEA_D_1_10_20;
        case 3
            load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\DTLZfiles\BiGE_D\BiGE_D_1_10_20;
        case 4
            load D:\ARCHIVE-BASED\org-K-G-B-NSGA-III\files_of_NSGAIII\NSGAIII_D\NSGAIII-ENSD_1_10_20;
        case 5
            load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ\SPEA2+SDE-our-DTLZ_1_10_20;
        case 6
            load D:\OUR_CODES\two_archive\two-archiv-me-dtlz-new\result-DTLZ\Two-Archive2_1_10_20;
        case 7
            load D:\OUR_CODES\MOEA-D\RES-MOEA-D\MOEAD-d\MOEAD_dtlz_1_10_20;
        case 8
            load D:\OUR_CODES\AGE-II\AGE-II-DTLZ\RES-AGE-II_DTLZ-org\AGE-II-DTLZ_1_10_20;
        case 9
            load D:\OUR_CODES\IBEA\IBEA-DTLZ\RES-IBEA-DTLZ-org\IBEA-DTLZ_1_10_20;
        case 10
            load D:\OUR_CODES\SRA\SRA-DTLZ\RES-SRA-DTLZ-org\SRA-DTLZ_1_10_20;
        otherwise
            load D:\OUR_CODES\our indicator\DTLZ\DTLZ-ISDE+\DTLZ-MSDE+GRIDdiv-10_1_10_20;
    end
    for i= 1: length(FunctionValue)
        figure(j);
        plot(FunctionValue(i,:));
        hold on
    end
end
    