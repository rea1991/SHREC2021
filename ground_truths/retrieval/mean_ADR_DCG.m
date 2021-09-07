%function [CG,DCG,NCG,NDCG,ADR] = mean_ADR_DCG(folder,matrice)
function [NCGv,NDCGv,ADR] = mean_ADR_DCG(matrice,simmClassi)

A=load(matrice);
rilevanza=load(simmClassi);

%costruisco una matrice con tutti le statistiche per ogni query e poi ne faccio la media

%[CG,DCG,NCG,NDCG,ADRv] = ADR_DCG(A,rilevanza);
[CG,DCG,NCG,NDCG,ADRv] = ADR_DCG_4levels(A,rilevanza);

CGv=sum(CG,1)/size(A,2);
DCGv=sum(DCG,1)/size(A,2);
NCGv=sum(NCG,1)/size(A,2);
NDCGv=sum(NDCG,1)/size(A,2);
%plot(CGv,DCGv)
%fprintf('NDCG=%f\n',NDCG);
ADR=sum(ADRv)/size(A,2);
fprintf('ADR=%f\n',ADR);
end


