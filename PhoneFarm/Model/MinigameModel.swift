//
//  MinigameModel.swift
//  PhoneFarm
//
//  Created by John McCreery on 12/10/22.
//

import Foundation



struct Position : Equatable{
    var x : Double
    var y : Double
}


//Tree Harvest minigame
struct Fruit {
    var position : Position
    
    mutating func moveBy(width: Double, height: Double){
        position.x = position.x + width
        position.y = position.y + (height)
    }
    
    static let start1 = Fruit(position: Position(x: 0, y: 0))  //Fix me
    static let start2 = Fruit(position: Position(x: 0, y: 0))  //Fix me
    static let start3 = Fruit(position: Position(x: 0, y: 0))  //Fix me
    static let start4 = Fruit(position: Position(x: 0, y: 0))  //Fix me
}

struct Basket {
    var position : Position
    
    static let start = Basket(position: Position(x: 248, y: 600))  //Fix me
}

struct TreeHarvestGame {
    var fruit : [Fruit]
    var basket : Basket
    
    static let start = TreeHarvestGame(fruit: [Fruit.start1, Fruit.start2, Fruit.start3, Fruit.start4], basket: Basket.start)
    
    
}












