//
//  AnimalsDetailsVC.swift
//  InTheAnimalWorld
//
//  Created by Sergey Gaponov on 11/1/17.
//  Copyright © 2017 Sergey Gaponov. All rights reserved.
//

import UIKit

class AnimalsDetailsVC: UIViewController {

    
    @IBOutlet private weak var ibImage: UIImageView!
    @IBOutlet private weak var ibAnimalLabel: UILabel!
    @IBOutlet private weak var ibSpeciesLabel: UILabel!
    
    var tipeAnimal: String?
    var animal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = animal?.name
        
        ibImage.image = animal?.image
        ibAnimalLabel.text = animal?.name
        ibSpeciesLabel.text = tipeAnimal
    }
}
