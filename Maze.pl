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
