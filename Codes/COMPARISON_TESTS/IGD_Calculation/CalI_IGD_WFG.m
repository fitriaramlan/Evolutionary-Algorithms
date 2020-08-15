for obj= [ 4 6 8 10]
    
    Result=cell(2,1);
    
    for p = 1 : 9
        
        objective = obj
        
        Problem = p
        
        run = 30;
        
        %-----------------------------------------------------------------------------------------
        C = [ ];
        
        for i = 1:30
            
            eval(['load D:\IGDcal\KnEA-ENSW\KnEA','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
            
            C = [ C ; F ];
            
        end
        
        for i = 1:30
            
            eval(['load D:\IGDcal\KnEA-ANSW\KnEAWANS','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
            
            C = [ C ; F ];
            
        end
        
        for i = 1:30
            
            eval(['load D:\IGDcal\KnEA-SR9W\KnEAAS9W','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
            
            C = [ C ; F ];
            
        end
        
       
        S = F_output(C);
        
        Point  = max(S,[],1);
        
        FrontValue       = ENS_SS(S);
        
        DistanceValue    = F_distance(S,FrontValue);
        
        [~,M ] = sort(DistanceValue','descend');
        
        MM = size(M,1);
        
        if MM >= 500
            
            K = S(M(1:500),:);
            
        else
            
            K = S(M(1:MM),:);
        end
        
        
        V1 = zeros(1,30);
        V2 = zeros(1,30);
        V3 = zeros(1,30);
        %  V4 = zeros(1,30);
        %  V5 = zeros(1,30);
        
        
        for i = 1 : 30
            
            eval(['load D:\IGDcal\KnEA-ENSW\KnEA','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
             
            V1(i) = IGD_Function(F,K);
            
        end
        
        for i = 1 : 30
            
            eval(['load D:\IGDcal\KnEA-ANSW\KnEAWANS','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
            
            V2(i) = IGD_Function(F,K);
            
        end
        
        for i = 1 : 30
            
            eval(['load D:\IGDcal\KnEA-SR9W\KnEAAS9W','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
                      
            V3(i) = IGD_Function(F,K);
            
        end
        
        Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3)];
        
        disp(Result{p})
        
        [~,r1] = ranksum(V1,V2);
        [~,r2] = ranksum(V1,V3);
        
        [r1,r2]
        
        [~,r3] = ranksum(V2,V3);
        % [~,r4] = ranksum(V4,V5);
        [r3]
        %
        
        clear C;
        
        
    end
    
end