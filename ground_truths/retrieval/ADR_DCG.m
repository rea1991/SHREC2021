function [CG,DCG,NCG,NDCG,ADR] = ADR_DCG(A,rilevanza)



for i=1:size(rilevanza,1)
    v_hrel(i)=length(find(rilevanza(:,i)==2));
    v_rel(i)=length(find(rilevanza(:,i)==1));
end
 %sono i vettori che per ogni modello indicano relevant e high relevant attesi

ideal_gain=zeros(size(rilevanza));
for i=1:size(rilevanza,1)
    vec=[2*ones(1,v_hrel(i)) ones(1,v_rel(i)) zeros(1,size(rilevanza,1)-v_rel(i)-v_hrel(i))];
    ideal_gain(i,:)=vec;
end


[~,I]=sort(A,2); %I diventa la matrice degli indici

for i=1:size(rilevanza,1)
    %calcolo il gain vector delle righe
    sorted_query=I(i,:);
    gain(i,:)=zeros(1,size(I,2));
    for j=1:size(I,2)
        gain(i,j)=rilevanza(i,sorted_query(j));
    end
end
    

%inizializzo i vettori Comulated Gain vector (CG) e Discounted Comulated Gain vector (DCG) e i loro analoghi ideali
CG=zeros(size(rilevanza));
DCG=zeros(size(rilevanza));
ideal_CG=zeros(size(rilevanza));
ideal_DCG=zeros(size(rilevanza));
CG(:,1)=gain(:,1);
DCG(:,1)=gain(:,1);
ideal_CG(:,1)=ideal_gain(:,1);
ideal_DCG(:,1)=ideal_gain(:,1);

%calcolo CG e DCG e loro versioni ideali
for i=2:size(I,2)
   CG(:,i)=CG(:,i-1)+gain(:,i);
   ideal_CG(:,i)=ideal_CG(:,i-1)+ideal_gain(:,i);
   DCG(:,i)=DCG(:,i-1)+(gain(:,i)./log2(i));
   ideal_DCG(:,i)=ideal_DCG(:,i-1)+(ideal_gain(:,i)./log2(i));
end

%inizializzo e calcolo le versioni normalizzate di CG e DCG
NCG=zeros(size(rilevanza));
NDCG=zeros(size(rilevanza));
for i=1:size(I,2)
  NCG(:,i)=CG(:,i)./ideal_CG(:,i);
  NDCG(:,i)=DCG(:,i)./ideal_DCG(:,i);
end


%inizializzo il vettore ADRv che contiene le percentuali di recuperi molto o rilevanti
ADRv=zeros(size(rilevanza));

for j=1:size(rilevanza,1)
%conto il numero di recuperi altamente rilevanti nei primi elementi ma mi tengo pure traccia dei rilevanti perche' serve per il segmento successivo
foundh=0;
foundr=0;
for i=1:v_hrel(j)
  if gain(j,i)==2
     foundh=foundh+1;
  end
  if gain(j,i) >=1
     foundr=foundr+1;
  end
  ADRv(j,i)=foundh/i;
end

for i=(v_hrel(j)+1):(v_hrel(j)+v_rel(j))
  if gain(j,i) >=1
     foundr=foundr+1;
  end
  ADRv(j,i)=foundr/i;
end
end

ADR=[];
for j=1:size(rilevanza,1)
ADR(j)=(1/(v_hrel(j)+v_rel(j)))*sum(ADRv(j,:));
end
ADR=ADR';
end

