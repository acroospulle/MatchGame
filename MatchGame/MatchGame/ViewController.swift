//
//  ViewController.swift
//  MatchGame
//
//  Created by Ashni Croospulle on 1/25/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    let model = CardModel()
    var cardsArray = [Card]()
    
    var time: Timer?
    
    var firstFlippedCardIndex:IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cardsArray = model.getCards()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }

    //MARK: - Collection View Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cardsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
       
    
            return cell
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let cardCell = cell as? CardCollectionViewCell
        
        let card = cardsArray[indexPath.row]
        
        cardCell?.configureCell(card: card)
    }
    
    
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        if cell?.card?.isFlipped == false && cell?.card?.isMatched == false  {
            
            cell?.flipUp()
            
            if firstFlippedCardIndex == nil {
                
                firstFlippedCardIndex = indexPath
            }
            
            
            else {
                
                
                
                checkForMatch(indexPath)
                
            }
        }
        
      
       
        
    }
    
    //MARK: - Game Logic Methods
    
    func checkForMatch(_ secondFlippedCardIndex: IndexPath) {
        
        let cardOne = cardsArray[firstFlippedCardIndex!.row]
        let cardTwo = cardsArray[secondFlippedCardIndex.row]
        
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
                                         
        if cardOne.imageName == cardTwo.imageName {
            
            
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
        }
        else {
            
            cardOneCell?.flipDown()
            cardTwoCell?.flipDown()
            
        }
        firstFlippedCardIndex = nil
    }
    
}

