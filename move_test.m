% This function calls error messages in the function itself as the
% test_script calls a figure 
%While move function has no error messages and error messages are coded
%in the GUI itself refer line 113 in TowerHanoiGame.mlapp
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [towerState,ret_code] =  move_test(Previous_state, Initial_Peg, Final_Peg)
    
    %Initial_Peg is From Peg
    %Final_Peg is To Peg
    
    towerState = Previous_state;
    ret_code = 0;
    
    tower = Previous_state;
    
    field_name_1 = ['Peg',num2str(Initial_Peg)];
    field_name_2 = ['Peg',num2str(Final_Peg)];
    
    if(isempty(tower.(field_name_1)))
        M = msgbox('That move is illegal!','Illegal Move');
        waitfor(M);
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
        M = msgbox('That move is illegal!','Illegal Move');
        waitfor(M);
        return;
    end
    
    
    
end