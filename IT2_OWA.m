function [Y,UMFYy,UMFYmu,LMFYy,LMFYmu] = IT2OWA(X,W,n)

%
% [Y, UMFYy,UMFYmu,LMFYy,LMFYmu] = IT2OWA(X,W,n)
%
% To compute the IT2 OWA [1] for IT2 FSs determined by the nine 
% parameters in Fig. 1 of Readme.doc.
%
% [1] S.-M. Zhou, F. C. R. I. John, and J. M. Garibaldi, "Type-2 OWA 
% operators -- aggregating type-2 fuzzy sets in soft decision making,"
% in Proc. FUZZ-IEEE, Hong Kong, June 2008, pp. 625--630.
%
% Dongrui WU (dongruiw@usc.edu), 11/16/2008
%
% X and W: MFs of the subcriteria and weights. They have the same number of
% rows.
% n: number of alpha-cuts. Default is 2.
%
% Y: the IT2 OWA approximated by 9 parameters.
% UMFYy and UMFYmu: y- and mu-coordinates of the UMF of the IT2 OWA
% LMFYy and LMFYmu: y- and mu-coordinates of the LMF of the IT2 OWA

% X = [0 0 1 3 0 0 1 2 0.8; 0 2 3 5 1 2 3 4 0.8; 2 4 5 5 3 4 5 5 0.8];
% 
% W = [0 0 0 0.4 0 0 0 0.2 1; 0.2 0.6 0.6 0.8 0.4 0.6 0.6 0.6 1; 0.6 1 1 1 0.8 1 1 1 1];

% n = 2;

if nargin==2 %% set default n
    n=2;
end

if size(X,2)==8
    X(:,9)=1; % set default height
end
if size(W,2)==8
    W(:,9)=1; % set default height
end

[Yu,UMFYy,UMFYmu] = T1OWA(X(:,1:4),W(:,1:4),n);
[Yl,LMFYy,LMFYmu] = T1OWA(X(:,5:9),W(:,5:9),n);
Y=[Yu(1:4) Yl];

% plotIT2(UMFYy,UMFYmu,LMFYy,LMFYmu);
% hold on