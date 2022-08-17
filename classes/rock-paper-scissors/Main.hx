import sys.io.Process;
import haxe.ds.Map;
import haxe.io.StringInput;

class Main {
    static public function main(): Void {
        var game = new Game();
        game.start();
    }
}

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
    var moves = [
        "rock" => Move.Rock,
        "paper" => Move.Paper,
        "scissors" => Move.Scissors
    ];

    public function new() {}

    public function start(): Void {
        trace("Game created!");
        trace("Enter a move (e.g. 'rock', 'paper', 'scissors):");

        var playerMoveStr = Sys.stdin().readLine();
        var computerMoveStr = this.randStrMove();

        trace("You chose: " + playerMoveStr);
        trace("Computer chose: " + computerMoveStr);
        this.play(this.parseStrToMove(playerMoveStr), this.parseStrToMove(computerMoveStr));
    }

    public function parseStrToMove(str: String): Move {
        if (!this.moves.exists(str)) {
            return Move.INVALID;
        }

        return this.moves.get(str);
    }

    public function evalMoves(move1: Move, move2: Move): Result {
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

    public function randStrMove(): String {
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

    public function play(player1Move: Move, player2Move: Move): Void {
        var result = this.evalMoves(player1Move, player2Move);

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