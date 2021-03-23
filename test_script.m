% move_test here is different from the move function as error message has
% different conditions in the two functions. Refer move_test for more
% Information
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DefaultRingSize = 5;
Colors = {'b','g','r','c','m'};

tower = struct('Peg1',{{}},'Peg2',{{}},'Peg3',{{}});
N = DefaultRingSize;

for i = N:-1:1
                
    tower.Peg1{i}  = struct('Size', N-i+1, 'Color', Colors{N-i+1});

end

tower.Peg2 = {};
tower.Peg3 = {};

display_tower(tower)

pause(1.0)

[new_tower1,~] = move_test(tower,1,2);

display_tower(new_tower1)

pause(1.0)

[new_tower2,~] = move_test(new_tower1,1,3);

display_tower(new_tower2)

pause(1.0)

[new_tower3,~] = move_test(new_tower2,3,2);

display_tower(new_tower3)

