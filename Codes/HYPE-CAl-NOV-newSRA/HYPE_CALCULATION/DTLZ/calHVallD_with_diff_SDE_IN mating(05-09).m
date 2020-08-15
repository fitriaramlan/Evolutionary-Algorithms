%%%%%%%%%%%%%
for obj=[4 6 8 10]
   
objective=obj

Result=cell(7,1);

for p=1:7


run = 30; 

%-----------------------------------------------------------------------------------------     
C = [ ];



for i = 1:30
    
    eval(['load D:\OUR_CODES\ISDE indicator only\ISDE_indicator-DTLZ\ISDE-ONLY-DTLZ\DTLZ-ISDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end
for i = 1:30   
    
    eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\sde+grid-withoutparetobased\MSDE+GRID-DTLZ\2.OURalgorithm_indicator_in_Ma+ES_disprev(05-09)\mating_dis_prevGen(05-09)\DTLZ-MSDE+GRIDdiv-10','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    C = [ C ; FunctionValue ];
    
end



 S = F_output(C);
 Point  = max(S,[],1);
 
 V1 = zeros(1,30);
 V2 = zeros(1,30);
%  V3 = zeros(1,30);
%  V4 = zeros(1,30);
 %V5 = zeros(1,30);
%  V6 = zeros(1,30);
%  V7 = zeros(1,30);
%  V8 = zeros(1,30);

for i = 1:30
    
    eval(['load D:\OUR_CODES\ISDE indicator only\ISDE_indicator-DTLZ\ISDE-ONLY-DTLZ\DTLZ-ISDE','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V1(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
for i = 1:30
    
    eval(['load D:\CODES-OUR-ALGORITHMS\SPEA-2+SDE-OUR\sde+grid-withoutparetobased\MSDE+GRID-DTLZ\2.OURalgorithm_indicator_in_Ma+ES_disprev(05-09)\mating_dis_prevGen(05-09)\DTLZ-MSDE+GRIDdiv-10','_',num2str(p),'_',num2str(obj),'_',num2str(i)]);
    
    V2(i) = Hypervolume(FunctionValue,Point.*ones(1,size(FunctionValue,2)),1000);
    
end
f
%Result{p} = [mean(V1),std(V1);mean(V2),std(V2);mean(V3),std(V3);mean(V4),std(V4);mean(V5),std(V5);mean(V6),std(V6);mean(V7),std(V7);mean(V8),std(V8)];
Result{p} = [mean(V1),std(V1);mean(V2),std(V2)];
fprintf('\n');
    [~,r1] = ranksum(V1,V2);
r1
    clear C;

end

end