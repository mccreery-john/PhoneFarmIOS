//
//  TreeHarvest.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/17/22.
//

import SwiftUI

struct TreeHarvest: View {
    var pageIndex : Int
    var plotIndex : Int
    var plant : Plant
    @State private var minigame  : TreeHarvestGame = TreeHarvestGame.start
    @EnvironmentObject var farmManager : FarmManager
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            ZStack{
                
                //Tree and Basket
                VStack{
                    //Background
                    Image("treeBackground")
                    
                    //Tree
                    Image("tree")
                        .clipped()
                    
                    //Basket
                    CollectingBin(binPosition: minigame.basket.position)
                        //.position(x: minigame.basket.position.x, y: minigame.basket.position.y)
                }
                
                //Fruit - Four fruit
                ForEach(0..<minigame.fruit.count, id:  \.self){ index in
                    FruitPiece(plantName: plant.name, fruit: $minigame.fruit[index])
                }
            }
            
            //Button
            Button {
                farmManager.sellItem(price: farmManager.landzones[pageIndex].plots[plotIndex].plant!.sellPrice)
                farmManager.landzones[pageIndex].plots[plotIndex].plant = nil
                farmManager.plotScales[plotIndex + (pageIndex * 13)] = CGSize(width: 2.0, height: 2.0)
                dismiss()
            } label: {
                Text("Finsished?")
            }.disabled(farmManager.treeMinigame(basketLocation: minigame.basket.position, fruits: minigame.fruit))

        }
        
    }
}

//struct TreeHarvest_Previews: PreviewProvider {
//    static var previews: some View {
//        TreeHarvest()
//    }
//}
