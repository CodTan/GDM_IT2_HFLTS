function [F_WM] = fuzzyEntropy(HFLTS)

%% Fuzzy Entropy for IT2FS in HFLTS

% HFLTS = [3,4,5];
sum_BB = [0,0,0];
mean_ZL = [];
WM = [];

LT_IT2MF = [0 0 0.0833 0.3333 0 0 0.0833 0.1667 0.8; % VP
    0 0.1667 0.3333 0.5832 0.0833 0.1667 0.3333 0.4166 0.8; % P
    0.1667 0.4166 0.5832 0.8331 0.3333 0.4166 0.5832 0.6665 0.8; % M
    0.4166 0.6665 0.8331 1 0.5832 0.6665 0.8331 0.9146 0.8; % G
    0.6665 0.9146 1 1 0.8331 0.9146 1 1 0.8]; % VG

for i = 1:length(HFLTS)
    for j = 1:length(LT_IT2MF(HFLTS(i),:))-1
        upper_y = trapmf([0:0.05:1],[LT_IT2MF(HFLTS(i),1),LT_IT2MF(HFLTS(i),2),LT_IT2MF(HFLTS(i),3),LT_IT2MF(HFLTS(i),4)]);
        lower_y = trapmf([0:0.05:1],[LT_IT2MF(HFLTS(i),5),LT_IT2MF(HFLTS(i),6),LT_IT2MF(HFLTS(i),7),LT_IT2MF(HFLTS(i),8)]);
%         for k = 1:length(0:0.05:1) % BB
%             diff = upper_y(k) - lower_y(k);
%             sum_BB(i) = sum_BB(i) + diff;
%         end
        
%         bracket = abs(upper_y + lower_y-1); % ZL
%         mean_ZL(i) = 1 - mean(bracket);        
        
    end
    WM(i) = WM_Entropy(LT_IT2MF(HFLTS(i),:));
end

F_BB = mean(sum_BB)
F_ZL = mean(mean_ZL)
F_WM = mean(WM)

end
