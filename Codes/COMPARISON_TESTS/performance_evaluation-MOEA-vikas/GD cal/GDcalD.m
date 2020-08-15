for obj= [ 4 6 8 10] 
      
Result=cell(2,1);

for p = 1 :  7 

    objective = obj

Problem = p

run = 30; 

%-----------------------------------------------------------------------------------------     
C = [ ];

for i = 1:30
 
 eval(['load D:\GDcal\NSGA-II-ENS\NSGA-II-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; FunctionValue ];

 end

 for i = 1:30
 
 eval(['load D:\GDcal\NSGA-II-ANS\NSGA-II-ANSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; FunctionValue ];

 end

 
 for i = 1:30
 
 eval(['load D:\GDcal\NSGA-II-SR9D\NSGA-II-SR9D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; FunctionValue ];

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
 
 for i = 1:30
 
 eval(['load D:\GDcal\NSGA-II-ENS\NSGA-II-ENSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

  V1(i) = GD(FunctionValue,K);

 end

 for i = 1:30
 
 eval(['load D:\GDcal\NSGA-II-ANS\NSGA-II-ANSD','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 V2(i) = GD(FunctionValue,K);

 end

 
 for i = 1:30
 
 eval(['load D:\GDcal\NSGA-II-SR9D\NSGA-II-SR9D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 V3(i) = GD(FunctionValue,K);

 end
 
  
  
   Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3)];

      disp(Result{p})
       
     clear C;


end

end