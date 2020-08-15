for obj= [ 4 6 8 10] 
      
Result=cell(2,1);

for p = 1 : 9 
objective = obj

Problem = p

run = 30; 

%-----------------------------------------------------------------------------------------     
C = [ ];

for i = 1:30
 
 eval(['load C:\Users\Vikas\Desktop\IGDcal\NSGA-IIW\NSGA-II','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; F ];

 end

 for i = 1:30
 
 eval(['load C:\Users\Vikas\Desktop\IGDcal\KnEAW\KnEA','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; F ];

 end
 
 for i = 1:30
 
 eval(['load C:\Users\Vikas\Desktop\IGDcal\KnEAmodRW\KnEAmodRW','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

 C = [ C ; F ];

 end
 
%  for i = 1:30
%  
%  eval(['load C:\Users\Vikas\Desktop\IGDcal\KnEAmodR\KnEAmod','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
% 
%  C = [ C ; FunctionValue ];
% 
%  end
 
%  for i = 1:30
%  
%  eval(['load C:\Users\Vikas\Desktop\CALHVAD\NSGA-II-S1D\NSGA-II-SR1D','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
% 
%  C = [ C ; FunctionValue ];
% 
%  end
 

 S = F_output(C);

 Point  = max(S,[],1);
 
 FrontValue       = ENS_SS(S);  
 
 DistanceValue    = F_distance(S,FrontValue); 
 
 [~,M ] = sort(DistanceValue','descend');
 
 K = S(M(1:500),:);
 
 V1 = zeros(1,30);
 V2 = zeros(1,30);
 V3 = zeros(1,30);
%  V4 = zeros(1,30);
%  V5 = zeros(1,30);


 for i = 1 : 30
      
  eval(['load C:\Users\Vikas\Desktop\IGDcal\NSGA-IIW\NSGA-II','_',num2str(p),'_',num2str(obj),'_',num2str(i)]); 
 

  
  V1(i) = IGD_Function(F,K);
    
 end
 
 for i = 1 : 30
      
  eval(['load C:\Users\Vikas\Desktop\IGDcal\KnEAW\KnEA','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);

  
  
  V2(i) = IGD_Function(F,K);
    
 end
 
  for i = 1 : 30
      
  eval(['load C:\Users\Vikas\Desktop\IGDcal\KnEAmodRW\KnEAmodRW','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);


  
  V3(i) = IGD_Function(F,K);
  
   end
  

   Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3)];

      disp(Result{p})
       
     clear C;


end

end