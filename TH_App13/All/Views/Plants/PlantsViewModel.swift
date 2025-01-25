//
//  PlantsViewModel.swift
//  TH_App13
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI
import CoreData

final class PlantsViewModel: ObservableObject {
    
    @Published var taskCurPlant: String = ""
    
    @Published var addName: String = ""
    @Published var addNG: String = ""
    @Published var addNW: String = ""
    @Published var addNS: String = ""
    
    @Published var intensitives: [String] = ["1", "2", "3"]
    @Published var curIntens: Int = 1

    @Published var types: [String] = ["Low", "Medium", "High"]
    @Published var curType = "Low"

    @Published var families: [String] = ["Other", "Succulents", "Ferns", "Aroids", "Orchids", "Dracaenas & Yuccas", "Palms", "Decorative Foliage Plants", "Flowering Houseplants", "Bulbous Plants", "Carnivorous Plants", "Bonsai Trees"]
    @Published var curFamily = "Other"

    @Published var isAdd: Bool = false
    @Published var isAddTask: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDeleteTask: Bool = false
    @Published var isSettings: Bool = false

    @Published var plCat: String = ""
    @Published var plName: String = ""
    @Published var plDate: Date = Date()
    @Published var plWF: String = ""
    @Published var plWI: String = ""
    @Published var plLL: String = ""
    @Published var plRep: String = ""
    @Published var plTemp: String = ""
    @Published var plNot: String = ""

    @Published var plants: [PlantModel] = []
    @Published var selectedPlant: PlantModel?

    func addPlant() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PlantModel", into: context) as! PlantModel

        loan.plCat = plCat
        loan.plName = plName
        loan.plDate = plDate
        loan.plWF = plWF
        loan.plWI = plWI
        loan.plLL = plLL
        loan.plRep = plRep
        loan.plTemp = plTemp
        loan.plNot = plNot

        CoreDataStack.shared.saveContext()
    }

    func fetchPlants() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PlantModel>(entityName: "PlantModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.plants = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.plants = []
        }
    }
    
    @Published var taPlant: String = ""
    @Published var taTask1: String = ""
    @Published var taTask2: String = ""
    @Published var taTask3: String = ""
    @Published var taTask4: String = ""
    @Published var taTask5: String = ""
    @Published var taPlantPhoto: String = ""

    @Published var tasks: [TaskModel] = []
    @Published var selectedTask: TaskModel?

    func addTask() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TaskModel", into: context) as! TaskModel

        loan.taPlant = taPlant
        loan.taTask1 = taTask1
        loan.taTask2 = taTask2
        loan.taTask3 = taTask3
        loan.taTask4 = taTask4
        loan.taTask5 = taTask5
        loan.taPlantPhoto = taPlantPhoto

        CoreDataStack.shared.saveContext()
    }

    func fetchTasks() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TaskModel>(entityName: "TaskModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.tasks = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.tasks = []
        }
    }
}
