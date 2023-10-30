//
//  EggCollectView.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/17/22.
//

import SwiftUI

struct EggCollectView: View {
    var pageIndex : Int
    var penIndex : Int
    var animal : Animal
    @State private var minigame  : TreeHarvestGame = TreeHarvestGame.start
    @EnvironmentObject var farmManager : FarmManager
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            ZStack{
                
                //Nest and Basket
                VStack{
                    //nest
                    Image("nestsNoBasket")
                    
                    //Basket
                    CollectingBin(binPosition: minigame.basket.position)
                        //.position(x: minigame.basket.position.x, y: minigame.basket.position.y)
                }
                
                //Fruit - Four fruit
                ForEach(0..<minigame.fruit.count, id:  \.self){ index in
                    FruitPiece(plantName: animal.name, fruit: $minigame.fruit[index])
                }
            }
            
            //Button
            Button {
                farmManager.sellItem(price: farmManager.landzones[pageIndex].pens[penIndex].animal!.sellPrice)
                farmManager.interactAnimal(pageIndex: pageIndex, penIndex: penIndex, animal: animal)
                farmManager.penScales[penIndex + (pageIndex * 3)] = CGSize(width: 1, height: 1)
                dismiss()
            } label: {
                Text("Finsished?")
            }.disabled(farmManager.treeMinigame(basketLocation: minigame.basket.position, fruits: minigame.fruit))

        }.background(
            Image("farmBackground").clipped()
        )
    }
}

//struct EggCollectView_Previews: PreviewProvider {
//    static var previews: some View {
//        EggCollectView()
//    }
//}
