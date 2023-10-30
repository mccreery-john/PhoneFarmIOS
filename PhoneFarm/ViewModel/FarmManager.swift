//
//  FarmManager.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/13/22.
//

import Foundation
//
class FarmManager: ObservableObject {
    var minTime : Int //In seconds
    var pageNum : Int
    @Published var landzones : [LandPage]
    @Published var pageSelected: Int
    //@Published var plotSelected : Int?                //Might need in future
    //@Published var penSelected : Int?                 //Might need in future
    @Published var currentMoney : Double
    @Published var currentTime = Date()
    @Published var plotScales : [CGSize] = []
    @Published var penScales : [CGSize] = []        
    var basketOffset = 50.0       //FIX ME LATER
    var plantBuyMenu : Bool = false
    var animalBuyMenu : Bool = false
    let storageManager : StorageManager<CurState>
    @Published var settings : Settings {
        didSet{
            switch self.settings.speed{
            case .quick:
                self.minTime = 10
            case .medium:
                self.minTime = 20
            case .slow:
                self.minTime = 30
            }
            if (settings.veganMode){
                //Remove pens' animals
                for i in 0...(pageNum - 1){
                    for penIndex in 0...2{
                        if ((self.landzones[i].pens[penIndex].animal) != nil){
                            //Sell any animals remaining
                            self.sellAnimal(pageIndex: i, penIndex: penIndex, animal: self.landzones[i].pens[penIndex].animal!)
                        }
                        
                    }
                }
                self.save()
            }else {
                //Remove extra plots' plants
                for i in 0...(pageNum - 1){
                    for plotIndex in 12...14{
                        self.landzones[i].plots[plotIndex].plant = nil
                    }
                }
                self.save()
            }
        }
    }
    
    
    init(){
        let filename = "state"
        storageManager = StorageManager<CurState>(name: filename)
        let state = storageManager.modelData ?? nil
        
        pageNum = 1 //FIXME: Change once pages get setup
        
        
        if (state == nil){  //If there is no persistance
            pageSelected = 0 //Always start looking at the first page
            landzones = []
            settings = Settings()
            minTime = 10
            currentMoney = 200
            self.reset()
        } else { //If there is persistance
            landzones = state!.landzones
            currentMoney = state!.currentMoney
            settings = state!.settings
            minTime = state!.minTime
            pageSelected = 0 //Always start looking at the first page
            self.resetScales()
            self.updateTime()
        }
        
        self.timerFunc() //Start the timer
    }
    
    func reset() {
        //Reset number of pages
        landzones = []
        for i in 1...pageNum{
            let plots = getEmptyPlots()
            let pens = getEmptyPens()
            let isPur : Bool
            if (i == 1){
                isPur = true
            }else {
                isPur = false
            }
            landzones.append(LandPage(plots_: plots, pens_: pens, pur: isPur))
        }
        //Reset Money to starting
        self.resetScales()
        currentMoney = 200
        self.save()
    }
    
    func buyItem(price : Double){
        self.currentMoney -= price
    }
    
    func sellItem(price : Double){
        self.currentMoney += price
    }
    
    func getEmptyPlots() -> [Plot]{
        var plots : [Plot] = []
        for _ in 0...14{
            plots.append(Plot.init())
        }
        return plots
    }
    func getEmptyPens() -> [Pen] {
        var pens : [Pen] = []
        for _ in 0...2{
            pens.append(Pen.init())
        }
        return pens
    }
    
    func interactPlant(pageIndex: Int, plotIndex: Int, plant: Plant){
        let currentTime = Date()
        var growTime = DateComponents()
        growTime.second = Int(plant.growTime * Double(self.minTime))
        self.landzones[pageIndex].plots[plotIndex].nextInteractTime = Calendar.current.date(byAdding: growTime, to: currentTime)
        self.landzones[pageIndex].plots[plotIndex].plant!.currentStage += 1
        self.save()
    }
    
    func interactAnimal(pageIndex: Int, penIndex: Int, animal: Animal){
        let currentTime = Date()
        var growTime = DateComponents()
        growTime.second = Int(animal.growTime * Double(self.minTime))
        self.landzones[pageIndex].pens[penIndex].nextInteractTime = Calendar.current.date(byAdding: growTime, to: currentTime)
        self.landzones[pageIndex].pens[penIndex].animal!.currentStage += 1
        self.save()
    }
    
    func checkPlantTime(pageIndex: Int, plotIndex: Int) -> Bool{
        return self.currentTime < self.landzones[pageIndex].plots[plotIndex].nextInteractTime!
    }
    
    func checkAnimalTime(pageIndex: Int, penIndex: Int) -> Bool{
        return self.currentTime < self.landzones[pageIndex].pens[penIndex].nextInteractTime!
    }
    
    func formatDouble(number : Double) -> String{
        return String(format: "%0.2f", number)
    }
    
    
    
    @objc func updateTime() {
        self.currentTime = Date()
    }
    
    func timerFunc() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func save() {
        let state = CurState(landzones_: landzones, settings_: settings, currentMoney_: currentMoney, minTime_: minTime)
        storageManager.save(modelData: state)
        
    }
    
    func sellAnimal(pageIndex: Int, penIndex: Int, animal: Animal) { //This is for selling an animal, usually to make room for a new animal
        self.sellItem(price: animal.buyPrice/2)
        self.landzones[pageIndex].pens[penIndex].animal = nil
    }
    
    func resetScales() {
        self.penScales = []
        self.plotScales = []
        for i in 0..<pageNum {
            for _ in landzones[i].plots{
                self.plotScales.append(CGSize(width: 1, height: 1))
            }
            for _ in landzones[i].pens{
                self.penScales.append(CGSize(width: 1, height: 1))
            }
        }
        
    }
    
    
    
    func treeMinigame(basketLocation: Position, fruits : [Fruit]) -> Bool{
        for fruit in fruits{
            if (fruit.position.x > basketLocation.y  + basketOffset || fruit.position.x < basketLocation.y  - basketOffset){
                return true
            }
            if (fruit.position.y > basketLocation.y  + basketOffset || fruit.position.y < basketLocation.y  - basketOffset){
                return true
            }
        }
        
        return false
    }
}






