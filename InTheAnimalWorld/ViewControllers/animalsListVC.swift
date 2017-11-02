//
//  AnimalsListVC.swift
//  InTheAnimalWorld
//
//  Created by Sergey Gaponov on 11/1/17.
//  Copyright © 2017 Sergey Gaponov. All rights reserved.
//

import UIKit


class AnimalsListVC: UIViewController {

    
    @IBOutlet private weak var tableView: UITableView!
    
    private var dataSourses:[Animal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Animals"
        
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.estimatedRowHeight = 150
//        tableView.rowHeight = UITableViewAutomaticDimension
        
        generateAnimals()
    }
    
    //MARK: Animal
    
    func generateAnimals() {
        
        dataSourses.append(Animal(type: AnimalType(type:"Bird"), name:"Stork", image:#imageLiteral(resourceName: "Stork")))
        dataSourses.append(Animal(type: AnimalType(type:"Bird"), name:"Albatross", image:#imageLiteral(resourceName: "Albatross")))
        dataSourses.append(Animal(type: AnimalType(type:"Bird"), name:"Kolibri", image:#imageLiteral(resourceName: "Kolibri")))
        dataSourses.append(Animal(type: AnimalType(type:"Bird"), name:"Parrot", image:#imageLiteral(resourceName: "Parrot")))
        dataSourses.append(Animal(type: AnimalType(type:"Fish"), name:"Carp", image:#imageLiteral(resourceName: "Сarp")))
        dataSourses.append(Animal(type: AnimalType(type:"Fish"), name:"Som", image:#imageLiteral(resourceName: "Som")))
        dataSourses.append(Animal(type: AnimalType(type:"Insect"), name:"Hornet", image:#imageLiteral(resourceName: "Hornet")))
        dataSourses.append(Animal(type: AnimalType(type:"Beast"), name:"Lion", image:#imageLiteral(resourceName: "Lion")))
        dataSourses.append(Animal(type: AnimalType(type:"Beast"), name:"Bear", image:#imageLiteral(resourceName: "Bear")))
        dataSourses.append(Animal(type: AnimalType(type:"Beast"), name:"Hare", image:#imageLiteral(resourceName: "Hare")))
    }
}

extension AnimalsListVC: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalIdentifier", for: indexPath) as? AnimalCell else {
            fatalError("Error: Cell has wrong type")
        }
        
        let animal = dataSourses[indexPath.row]
        
        cell.animalImage.image = animal.image
        cell.animalNameLabel.text = animal.name

        return cell
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: false)
    }
}
