//
//  ViewController.swift
//  MatchGame
//
//  Created by Ashni Croospulle on 1/25/22.
//

import UIKit

class ViewController: UIViewController {
    
    let model = CardModel()
    var cardsArray = [Card]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cardsArray = model.getCards()
    }


}

