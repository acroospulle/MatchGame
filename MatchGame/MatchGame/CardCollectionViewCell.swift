//
//  CardCollectionViewCell.swift
//  MatchGame
//
//  Created by Ashni Croospulle on 1/26/22.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func configureCell(card: Card) {
        
        self.card = card
        
        frontImageView.image = UIImage(named: card.imageName)
        
        if card.isFlipped == true {
            flipUp(speed: 0)
        }
        else {
            flipDown(speed: 0)
            
        }
    }
    
    
    func flipUp(speed:TimeInterval = 0.3) {
        UIView.transition(from: backImageView, to: frontImageView, duration:speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        
        card?.isFlipped = true
    }
    
    
    func flipDown(speed: TimeInterval = 0.3) {
        UIView.transition(from: frontImageView, to: backImageView, duration:speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        
        card?.isFlipped = false
    }
    
    
}
