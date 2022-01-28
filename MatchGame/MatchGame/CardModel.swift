//
//  CardModel.swift
//  MatchGame
//
//  Created by Ashni Croospulle on 1/26/22.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
       var generatedNumbers = [Int]()
        
        
        
        
        
        
        var generatedCards = [Card]()
        
        while generatedNumbers.count < 8 {
            let randonNumber = Int.random(in: 1...13)
            
            if generatedNumbers.contains(randonNumber) == false {
            
            
            let cardOne = Card()
            let cardTwo = Card()
            
            cardOne.imageName = "card\(randonNumber)"
            cardTwo.imageName = "card\(randonNumber)"
            
            generatedCards += [cardOne,cardTwo]
            
                
                
                generatedNumbers.append(randonNumber)
                
                
            print(randonNumber)
        }
    }
        generatedCards.shuffle()
        
        return generatedCards
        
    }
}
