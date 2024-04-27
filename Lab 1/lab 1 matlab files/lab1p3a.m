% problem a
v=[1;2;3;4;5;6;7;8;9;10];
v([end-2 : end ],:)=[v(end-2)+2 v(end-1)+2 v(end)+2]
%problem B
v=[1;2;3;4;5;6;7;8;9;10];
v(end-3 : end)=v([end end-1 end-2 end-3])
%problem C
v = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10];
v(2:2:end) = v(2:2:end) + v(1:2:end-1)
