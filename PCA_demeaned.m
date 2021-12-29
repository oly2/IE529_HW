df=PCA_comp1;
[M,N]=size(df);

% subtract off the mean for each dimension
mn=mean(df,1);
df=df-repmat(mn,M,1);

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

% typically we choose PCs that can explain 99% varinace, so we can
% choose 3PC in this case

C = s(1:2,1:2)*PC(:,1:2)'; 
figure(2);
scatter(C(1,:),C(2,:),17,'filled')
xlabel('PC1'); ylabel('PC2');


