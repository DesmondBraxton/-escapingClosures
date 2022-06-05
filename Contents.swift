import UIKit

//@escaping CLOSURES

class BlackJack {
    
    // we defined a closure called gamescore
    // takes in an argument of an intiger and doesnt return anything
    //gameScore is an @escaping closure
    // If we use closure as a variable in an object we have to mark it as escaping
    // A storage mechanism
    
    private var gameScore: (Int) -> ()
    
    //
    init(gameScore: @escaping (Int) -> ()) {
        self.gameScore = gameScore
        play()

    }
    
    func play() {
        gameScore(Int.random(in: 18...21))
    }
}
// THst the blackjack
// the results from the function will be passed on to tthe blackjack trailing closure

let blackJack = BlackJack { score in
    print("Score is \(score)")
}

// shorthand syntax

// 3 parameters two ints and one closure
func operation (_ a: Int, _ b: Int, action: (Int,Int) ->()) {
    action(a, b) //action is capturing
}

operation(5, 4) { value1, value2 in // using trailing closure syntax
    print("adding values together equals \(value1 + value2)")
}

// trailing closure syntax again
operation(10, 5) {
    print($0 * $1)
}

// CLOSURES WITH ARGUMENTS

let isEven: (Int) -> Bool = { // implicit return in closures
     $0 % 2 == 0
}

print(isEven(10)) // returns a boolen value of true

// ClOSURES AS RETURN TYPES

let add: (Int, Int) -> Int = {$0 + $1}
let subtract: (Int,Int) -> Int = {$0 - $1}

func randomOperation() -> (Int,Int) -> Int {
    let operations = [add, subtract]
    return operations.randomElement() ?? add
}

let operation = randomOperation() // operation is a closure
print(operation(5, 8))





