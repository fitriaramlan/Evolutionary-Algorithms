for obj= [ 4 6 8 10] 
      
Result=cell(2,1);

for p = 1 :  7 
objective = obj

Problem = p

run = 30; 

%-----------------------------------------------------------------------------------------     
C = [ ];

for i = 1:30
 
 eval(['load D:\IGDcal\KnEA-ENSD\KnEA-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; FunctionValue ];

 end

 for i = 1:30
 
 eval(['load D:\DeltaCal\NSGAIII-ANSD\NSGAIII-ANSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; FunctionValue ];

 end

 
 for i = 1:30
 
 eval(['load D:\DeltaCal\NSGAIII-SR9D\NSGAIII-SR9D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; FunctionValue ];

 end
 
 for i = 1:30
 
 eval(['load D:\DeltaCal\NSGAIII-SR11D\NSGAIII-SR11D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; FunctionValue ];

 end
 
 S = F_output(C);
 
 FrontValue       = ENS_SS(S);  
 
 DistanceValue    = F_distance(S,FrontValue); 
 
 [~,M ] = sort(DistanceValue','descend');
 
 K = S(M(1:500),:);
 
 V1 = zeros(1,30);
 V2 = zeros(1,30);
 V3 = zeros(1,30);
 V4 = zeros(1,30);


 for i = 1:30
 
 eval(['load D:\DeltaCal\NSGAIII-ENSD\NSGAIII-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

  V1(i) = Spread(FunctionValue,K);

 end

 for i = 1:30
 
 eval(['load D:\DeltaCal\NSGAIII-ANSD\NSGAIII-ANSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

V2(i) = Spread(FunctionValue,K);

 end

 
 for i = 1:30
 
 eval(['load D:\DeltaCal\NSGAIII-SR9D\NSGAIII-SR9D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

  V3(i) = Spread(FunctionValue,K);

 end
 
 for i = 1:30
 
 eval(['load D:\DeltaCal\NSGAIII-SR11D\NSGAIII-SR11D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

  V4(i) = Spread(FunctionValue,K);

 end
 
 
  
   Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4)];

      disp(Result{p})
       
     clear C;


end

end