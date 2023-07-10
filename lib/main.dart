import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      home: TicTacToe(),
    );
  }
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> with TickerProviderStateMixin {
  List<List<String>> _board = List.generate(3, (_) => List.filled(3, ''));

  String _currentPlayer = 'X';
  bool _gameOver = false;

  void _placeMark(int row, int col) {
    if (_board[row][col] == '') {
      setState(() {
        _board[row][col] = _currentPlayer;
        _gameOver = _checkWin(row, col);
        if (!_gameOver) {
          _currentPlayer = (_currentPlayer == 'X') ? 'O' : 'X';
        }
      });
    }
  }

  bool _checkWin(int row, int col) {
    // Check row
    if (_board[row].every((mark) => mark == _currentPlayer)) return true;

    // Check column
    if (_board.every((row) => row[col] == _currentPlayer)) return true;

    // Check diagonal
    if (row == col) {
      if (_board.every((row) => row[_board.indexOf(row)] == _currentPlayer)) {
        return true;
      }
    }

    // Check anti-diagonal
    if (row + col == 2) {
      if (_board.every((row) => row[2 - _board.indexOf(row)] == _currentPlayer)) {
        return true;
      }
    }

    // Check for tie
    if (_board.every((row) => row.every((mark) => mark != ''))) {
      _currentPlayer = '';
      return true;
    }

    return false;
  }

  void _resetGame() {
    setState(() {
      _board = List.generate(3, (_) => List.filled(3, ''));
      _currentPlayer = 'X';
      _gameOver = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shadowColor: Colors.redAccent,
        elevation: 20,
        backgroundColor: Colors.red,
        title: const Text('Tic Tac Toe'),
      ),
      body: AnimatedBackground(
        behaviour: SpaceBehaviour(),
        vsync: this,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, i) {
                        int row = i ~/ 3;
                        int col = i % 3;
                        return MaterialButton(
                          onPressed: () {
                            if (!_gameOver) {
                              _placeMark(row, col);
                            }
                          },
                          color: Colors.grey[200],
                          child: Text(
                            _board[row][col],
                            style: const TextStyle(fontSize: 50.0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white10,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  (_gameOver) ? ((_currentPlayer == '') ? 'Tie!' : '$_currentPlayer Wins!') : 'Player $_currentPlayer\'s turn',
                  style: const TextStyle(fontSize: 24.0, color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                disabledForegroundColor: Colors.transparent.withOpacity(0.38),
                disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
                shadowColor: Colors.white,
              ),
              onPressed: () {
                _resetGame();
              },
              child: const Text('Reset Game'),
            ),
          ],
        ),
      ),
    );
  }
}
