function index=centroidRank(MFs)

%
% index=centroidRank(MFs)
%
% Implement the center-of-centroid based ranking method
%
% D. Wu and J. M. Mendel, "A Comparative Study of Ranking Methods, Similarity Measures and
% Uncertainty Measures for Interval Type-2 Fuzzy Sets," Information Sciences, 179(8), pp. 1169-1192, 2009. 
%
% Dongrui WU (dongruiw@usc.edu), 4/19/2009
%
% MFs: an N*9 matrix containing the parameters of the IT2 FSs
% index: Rank of the IT2 FSs

M=size(MFs,1);
cc=zeros(1,M);
for i=1:M
    cc(i)=centroidIT2(MFs(i,:));
end
[temp,index]=sort(cc);