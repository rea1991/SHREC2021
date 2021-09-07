function permuteMatrix(matrix,permutation)

disp("");

A=load(matrix);
B=load(permutation);

AA=zeros(size(A));
for i=1:size(A)
    AA(i,:)=A(B(i,1),:);
end

AAA=zeros(size(A));
for i=1:size(A)
    AAA(:,i)=AA(:,B(i,1));
end

newName=strcat(matrix,'Perm.txt');
save(newName,'AAA','-ascii');
