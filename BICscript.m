ts1=ts(1:Ntimepoints,:);
size = Nnodes;
bic1 = ones(size,size);
bic2 = ones(size,size);
bic3 = ones(size,size);
bic10 = ones(size,size);
bic20 = ones(size,size);
for n = 1:size
    for m = 1:size
        if (m~=n)
            vector1 = ts1(:,n);
            vector2 = ts1(:,m);
            bic1(n,m) = granger_cause(vector1,vector2,0.05,1);
            bic2(n,m) = granger_cause(vector1,vector2,0.05,2);
            bic3(n,m) = granger_cause(vector1,vector2,0.05,3);
            bic10(n,m) = granger_cause(vector1,vector2,0.05,10);
            bic20(n,m) = granger_cause(vector1,vector2,0.05,20);
        end
    end
end
