//
//  ViewController.swift
//  Concentration
//
//  Created by Egor on 28.06.2022.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = ConcentrationGame(numberOfPairsOfCards: (buttonCollection.count + 1) / 2)
    
    var touches = 0 {
        didSet{
            touchLable.text = "Touches \(touches)"
        }
    }
    
    
    var emojiCollection = ["🐵", "🐣", "🦆", "🦋", "🐸", "🐼", "🦀", "🐳", "🐩", "🦋"]
    
    var emojiDictionary = [Int:String]()
    
    
    
    func emojiIdentifire(for card: Card) -> String {
        if emojiDictionary[card.identifire] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifire] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifire] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifire(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) :  #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
            }
        }
    }
    
    

    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet var touchLable: UILabel!
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender)
        {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    


}
