//
//  Plants.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/13/22.
//

import Foundation

let quickPlantSell = 1.25
let quickGrow : Double = 1
let medPlantSell = 1.5
let medGrow : Double = 2
let slowPlantSell = 2.0
let slowGrow : Double = 3

let quickAnimalSell = 0.25
let medAnimalSell = 0.5
let slowAnimalSell = 0.75

let quickBuy = 10.0
let medBuy = 15.0
let slowBuy = 20.0

let buySecond = 5.0
let buyThird = 10.0

let secondGrow = 1.0 //1.5
let thirdGrow = 1.0 //2.0

let Plants =  [
    Plant(sell: quickPlantSell, buy: quickBuy, grow: quickGrow, type_: .root, name_: "Carrots"),
    Plant(sell: quickPlantSell, buy: quickBuy + buySecond, grow: quickGrow * secondGrow, type_: .root, name_: "Potatoes"),
    Plant(sell: quickPlantSell, buy: quickBuy + buyThird, grow: quickGrow * thirdGrow, type_: .vine, name_: "Cucumbers"),
    
    Plant(sell: medPlantSell, buy: medBuy, grow: medGrow, type_: .vine, name_: "Watermelons"),
    Plant(sell: medPlantSell, buy: medBuy + buySecond, grow: medGrow * secondGrow, type_: .vine, name_: "Pumpkins"),
    Plant(sell: medPlantSell, buy: medBuy + buyThird, grow: medGrow * thirdGrow, type_: .vine, name_: "Cantalopes"),
    
    Plant(sell: slowPlantSell, buy: slowBuy, grow: slowGrow, type_: .tree, name_: "Apple Tree"),
    Plant(sell: slowPlantSell, buy: slowBuy + buySecond, grow: slowGrow * secondGrow, type_: .tree, name_: "Lemon Tree"),
    Plant(sell: slowPlantSell, buy: slowBuy + buyThird, grow: slowGrow * thirdGrow, type_: .tree, name_: "Orange Tree")
]





