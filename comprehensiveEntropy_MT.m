function [E_WM] = comprehensiveEntropy_MT(HFLTS,g,F_WM)

s = 0;

for i = 1:length(HFLTS)-1
    for j = (i+1):length(HFLTS)
        s = s + ((find(HFLTS(i)-find(HFLTS(j)))))
    end
end

deviation = (2/(length(HFLTS)*(length(HFLTS)-1)))*s;

hesitant_entropy = deviation/g; % for lambda = 1

beta = ((1/2)*(cos((pi*HFLTS(1))/g))) + (1/2); % more than

    
%% Comprehensive entropy (MORE THAN)


% E_BB = (F_BB + (beta * hesitant_entropy))/(1 + (beta * hesitant_entropy));
% 
% E_ZL = (F_ZL + (beta * hesitant_entropy))/(1 + (beta * hesitant_entropy));

E_WM = (F_WM + (beta * hesitant_entropy))/(1 + (beta * hesitant_entropy));

end