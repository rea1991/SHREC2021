function [successi,classlabel]= valuta_classificazioneNN(ground,matrix)
%dato un ground truth e una matrice di similarita' calcola la classificazione via NN
 
 classi=load(strcat(ground));
 A=load(strcat(matrix));
 [~,I]=sort(A,2); %I diventa la matrice degli indici
 
 classlabel=zeros(1543,2);
 classlabel(:,1)=classi(:,1);
 for i=1:1543
   if I(i,2)~=i
      classlabel(i,2)=classi(I(i,2),2);
   else
      classlabel(i,2)=classi(I(i,1),2);
   end
 end
 correct=classlabel(:,2)-classi(:,2);
 successi=sum(correct(:)==0);
