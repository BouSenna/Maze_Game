# Maze_Game
This is a complex branching passage through which the solver must find route. The pathways and walls in a maze are fixed.</br>
The goal is to find the path to the exit of the maze. You should choose the path through which you can collect the maximum number of diamonds.<br/><br/>


Run [MazeGame.pl](https://github.com/BouSenna/Maze_Game/blob/master/Maze.pl) by giving prolog a `maze(Gameboard, NumberOfDiamonds, Solution).` goal.</br></br>

### Example
__Goal Statement__
<pre>
maze([['X', 0, 1, 1, 1, 1, 1, 1, 1, 1],<br/>
      [ 1 , 2, 1, 1, 1, 1, 1, 1, 1, 1],<br/>
      [ 1 , 0, 1, 1, 1, 1, 1, 1, 1, 1],<br/>
      [ 1 , 2, 2, 2, 1, 1, 0, 2, 0, 1],<br/>
      [ 1 , 0, 1, 0, 1, 1, 0, 1, 0, 1],<br/>
      [ 1 , 0, 1, 0, 2, 2, 2, 1, 2, 1],<br/>
      [ 1 , 0, 1, 0, 1, 1, 1, 1, 0, 0],<br/>
      [ 1 , 0, 0, 2, 1, 1, 1, 1, 1, 1],<br/>
      [ 1 , 1, 1, 1, 1, 1, 1, 1, 1, 1]], NumOfDiamonds, Maze).<br/>
</pre>
__Expected Output__
<pre>
NumOfDiamonds = 9. <br/>
Maze = [['X','X', 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 ],<br/>
        [ 1 ,'X', 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 ],<br/>
        [ 1 ,'X', 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 ],<br/>
        [ 1 ,'X','X','X', 1 , 1 ,'X','X','X', 1 ],<br/>
        [ 1 , 0 , 1 ,'X', 1 , 1 ,'X', 1 ,'X', 1 ],<br/>
        [ 1 , 0 , 1 ,'X','X','X','X', 1 ,'X', 1 ],<br/>
        [ 1 , 0 , 1 , 0 , 1 , 1 , 1 , 1 ,'X','X'],<br/>
        [ 1 , 0 , 0 , 2 , 1 , 1 , 1 , 1 , 1 , 1 ],<br/>
        [ 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 ]].<br/>
</pre>

