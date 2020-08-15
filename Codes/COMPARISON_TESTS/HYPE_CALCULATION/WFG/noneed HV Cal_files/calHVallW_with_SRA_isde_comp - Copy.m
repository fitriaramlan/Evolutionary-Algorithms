for obj=  [4 6 8 10]
   
Result=cell(9,1);
objective = obj
for p= 1:9

run = 30; 
%-----------------------------------------------------------------------------------------     
C = [ ];



 
 for i = 1:30
    
    eval(['load D:\OUR_CODES\ISDE_indicator_only\ISDE_indicator-WFG\ISDE-ONLY-WFG\WFG-ISDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
 end
 for i = 1:30
    
    eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\sde+grid-withoutparetobased\MSDE+GRID-WFG\with_prev_gen-DISTANCE\WFG-MSDE+GRIDdiv-10','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; F ];
    
end
 
 
 S = F_output(C); 

 V1 = zeros(1,30);
 V2 = zeros(1,30);
 %V3 = zeros(1,30);
%V4 = zeros(1,30);
%  V5 = zeros(1,30);
%  V6 = zeros(1,30);
%  V7 = zeros(1,30);
%  V8 = zeros(1,30);


  for i = 1 : 30
     
     eval(['load D:\OUR_CODES\ISDE_indicator_only\ISDE_indicator-WFG\ISDE-ONLY-WFG\WFG-ISDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V1(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
  end
 
   for i = 1 : 30
     
     eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\sde+grid-withoutparetobased\MSDE+GRID-WFG\with_prev_gen-DISTANCE\WFG-MSDE+GRIDdiv-10','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
     
     F = (F - repmat(min(S,[],1),size(F,1),1))./repmat(max(S,[],1)-min(S,[],1),size(F,1),1);
     
     V2(i) = Hypervolume(F,ones(1,size(F,2)),1000);
     
   end
   
   
 Result{p} = [mean(V1),std(V1);mean(V2),std(V2)];
  
% Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6);mean(V7),std(V7);mean(V8),std(V8)];

 disp(Result{p})
 fprintf('\n');
 

clear C;
  
end

end