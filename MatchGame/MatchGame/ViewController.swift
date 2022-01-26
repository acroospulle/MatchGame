//
//  ViewController.swift
//  MatchGame
//
//  Created by Ashni Croospulle on 1/25/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    let model = CardModel()
    var cardsArray = [Card]()

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
        
        
        let card = cardsArray[indexPath.row]
        
        cell.configureCell(card: card)
    
    return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        cell?.flipUp()
        
    }
}

