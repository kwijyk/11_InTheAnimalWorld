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
    
    private let arrayTypeAnimals = DataManager.instance.arrayTypeAnimals

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Animals"
        
        setupTableView()
    }
    
     //MARK: - TableView configuration
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "AnimalsDetailsVC",
        let animalsDetailsVC = segue.destination as? AnimalsDetailsVC else { return }
        guard let cell = sender as? UITableViewCell else { return }
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let animalType = arrayTypeAnimals[indexPath.section]
        let animal = animalType.arrayAnimals[indexPath.row]
        
        animalsDetailsVC.tipeAnimal = animalType.type.rawValue
        animalsDetailsVC.animal = animal
    }
}

extension AnimalsListVC: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return arrayTypeAnimals.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayTypeAnimals[section].arrayAnimals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayTypeAnimals[section].type.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalIdentifier", for: indexPath) as? AnimalCell else {
            fatalError("Error: Cell has wrong type")
        }
        
        let animal = arrayTypeAnimals[indexPath.section].arrayAnimals[indexPath.row]
        
        cell.animalImage.image = animal.image
        cell.animalNameLabel.text = animal.name

        return cell
    }

}
