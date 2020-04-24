getchildren(Maze, Position, Diamonds, G, Open, Visited, Children):-
	findall(X, moves(Maze, Position, Diamonds, G, Open, Visited, X), Children).

moves(Curr_Maze, Position, Diamonds, G, Open, Visited, [New_Maze, New_Position, New_Diamonds, New_G, H, F]):-
	move([Position, Diamonds, Curr_Maze], [New_Position, New_Diamonds, New_Maze]),
	\+ member([_, New_Position, _, _, _, _], Open),
	\+ member([_, New_Position, _, _, _, _], Visited),
	heuristicFunction(New_Maze, H),
	New_G is G + 1,
	F is H + G.


% This predicate calculates H(n) by counting the number of Diamonds (2s) in the given maze. 
heuristicFunction(Maze, Diamonds):-
	count_diamonds(Maze, 0, Diamonds).

% This predicate counts the number of diamonds left.
count_diamonds([], Diamonds, Diamonds).

count_diamonds([[]|T], Counter, Diamonds):-
	count_diamonds(T, Counter, Diamonds).

count_diamonds([[H|T1]|T2], Counter, Diamonds):-
	(H = 2 -> Counter1 is Counter + 1 ;
			  Counter1 is Counter),
	count_diamonds([T1|T2], Counter1, Diamonds).



% All the possible moves
% Move Right
move([[X, Y], Diamonds, Curr_Maze], [[X, New_Y], New_Diamonds, New_Maze]):-
	dim(_, W),
	Width is W - 1,
	Y < Width,
	New_Y is Y + 1,
	nth0(X, Curr_Maze, Row), 
	nth0(New_Y, Row, Val),
	Val \= 1,
	(Val = 0 -> New_Diamonds is Diamonds ;
			    New_Diamonds is Diamonds + 1),
	replace(Curr_Maze, X, New_Y, New_Maze).

% Move Left
move([[X, Y], Diamonds, Curr_Maze], [[X, New_Y], New_Diamonds, New_Maze]):-
	Y > 0,
	New_Y is Y - 1,
	nth0(X, Curr_Maze, Row), 
	nth0(New_Y, Row, Val),
	Val \= 1,
	(Val = 0 -> New_Diamonds is Diamonds ;
			    New_Diamonds is Diamonds + 1),
	replace(Curr_Maze, X, New_Y, New_Maze).

% Move Down
move([[X, Y], Diamonds, Curr_Maze], [[New_X, Y], New_Diamonds, New_Maze]):-
	dim(L, _),
	Length is L - 1,
	X < Length,
	New_X is X + 1,
	nth0(New_X, Curr_Maze, Row), 
	nth0(Y, Row, Val),
	Val \= 1,
	(Val = 0 -> New_Diamonds is Diamonds ;
			    New_Diamonds is Diamonds + 1),
	replace(Curr_Maze, New_X, Y, New_Maze).

% Move Up
move([[X, Y], Diamonds, Curr_Maze], [[New_X, Y], New_Diamonds, New_Maze]):-
	X > 0,
	New_X is X - 1,
	nth0(New_X, Curr_Maze, Row), 
	nth0(Y, Row, Val),
	Val \= 1,
	(Val = 0 -> New_Diamonds is Diamonds ;
			    New_Diamonds is Diamonds + 1),
	replace(Curr_Maze, New_X, Y, New_Maze).

% This predicates replaces the cell's value of the given row and column in the given maze with 'X'
replace([H|T], 0, Column, [R|T]):-
     replace_column(H, Column, 'X', R).  

replace([H|T1], Row, Column, [H|T2]):- 
     Row > 0 ,                              
     Row1 is Row-1 ,                       
     replace(T1 , Row1, Column, T2).         

replace_column([_|T] , 0, Val, [Val|T]).  
replace_column([H|T1], Column, Val, [H|T2]) :- 
     Column > 0,                                
     Column1 is Column-1,                                
     replace_column(T1 , Column1, Val, T2).

