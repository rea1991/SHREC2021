function confusion = my_confusion_matrix(predicted, actual)

confusion=zeros(max(actual));
 for i=1:max(actual)
   B=(find(actual==i))';
   l=length(B);
   for j=1:l
     el=B(j);
     confusion(i,predicted(el))=confusion(i,predicted(el))+1;
   end
end
end
