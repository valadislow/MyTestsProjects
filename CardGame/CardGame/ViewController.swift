//
//  ViewController.swift
//  CardGame
//
//  Created by 1 on 3/26/22.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = ConcentrationGame(numberOfPairs: (buttonCollection.count + 1) / 2)
    
    var touches = 0{
       didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    var emojiCollection = ["🎃", "🤡", "👹", "👾", "💩", "👿", "👻", "🤖", "👽", "🤢", "🤠", "😶‍🌫️"]
    var emojiDictionary = [Int: String]()
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identiefier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identiefier] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.identiefier] ?? "?"
    }
    
    
    func updateViewFromModel(){
        for index in buttonCollection.indices{
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 0) : #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1)
            }
        }
    }
    
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.choosecard(at: buttonIndex)
            updateViewFromModel()
        }
    }
}

