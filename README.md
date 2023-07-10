# Tic-Tac-Toe-game-flutter

## Tic-Tac-Toe with simple animation

### Complete Explanation 

The code begins by importing the necessary packages: flutter/material.dart for the Flutter UI components and animated_background/animated_background.dart for the animated background effect.

The main function is the entry point of the Flutter application. It calls the runApp function and passes an instance of the MyApp widget.

The MyApp class is a stateless widget that represents the root of the application. It returns a MaterialApp widget, which configures the basic app settings such as the title and home screen.

The TicTacToe class is a stateful widget that represents the game screen. It extends StatefulWidget and returns an instance of the _TicTacToeState class in its createState method.

The _TicTacToeState class is the state class associated with the TicTacToe widget. It manages the game logic, tracks the state of the game board, the current player, and whether the game is over or not.

The _placeMark method is called when a player taps on a grid cell. It updates the game board, checks for a win condition, and switches the turn to the next player if the game is not over.

The _checkWin method checks if the current player has won the game by examining the rows, columns, diagonal, and anti-diagonal of the game board. It also checks for a tie condition.

The _resetGame method is called when the "Reset Game" button is pressed. It resets the game board and other variables to their initial state.

The build method of _TicTacToeState builds the UI for the game screen. It uses a Scaffold widget as the main container and sets the background color to black. The app bar displays the game title.

The AnimatedBackground widget is used to add an animated background effect. It wraps the game board and applies the SpaceBehaviour to create a dynamic background.

The game board is represented by a GridView widget with 3 rows and 3 columns. Each grid cell is a MaterialButton displaying the mark ('X' or 'O') of the player who tapped the cell.

Below the game board, there is a text container that displays the current game status, such as the player's turn or the winner. It also includes a "Reset Game" button that calls the _resetGame method when pressed.

## Example Image

![Example Image](https://drive.google.com/uc?export=view&id=1PxSqhAxzOk1V8sW7KTjssgNFFA6ZhQDw)
