function [Y,y,mu] = FWA(X,W,n)

%
% [Y,y,mu] = FWA(X,W,n)
%
% To compute the FWA [1] for trapezoidal T1 FSs described by five parameters
% (e,f,g,h,i) shown in Fig. 1 of Readme.doc. If an T1 FS has only four parameters,
% then its height is considered as 1.
%
% [1] Feilong Liu and J. M. Mendel, "Aggregation using the fuzzy weighted 
% average, as computed using the Karnik-{M}endel algorithms," IEEE Trans. on
%  Fuzzy Systems, vol. 12, no.1, pp. 1--12, 2008.
%
% Dongrui WU (dongruiw@usc.edu), 11/16/2008
%
% X: T1 FSs for the subcriteria
% W: T1 FSs for the weights. It must have the same number of rows as X.
% n: number of alpha-cuts. The default value is 2.
%
% Y: the FWA approximated by 5 parameters.
% y and mu: y- and mu-coordinates of the FWA.


%% check whether the size of the vectors match
if length(X)~=length(W) 
    display('Error: The sizes of the input vectors do not match. Abort.');
    return
end

if nargin==2 %% set default n
    n=2;
end

[N,M]=size(X);  %% N: number of rows
if M==4
    X(:,5)=1; % set default height
end
if size(W,2)==4
    W(:,5)=1; % set default height
end

hmin=min([X(:,5); W(:,5)]);  %% height of the FWA
mu=hmin*[0:1/(n-1):1 1:-1/(n-1):0]; %% mu-coordinates of the FWA

a=zeros(1,N);
b=zeros(1,N);
c=zeros(1,N);
d=zeros(1,N);
y=zeros(1,2*n);

for i=1:n
    %% a,b: alpha-cut on X
    for j=1:N  %% for each input, compute the alpha-cut
        %% a,b: alpha-cut on X
        a(j)=X(j,1)+(X(j,2)-X(j,1))*mu(i)/X(j,5);
        b(j)=X(j,4)-(X(j,4)-X(j,3))*mu(i)/X(j,5);
        %% c,d: alpha-cut on W
        c(j)=W(j,1)+(W(j,2)-W(j,1))*mu(i)/W(j,5);
        d(j)=W(j,4)-(W(j,4)-W(j,3))*mu(i)/W(j,5);
    end
    y(i)=EKM(a,c,d,-1);
    y(2*n+1-i)=EKM(b,c,d,1);
end

Y=[y([1 n n+1 2*n]) hmin];

