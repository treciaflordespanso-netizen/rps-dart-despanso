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

    // Player 1 mag enter sa iyang move
    String playerOneMove = getMove(playerOne);

    // Mag print og 30 ka empty lines para di makita ang input sa isa ka player
    for (int i = 0; i < 30; i++) {
      print('');
    }

    // Player 2 mag enter sa iyang move
    String playerTwoMove = getMove(playerTwo);

    // Decide kung kinsa ang daog sa round.
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

    // Ask kung ang players gusto pa mag dula og another round
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

/// kuhaon niya ang player name nya og wala naay naka set na name para sa ana nga player
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

/// Kuhaon ang move sa player ug mag sige og pangutana hangtod sa makahatag siya og valid nga move
String getMove(String playerName) {
  while (true) {
    stdout.write(
      '$playerName, enter your move (rock/paper/scissors): '
    );

    String? input = stdin.readLineSync();

    String? validMove = validateMove(input);

    if (validMove != null) {
      return validMove;
    }

    print('Invalid move. Please type rock, paper, or scissors.');

  }
}

/// e check niya ang move na gi pili ni player og e return niya in lowercase
String? validateMove(String? input) {
  List<String> validMoves = [
    'rock',
    'paper',
    'scissors'
  ];

  if (input == null) {
    return null;
  }
String move = input.trim().toLowerCase();

if (validMoves.contains(move)) {
  return move;
}

return null;
}

/// Mao ang mag decide sa winner base sa gi pili na move
String? decideWinner(String playerOneMove, String playerTwoMove) {
  if (playerOneMove == playerTwoMove) {
    return null;
  }

  if ((playerOneMove == 'rock' &&
          playerTwoMove == 'scissors') ||
     (playerOneMove == 'paper' &&
          playerTwoMove == 'rock') ||
     (playerOneMove == 'scissors' &&
          playerTwoMove == 'paper')) {
    return 'Player 1';
  } else {
    return 'Player 2';
  }
}
