import 'dart:io';

/// Runs the Rock, Paper, Scissors game
void main() {
  print('===== ROCK, PAPER, SCISSORS =====');

  String playerOne = getPlayerName(1);
  String playerTwo = getPlayerName(2);

  int playerOneScore = 0;
  int playerTwoScore = 0;
  int roundNumber = 1;

  bool playAgain;

  do {
    print('\n--- Round $roundNumber ---');

    // Player 1 enters a move.
    String playerOneMove = getMove(playerOne);

    // Print about 30 blank lines to hide Player 1's move.
    for (int i = 0; i < 30; i++) {
      print('');
    }

    // Player 2 enters a move.
    String playerTwoMove = getMove(playerTwo);

    // Decide the winner of the round.
    String? winner = decideWinner(playerOneMove, playerTwoMove);

    print('\n$playerOne chose $playerOneMove. '
        '$playerTwo chose $playerTwoMove.');

    if (winner == 'Player 1') {
      playerOneScore++;
      print('Result: $playerOne wins the round!');
    } else if (winner == 'Player 2') {
      playerTwoScore++;
      print('Result: $playerTwo wins the round!');
    } else {
      print('Result: ${winner ?? "It\'s a draw!"}');
    }

    print(
      'Score -> $playerOne: $playerOneScore | $playerTwo: $playerTwoScore',
    );

    // Ask if the players want to play another round.
    while (true) {
      stdout.write('Play again? (y/n): ');

      String? answer = stdin.readLineSync();

      answer = answer?.trim().toLowerCase();

      if (answer == 'y') {
        playAgain = true;
        break;
      } else if (answer == 'n') {
        playAgain = false;
        break;
      } else {
        print('Invalid input. Please type y or n.');
      }
    }

    roundNumber++;
  } while (playAgain);

  print('\n===== FINAL SCORE =====');
  print('$playerOne: $playerOneScore | $playerTwo: $playerTwoScore');

  if (playerOneScore > playerTwoScore) {
    print('Overall winner: $playerOne');
  } else if (playerTwoScore > playerOneScore) {
    print('Overall winner: $playerTwo');
  } else {
    print('Overall winner: It\'s a draw!');
  }
}

/// Gets a player's name and uses a default name if the input is empty or null.
String getPlayerName(int playerNumber) {
  stdout.write('Enter Player $playerNumber name: ');

  String? input = stdin.readLineSync();

  String defaultName = 'Player $playerNumber';

  String playerName = input?.trim() ?? '';

  if (playerName.isEmpty) {
    print('(No name entered. Using "$defaultName".)');
    return defaultName;
  }

  return playerName;
}

/// Get's a player's move and keep asking until a valid move is entered
String getMove(String playerName) {
  while (true) {
    stdout.write(
      '$playerName, enter your move (rock/paper/scissors): ';
    );

    String? input = stdin.readLineSync();

    String? validMove = validateMove(input);

    if (validMove != null) {
      return validMove;
    }

    print('Invalid move. Please type rock, paper, or scissors.');

  }
}

/// Checks whether a move is valid and returns it in lowercasee.
String? validateMove(String? input) {
  List<String> validMoves = [
    'rock',
    'paper'
    'scissors'
  ];
}
