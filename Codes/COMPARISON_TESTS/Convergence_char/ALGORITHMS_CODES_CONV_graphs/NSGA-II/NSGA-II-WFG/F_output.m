function F = F_output (F)

    NonDominated  = ENS_SS(F,'first')==1;
    
    F             = F(NonDominated,:);

end

