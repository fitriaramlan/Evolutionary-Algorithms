function FunctionValue = F_output (FunctionValue)

    NonDominated  = ENS_SS(FunctionValue,'first')==1;
    
    FunctionValue = FunctionValue(NonDominated,:);

end

