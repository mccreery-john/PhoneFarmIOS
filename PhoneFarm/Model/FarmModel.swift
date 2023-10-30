//
//  FarmModel.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/11/22.
//

import Foundation

struct CurState : Codable {
    var landzones : [LandPage]
    var settings : Settings
    var currentMoney : Double
    var minTime : Int
    
    init(landzones_ : [LandPage], settings_ : Settings, currentMoney_ : Double, minTime_ : Int)
    {
        landzones = landzones_
        settings = settings_
        currentMoney = currentMoney_
        minTime = minTime_
    }
}

struct Plot : Identifiable, Codable{
    let id : UUID
    var nextInteractTime : Date?
    var plant : Plant?
    
    
    init(){
        self.id = UUID()
    }
    
}

struct Pen : Identifiable, Codable{
    let id : UUID
    var animal : Animal?
    var nextInteractTime : Date?
    
    init(){
        self.id = UUID()
    }
}


struct Plant : Codable{
    let id : UUID
    let name : String
    let sellPrice : Double
    let buyPrice : Double
    let growTime : Double
    var currentStage : Int
    var type : plantType
    let finishStage : Int
    
    init(sell : Double, buy : Double, grow : Double, type_ : plantType, name_ : String){
        id = UUID()
        sellPrice = sell*(Double(buy))
        buyPrice = buy
        growTime = grow
        currentStage = 1
        type = type_
        name = name_
        finishStage = 3 //Currently all plants end at stage 3
    }
}

struct Animal : Codable{
    let id : UUID
    
    let name : String
    let sellPrice : Double
    let buyPrice : Double
    let growTime : Double
    var currentStage : Int
    var type : animalType
    let finishStage : Int
    
    init(sell : Double, buy : Double, grow : Double, type_ : animalType, name_ : String){
        id = UUID()
        sellPrice = sell*(Double(buy))
        buyPrice = buy
        growTime = grow
        currentStage = 1
        type = type_
        name = name_
        finishStage = 3
    }
}

struct LandPage : Codable {
    var plots : [Plot]
    var pens : [Pen]
    
    var isPurchased : Bool
    
    init(plots_ : [Plot], pens_ : [Pen], pur : Bool){
        plots = plots_
        pens = pens_
        isPurchased = pur
    }
}

enum animalType : Codable
{
    case collect, milk, shear
}

enum plantType : Codable
{
    case root, vine, tree
    
}
enum speedType : String, Equatable, CaseIterable, Codable{
    case quick, medium, slow
}


struct Settings : Codable{
    var speed : speedType
    var lazyMode : Bool
    var veganMode : Bool
    init(){
        speed = .quick
        lazyMode = true //TODO: Change to false once non-lazymode is implemented
        veganMode = false
    }
}


struct FileInfo {
    let name : String
    let url : URL
    let exists : Bool
    
    init(for filename:String) {
        name = filename
        let fileManager = FileManager.default
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        url =  documentURL.appendingPathComponent(filename + ".json")
        exists = fileManager.fileExists(atPath: url.path)
    }
    
    private init(name:String, url:URL, exists:Bool) {
        self.init(for:"")
    }
}
