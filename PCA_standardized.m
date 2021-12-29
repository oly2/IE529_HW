df=PCA_comp1;
% subtract off the mean for each dimension
mn=mean(df,1);
df=df-repmat(mn,M,1);

% scale by the inverse of the sample standard deviation
df=df./std(df);

[M,N]=size(df);

% construct the matrix Y
Y=df'/sqrt(M-1);

% SVD does it all
[u,s,PC]=svd(Y);

% calculate the variances
S=diag(s);
V=S.*S;

% project the original data
signals=PC'*df;

% obtain portions of variances
Por=V/sum(V);

C = s(1:4,1:4)*PC(:,1:4)'; 
figure(2);
scatter(C(1,:),C(2,:),17,'filled')
xlabel('PC1'); ylabel('PC2');