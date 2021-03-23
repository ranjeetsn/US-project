%This function returns
%Inputs for Initialization : Previous_state, Initial_Peg, Final_Peg
%1)Previous_state:- Input is the current Tower struct
%2)3)Initial_Peg :- The index of the Initial peg in numeric format
%Final_Peg :- The index of the final peg in numeric format

%Outputs : towerState,ret_code
%1)towerState:- Outputs the new Tower struct, if the function returns error the
% towerState is same as the initial/Input towerState
%2)ret_code:- Returns pass(1) or fail(2) status of the code which is used
%in TowerHanoiGame.mlapp 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [towerState,ret_code] =  move(Previous_state, Initial_Peg, Final_Peg)
    
    %Initial_Peg is From Peg
    %Final_Peg is To Peg
    
    towerState = Previous_state;
    ret_code = 0;
    
    tower = Previous_state;
    
    field_name_1 = ['Peg',num2str(Initial_Peg)];
    field_name_2 = ['Peg',num2str(Final_Peg)];
    
    if(isempty(tower.(field_name_1)))
       
        return;
    end
    
%     FromPeg = tower.(field_name_1){end};
%     ToPeg   = tower.(field_name_2){end};
    
    if(isempty(tower.(field_name_2)))
        
        tower.(field_name_2){1} = tower.(field_name_1){end};
        tower.(field_name_1)(end) = [];
        towerState = tower;
        ret_code = 1;
        return;
        
    elseif( tower.(field_name_1){end}.Size < tower.(field_name_2){end}.Size)
        
        tower.(field_name_2){end+1} = tower.(field_name_1){end};
        tower.(field_name_1)(end) = [];
        towerState = tower;
        ret_code = 1;
        return;
        
    else
        
        return;
    end
    
    
    
end