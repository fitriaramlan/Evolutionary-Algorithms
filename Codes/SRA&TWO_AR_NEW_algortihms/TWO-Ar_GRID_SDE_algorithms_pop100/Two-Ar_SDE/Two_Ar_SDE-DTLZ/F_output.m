function F_output (Population,time,Algorithm,testNo,M,k,run)
% This function is used for deleting the dominated solutions, 
% and saving the result in the file

    
    F            = F_DTLZ(Population,testNo,M,k);  
   
    % Delete the dominated solutions
    NonDominated  = ENS_SS(F,'first')==1;
    Population    = Population(NonDominated,:);
    F             = F(NonDominated,:);

    % Save the result to .m file
    eval(['save Two_Ar_SDE-DTLZ\', Algorithm,'_', num2str(testNo),'_', num2str(M),'_', num2str(run), ' Population F time'])
    % Save the result to two .txt files
    %savedata(Population   ,[Algorithm,'_', num2str(testNo),'_', num2str(M),'_', num2str(run),'_PS.txt']);
    %savedata(F,[Algorithm,'_', num2str(testNo),'_', num2str(M),'_', num2str(run),'_PF.txt']);
end


function savedata(mat,filename)
    f=fopen(filename,'w');
    for i=1:size(mat,1)
        for j=1:size(mat,2)
            fprintf(f,'%15.6e',mat(i,j));
        end
        fprintf(f,'\r\n');
    end
    fclose(f);
end