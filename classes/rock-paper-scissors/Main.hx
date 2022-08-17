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

        var playerMove = Sys.stdin().readLine();
        var computerMove = this.randStrMove();

        trace("You chose: " + playerMove);
        trace("Computer chose: " + computerMove);
        this.play(playerMove, computerMove);
    }

    public function evalMove(move: String): Move {
        if (!this.moves.exists(move)) {
            return Move.INVALID;
        }

        return this.moves.get(move);
    }

    public function evalResult(move1: Move, move2: Move): Result {
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
        var rand = Math.floor(Math.random() * 3) + 1;
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

    public function play(first: String, second: String): Void {
        var move1 = this.evalMove(first);
        var move2 = this.evalMove(second);
        var result = this.evalResult(move1, move2);

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