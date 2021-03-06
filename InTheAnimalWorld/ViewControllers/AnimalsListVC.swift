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
    
    private var dataSource:[String : [Animal]] = [:]
    private var arrayAnimals = [Animal]()
    private var arrayKeysTypesAnimal = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Animals"
        
        setupTableView()
        generateAnimals()
    }
    
     //MARK: - TableView configuration
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: - Animal

   private func generateAnimals() {
        
        arrayAnimals.append(Animal(species: AnimalType(type:"Bird"), name:"Stork", image:#imageLiteral(resourceName: "Stork")))
        arrayAnimals.append(Animal(species: AnimalType(type:"Bird"), name:"Albatross", image:#imageLiteral(resourceName: "Albatross")))
        arrayAnimals.append(Animal(species: AnimalType(type:"Bird"), name:"Kolibri", image:#imageLiteral(resourceName: "Kolibri")))
        arrayAnimals.append(Animal(species: AnimalType(type:"Bird"), name:"Parrot", image:#imageLiteral(resourceName: "Parrot")))
        arrayAnimals.append(Animal(species: AnimalType(type:"Fish"), name:"Carp", image:#imageLiteral(resourceName: "Сarp")))
        arrayAnimals.append(Animal(species: AnimalType(type:"Fish"), name:"Som", image:#imageLiteral(resourceName: "Som")))
        arrayAnimals.append(Animal(species: AnimalType(type:"Insect"), name:"Hornet", image:#imageLiteral(resourceName: "Hornet")))
        arrayAnimals.append(Animal(species: AnimalType(type:"Beast"), name:"Lion", image:#imageLiteral(resourceName: "Lion")))
        arrayAnimals.append(Animal(species: AnimalType(type:"Beast"), name:"Bear", image:#imageLiteral(resourceName: "Bear")))
        arrayAnimals.append(Animal(species: AnimalType(type:"Beast"), name:"Hare", image:#imageLiteral(resourceName: "Hare")))
        
        for animal in arrayAnimals {
            
            let typeAnimal = animal.species.type
            
            if  var arrayTempAnimals = dataSource[typeAnimal] {
                arrayTempAnimals.append(animal)
                dataSource[typeAnimal] = arrayTempAnimals
            } else {
                dataSource[typeAnimal] = [animal]
                arrayKeysTypesAnimal.append(typeAnimal)
            }
        }
        //        FIXME: NOT CORRECT ORDER
       // arrayKeysTypesAnimal = Array(dataSource.keys)
    }
    
    private func getAnimal(for indexPath: IndexPath) -> Animal? {
        
        let key = arrayKeysTypesAnimal[indexPath.section]
        let animalSection = dataSource[key]
        
        return animalSection?[indexPath.row]
    }
    
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "AnimalsDetailsVC",
        let animalsDetailsVC = segue.destination as? AnimalsDetailsVC else { return }
        guard let cell = sender as? UITableViewCell else { return }
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let animal = getAnimal(for: indexPath)
        
        animalsDetailsVC.animal = animal
    }
}

extension AnimalsListVC: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let key = arrayKeysTypesAnimal[section]
        let animalSection = dataSource[key] ?? []
        
        return animalSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayKeysTypesAnimal[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalIdentifier", for: indexPath) as? AnimalCell else {
            fatalError("Error: Cell has wrong type")
        }
        
        guard let animal = getAnimal(for: indexPath) else {
            fatalError("Error: Data source is empty")
        }
        
        cell.animalImage.image = animal.image
        cell.animalNameLabel.text = animal.name

        return cell
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: false)
    }
}
