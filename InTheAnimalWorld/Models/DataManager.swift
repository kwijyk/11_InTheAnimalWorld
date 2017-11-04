//
//  DataSourceManager.swift
//  InTheAnimalWorld
//
//  Created by Sergey Gaponov on 11/4/17.
//  Copyright © 2017 Sergey Gaponov. All rights reserved.
//

import Foundation


final class DataManager {
    
    static let instance = DataManager()
    
    var arrayTypeAnimals:[AnimalType] = []
    
    private init() {
        
      genarateAnimalsType()
    }
    
    //    MARK: - Animals method
    
    private func genarateAnimalsType() {
        
        arrayTypeAnimals.append(AnimalType(type: TypeAnimals.Bird,
                                           arrayAnimals: [Animal(name: "Stork", image: #imageLiteral(resourceName: "Stork")),
                                                          Animal(name: "Albatross", image: #imageLiteral(resourceName: "Albatross")),
                                                          Animal(name: "Kolibri", image: #imageLiteral(resourceName: "Kolibri")),
                                                          Animal(name: "Parrot", image: #imageLiteral(resourceName: "Parrot"))]))
        
        arrayTypeAnimals.append(AnimalType(type: TypeAnimals.Fish,
                                           arrayAnimals: [Animal(name: "Carp", image: #imageLiteral(resourceName: "Сarp")),
                                                          Animal(name: "Som", image: #imageLiteral(resourceName: "Albatross")),]))
        
        arrayTypeAnimals.append(AnimalType(type: TypeAnimals.Insect,
                                           arrayAnimals: [Animal(name: "Hornet", image: #imageLiteral(resourceName: "Hornet"))]))
        
        arrayTypeAnimals.append(AnimalType(type: TypeAnimals.Beast,
                                           arrayAnimals: [Animal(name: "Bear", image: #imageLiteral(resourceName: "Bear")),
                                                          Animal(name: "Here", image: #imageLiteral(resourceName: "Hare"))]))
    }
}
