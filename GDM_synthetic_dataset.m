clear
close all
clc

tic;

count = 1;

%% Data definition

D_by_C_by_A = {{[3,4,5],[1,2,3,4],[4],[3,4,5],[1,2];
    [2],[3],[4,5],[2,3,4],[2];
    [1,2,3],[4,5],[5],[1],[1,2];
    [2,3,4,5],[4,5],[1,2,3],[3],[4]},
    
    {[4],[1,2,3],[4,5],[1,2],[4];
    [4,5],[2,3,4,5],[1,2,3],[2],[4];
    [3],[2,3],[3],[1,2],[4,5];
    [2],[3],[1,2],[4,5],[5]},
    
    {[1,2],[3],[4,5],[1,2,3],[2];
    [3,4,5],[4,5],[4],[3],[4,5];
    [2],[3,4,5],[2,3,4,5],[1],[4];
    [4],[1,2],[4,5],[1,2],[1]},
    
    {[5],[4,5],[1,2],[3],[4];
    [2,3],[3],[1],[4,5],[5];
    [1,2],[4,5],[3],[3],[1,2];
    [3],[3,4],[1,2,3],[2],[3]}};

D_by_C_by_A_env = {};

D_w = [0.25 0.40 0.15 0.20];

LT_IT2MF = [0 0 0.0833 0.3333 0 0 0.0833 0.1667 0.8;
    0 0.1667 0.3333 0.5832 0.0833 0.1667 0.3333 0.4166 0.8;
    0.1667 0.4166 0.5832 0.8331 0.3333 0.4166 0.5832 0.6665 0.8;
    0.4166 0.6665 0.8331 1 0.5832 0.6665 0.8331 0.9146 0.8;
    0.6665 0.9146 1 1 0.8331 0.9146 1 1 0.8];

LT_xUMF = LT_IT2MF(1:size(LT_IT2MF,1),1:4);
LT_xLMF = LT_IT2MF(1:size(LT_IT2MF,1),5:8);

LT_w_IT2MF = [0 0 0 0.3333 0 0 0 0.1667 1;
    0 0.25 0.25 0.5832 0.0833 0.25 0.25 0.4166 1;
    0.1667 0.5 0.5 0.8331 0.3333 0.5 0.5 0.6665 1;
    0.4166 0.75 0.75 1 0.5832 0.75 0.75 0.9146 1;
    0.6665 1 1 1 0.8331 1 1 1 1];

LT_w_xUMF = LT_w_IT2MF(1:size(LT_w_IT2MF,1),1:4);
LT_w_xLMF = LT_w_IT2MF(1:size(LT_w_IT2MF,1),5:8);

criteria_weights = [ 0 0 0.0833 0.4166 0 0 0.0833 0.25 0.9;
    0 0.25 0.4166 0.75 0.0833 0.25 0.4166 0.5832 0.9;
    0.25 0.5832 0.75 1 0.4166 0.5832 0.75 0.9146 0.9;
    0.5832 0.9146 1 1 0.75 0.9146 1 1 0.9];

criteria_weights_xUMF = criteria_weights(1:size(criteria_weights,1),1:4);
criteria_weights_xLMF = criteria_weights(1:size(criteria_weights,1),5:8);

figure
subplot(3,1,1);

for i = 1:size(LT_IT2MF,1)
    plotIT2(LT_xUMF(i,:),[0 1 1 0],LT_xLMF(i,:),[0 0.8 0.8 0],[0:1]);
    hold on;
end

subplot(3,1,2);

for i = 1:size(LT_w_IT2MF,1)
    plotIT2(LT_w_xUMF(i,:),[0 1 1 0],LT_w_xLMF(i,:),[0 1 1 0],[0:1]);
    hold on;
end

subplot(3,1,3);

for i = 1:size(criteria_weights,1)
    plotIT2(criteria_weights_xUMF(i,:),[0 1 1 0],criteria_weights_xLMF(i,:),[0 0.9 0.9 0],[0:1]);
    hold on;
end

%% Aggregation to get envelopes

[p,~] = size(D_by_C_by_A);
[m,n] = size(D_by_C_by_A{1});
Y = [];
count = 1;

figure;

for i = 1:p % iterate through decision makers
    for j = 1:m
        for k = 1:n % iterate through every feedback ***** O^3 *****
            if(i == 1)
                subplot(m,n,count);
                X = (LT_IT2MF(D_by_C_by_A{i,1}{j,k},:));
                for o = 1:size(X,1)
                    plotIT2(X(o,:),[0:1]);
                    hold on;
                end
            end
            count = count + 1;
        end
    end
    count = 1;
end

count = 1;

figure;

for i = 1:p % iterate through decision makers
    for j = 1:m
        for k = 1:n % iterate through every feedback ***** O^3 *****
            if(length((D_by_C_by_A{i,1}{j,k})) == 1)
                D_by_C_by_A_env{i,1}{j,k} = LT_IT2MF(D_by_C_by_A{i,1}{j,k},:);
            else
%                 [Y,~,~,~,~] = IT2_OWA(LT_IT2MF(D_by_C_by_A{i,1}{j,k},:),LT_w_IT2MF(D_by_C_by_A{i,1}{j,k},:));
                [Y,~,~,~,~] = LWA(LT_IT2MF(D_by_C_by_A{i,1}{j,k},:),LT_w_IT2MF(D_by_C_by_A{i,1}{j,k},:));
                D_by_C_by_A_env{i,1}{j,k} = Y;
                Y = [];
            end
            if(i == 1)
                subplot(m,n,count);
                plotIT2(D_by_C_by_A_env{i,1}{j,k},[0:1]);
            end
            count = count + 1;
        end
    end
    count = 1;
end

%% Aggregation to get rankings for alternatives

A_agg = {};
D_agg = {};
X = [];

for i = 1:p % iterate through decision makers
    for k = 1:n
        for j = 1:m % iterate through every feedback ***** O^3 *****
            X = [X;D_by_C_by_A_env{i,1}{j,k}];
        end
%         [Y,~,~,~,~] = IT2_OWA(X,criteria_weights);
        [Y,~,~,~,~] = LWA(X,criteria_weights);
        A_agg{end+1} = Y;
        X = [];
    end
    D_agg{end+1} = A_agg;
    A_agg = {};
end

% figure;
% for i = 1:p
%     for k = 1:n
%         plotIT2(D_agg{i}{k}(1,1:4),[0 1 1 0],D_agg{i}{k}(1,5:8),[0 D_agg{i}{k}(1,9) D_agg{i}{k}(1,9) 0]) ;
%     hold on;
%     end
% end

%% Rank the alternatives

Ranked_indices = [];
temp = [];

for i = 1:p
    for k = 1:n
        temp = [temp; D_agg{i}{k}];
    end
    Ranked_indices = [Ranked_indices;centroidRank(temp)];
    temp = [];
end

%% Get overall ranking

Final_Ranking = overall_ranking(Ranked_indices,D_w)

toc
