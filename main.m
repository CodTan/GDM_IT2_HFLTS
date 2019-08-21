function [D_by_C_by_A_envelope] = main()

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

LT_IT2MF = [0 0 0.0833 0.3333 0 0 0.0833 0.1667 0.8; % VP
    0 0.1667 0.3333 0.5832 0.0833 0.1667 0.3333 0.4166 0.8; % P
    0.1667 0.4166 0.5832 0.8331 0.3333 0.4166 0.5832 0.6665 0.8; % M
    0.4166 0.6665 0.8331 1 0.5832 0.6665 0.8331 0.9146 0.8; % G
    0.6665 0.9146 1 1 0.8331 0.9146 1 1 0.8]; % VG

[p,~] = size(D_by_C_by_A);
[m,n] = size(D_by_C_by_A{1});

for i = 1:p % iterate through decision makers
    for j = 1:m
        for k = 1:n % iterate through every feedback ***** O^3 *****
            
           E_WM = [];
           F_WM = [];
            
           HFLTS = D_by_C_by_A{i,1}{j,k};
            
           F_WM = fuzzyEntropy(HFLTS);
           
           if(i == 1)
               if((j == 1)&&(k == 1)) || ((j == 1)&&(k == 2)) || ((j == 4)&&(k == 1)) || ((j == 3)&&(k == 5)) || ((j == 2)&&(k == 4)) %%%%%%%%% BETWEEN %%%%%%%%%
                   
                   E_WM = comprehensiveEntropy_BW(HFLTS,length(LT_IT2MF),F_WM);
                   IT2_Envelope = IT2Envelope(E_WM,i,j,k);
                   D_by_C_by_A_envelope{i,1}{j,k} = IT2_Envelope;
                   
               elseif((j == 1)&&(k == 4)) || ((j == 2)&&(k == 3)) || ((j == 3)&&(k == 2)) || ((j == 4)&&(k == 2)) %%%%%%%%% MORE THAN %%%%%%%%%
                   
                   E_WM = comprehensiveEntropy_MT(HFLTS,length(LT_IT2MF),F_WM);
                   IT2_Envelope = IT2Envelope(E_WM,i,j,k);
                   D_by_C_by_A_envelope{i,1}{j,k} = IT2_Envelope;
                   
               elseif((j == 1)&&(k == 5)) || ((j == 3)&&(k == 1)) || ((j == 4)&&(k == 3)) %%%%%%%%% LESS THAN %%%%%%%%%
                   
                   E_WM = comprehensiveEntropy_LT(HFLTS,length(LT_IT2MF),F_WM);
                   IT2_Envelope = IT2Envelope(E_WM,i,j,k);
                   D_by_C_by_A_envelope{i,1}{j,k} = IT2_Envelope;
                   
               else
                   
                   D_by_C_by_A_envelope{i,1}{j,k} = LT_IT2MF(D_by_C_by_A{i,1}{j,k},1:9); %%%%%%%%% SINGLE TERM %%%%%%%%%
                   
               end
           end
           
           if(i == 2)
               if((j == 1)&&(k == 2)) || ((j == 2)&&(k == 1)) || ((j == 3)&&(k == 2)) %%%%%%%%% BETWEEN %%%%%%%%%
                   
                   E_WM = comprehensiveEntropy_BW(HFLTS,length(LT_IT2MF),F_WM);
                   IT2_Envelope = IT2Envelope(E_WM,i,j,k);
                   D_by_C_by_A_envelope{i,1}{j,k} = IT2_Envelope;
                   
               elseif((j == 1)&&(k == 3)) || ((j == 2)&&(k == 2)) || ((j == 3)&&(k == 5)) || ((j == 4)&&(k == 4)) %%%%%%%%% MORE THAN %%%%%%%%%
                   
                   E_WM = comprehensiveEntropy_MT(HFLTS,length(LT_IT2MF),F_WM);
                   IT2_Envelope = IT2Envelope(E_WM,i,j,k);
                   D_by_C_by_A_envelope{i,1}{j,k} = IT2_Envelope;
                   
               elseif((j == 1)&&(k == 4)) || ((j == 2)&&(k == 3)) || ((j == 3)&&(k == 4)) || ((j == 4)&&(k == 3)) %%%%%%%%% LESS THAN %%%%%%%%%
                   
                   E_WM = comprehensiveEntropy_LT(HFLTS,length(LT_IT2MF),F_WM);
                   IT2_Envelope = IT2Envelope(E_WM,i,j,k);
                   D_by_C_by_A_envelope{i,1}{j,k} = IT2_Envelope;
                   
               else
                   
                   D_by_C_by_A_envelope{i,1}{j,k} = LT_IT2MF(D_by_C_by_A{i,1}{j,k},1:9); %%%%%%%%% SINGLE TERM %%%%%%%%%
                   
               end
           end
           
           if(i == 3)
               if((j == 3)&&(k == 2))%%%%%%%%% BETWEEN %%%%%%%%%
                   
                   E_WM = comprehensiveEntropy_BW(HFLTS,length(LT_IT2MF),F_WM);
                   IT2_Envelope = IT2Envelope(E_WM,i,j,k);
                   D_by_C_by_A_envelope{i,1}{j,k} = IT2_Envelope;
                   
               elseif((j == 1)&&(k == 3)) || ((j == 2)&&(k == 1)) || ((j == 2)&&(k == 2)) || ((j == 2)&&(k == 5)) || ((j == 3)&&(k == 3)) || ((j == 4)&&(k == 3)) %%%%%%%%% MORE THAN %%%%%%%%%
                   
                   E_WM = comprehensiveEntropy_MT(HFLTS,length(LT_IT2MF),F_WM);
                   IT2_Envelope = IT2Envelope(E_WM,i,j,k);
                   D_by_C_by_A_envelope{i,1}{j,k} = IT2_Envelope;
                   
               elseif((j == 1)&&(k == 1)) || ((j == 1)&&(k == 4)) || ((j == 4)&&(k == 2)) || ((j == 4)&&(k == 4)) %%%%%%%%% LESS THAN %%%%%%%%%
                   
                   E_WM = comprehensiveEntropy_LT(HFLTS,length(LT_IT2MF),F_WM);
                   IT2_Envelope = IT2Envelope(E_WM,i,j,k);
                   D_by_C_by_A_envelope{i,1}{j,k} = IT2_Envelope;
                   
               else
                   
                   D_by_C_by_A_envelope{i,1}{j,k} = LT_IT2MF(D_by_C_by_A{i,1}{j,k},1:9); %%%%%%%%% SINGLE TERM %%%%%%%%%
                   
               end
           end
           
           if(i == 4)
               if((j == 2)&&(k == 1)) || ((j == 4)&&(k == 2)) || ((j == 4)&&(k == 3)) %%%%%%%%% BETWEEN %%%%%%%%%
                   
                   E_WM = comprehensiveEntropy_BW(HFLTS,length(LT_IT2MF),F_WM);
                   IT2_Envelope = IT2Envelope(E_WM,i,j,k);
                   D_by_C_by_A_envelope{i,1}{j,k} = IT2_Envelope;
                   
               elseif((j == 1)&&(k == 2)) || ((j == 2)&&(k == 4)) || ((j == 3)&&(k == 2)) %%%%%%%%% MORE THAN %%%%%%%%%
                   
                   E_WM = comprehensiveEntropy_MT(HFLTS,length(LT_IT2MF),F_WM);
                   IT2_Envelope = IT2Envelope(E_WM,i,j,k);
                   D_by_C_by_A_envelope{i,1}{j,k} = IT2_Envelope;
                   
               elseif((j == 1)&&(k == 3)) || ((j == 3)&&(k == 1)) || ((j == 3)&&(k == 5)) %%%%%%%%% LESS THAN %%%%%%%%%
                   
                   E_WM = comprehensiveEntropy_LT(HFLTS,length(LT_IT2MF),F_WM);
                   IT2_Envelope = IT2Envelope(E_WM,i,j,k);
                   D_by_C_by_A_envelope{i,1}{j,k} = IT2_Envelope;
                   
               else
                   
                   D_by_C_by_A_envelope{i,1}{j,k} = LT_IT2MF(D_by_C_by_A{i,1}{j,k},1:9); %%%%%%%%% SINGLE TERM %%%%%%%%%
                   
               end
           end
           
                     
        end
    end
    
    count = 1;
    
%     figure;

% for i = 1:p % iterate through decision makers
%     for j = 1:m
%         for k = 1:n % iterate through every feedback ***** O^3 *****
%             if(i == 1)
%                 subplot(m,n,count);
%                 plotIT2(D_by_C_by_A_envelope{i,1}{j,k},[0:1]);
%                 hold on;
%             end
%             count = count + 1;
%         end
%     end
%     count = 1;
% end
end