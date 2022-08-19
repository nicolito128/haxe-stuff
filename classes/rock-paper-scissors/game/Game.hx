package game;

import sys.io.Process;
import haxe.ds.Map;
import haxe.io.StringInput;

enum Move {
    INVALID;
    Rock;
    Paper;
    Scissors;
}

enum Result {
    INVALID;
    Tie;
    Player1;
    Player2;
}

class Game {
    static var moves = [
        "rock" => Move.Rock,
        "paper" => Move.Paper,
        "scissors" => Move.Scissors
    ];

    static public function start(): Void {
        trace("Game created!");

        while (true) {
            trace("Enter a move (e.g. 'rock', 'paper', 'scissors') or write 'close':");

            var playerMoveStr = Sys.stdin().readLine();
            if (playerMoveStr == "close") {
                trace("Game closed!");
                break;
            }

            var computerMoveStr = randStrMove();

            trace("You chose: " + playerMoveStr);
            trace("Computer chose: " + computerMoveStr);
            play(parseStrToMove(playerMoveStr), parseStrToMove(computerMoveStr));
        }
    }

    static public function parseStrToMove(str: String): Move {
        if (!moves.exists(str)) {
            return Move.INVALID;
        }

        return moves.get(str);
    }

    static public function evalMoves(move1: Move, move2: Move): Result {
        if (move1 == Move.INVALID || move2 == Move.INVALID) {
            return Result.INVALID;
        }

        if (move1 == move2) {
            return Result.Tie;
        }

        if (move1 == Move.Rock) {
            if (move2 == Move.Paper) {
                return Result.Player2;
            } else {
                return Result.Player1;
            }
        }

        if (move1 == Move.Paper) {
            if (move2 == Move.Scissors) {
                return Result.Player2;
            } else {
                return Result.Player1;
            }
        }

        if (move1 == Move.Scissors) {
            if (move2 == Move.Rock) {
                return Result.Player2;
            } else {
                return Result.Player1;
            }
        }

        return Result.INVALID;
    }

    static public function randStrMove(): String {
        var rand = Math.floor(Math.random() * 3 + 1);
        var randMove: String;

        switch (rand) {
            case 1:
                randMove = "rock";
            case 2:
                randMove = "paper";
            case 3:
                randMove = "scissors";
            case _:
                randMove = "invalid";
        }

        return randMove;
    }

    static public function play(player1Move: Move, player2Move: Move): Void {
        var result = evalMoves(player1Move, player2Move);

        switch (result) {
            case Result.Tie:
                trace("Tie!");
            case Result.Player1:
                trace("You win!");
            case Result.Player2:
                trace("You lose!");
            case _:
                trace("Invalid move.");
        }
    }
}