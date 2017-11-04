//
//  AnimalType.swift
//  InTheAnimalWorld
//
//  Created by Sergey Gaponov on 11/2/17.
//  Copyright © 2017 Sergey Gaponov. All rights reserved.
//

import Foundation

enum TypeAnimals: String {
    
    case Bird = "Bird"
    case Fish = "Fish"
    case Insect = "Insect"
    case Beast = "Beast"
}

struct AnimalType {
    
    let type: TypeAnimals
    var arrayAnimals:[Animal] = []
}
