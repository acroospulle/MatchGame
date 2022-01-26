//
//  CardModel.swift
//  MatchGame
//
//  Created by Ashni Croospulle on 1/26/22.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        var generatedCards = [Card]()
        
        for _ in 1...8 {
            let randonNumber = Int.random(in: 1...13)
            
            let cardOne = Card()
            let cardTwo = Card()
            
            cardOne.imageName = "card\(randonNumber)"
            cardTwo.imageName = "card\(randonNumber)"
            
            generatedCards += [cardOne,cardTwo]
            
            print(randonNumber)
        }
        
        generatedCards.shuffle()
        
        return generatedCards
        
    }
}
