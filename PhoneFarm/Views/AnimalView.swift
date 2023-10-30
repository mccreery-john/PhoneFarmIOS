//
//  AnimalView.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/17/22.
//

import SwiftUI

struct AnimalView: View {
    var pageIndex : Int
    var penIndex : Int
    @EnvironmentObject var farmManager : FarmManager
    @Environment(\.scenePhase) var scenePhase
    let animation = Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true)
    @State var scale = CGSize(width: 1, height: 1)
    
    var body: some View {
        //Temporary animal indication
        if farmManager.landzones[pageIndex].pens[penIndex].animal != nil{
            if farmManager.settings.lazyMode {
                Button {
                    if (farmManager.landzones[pageIndex].pens[penIndex].animal!.currentStage < farmManager.landzones[pageIndex].pens[penIndex].animal!.finishStage){
                        //Still at least one more stage
                        farmManager.interactAnimal(pageIndex: pageIndex, penIndex: penIndex, animal: farmManager.landzones[pageIndex].pens[penIndex].animal!)
                    }else {
                        //Ready to be harvested
                        farmManager.sellItem(price: farmManager.landzones[pageIndex].pens[penIndex].animal!.sellPrice)
                        farmManager.landzones[pageIndex].pens[penIndex].animal!.currentStage = 1
                        farmManager.interactAnimal(pageIndex: pageIndex, penIndex: penIndex, animal: farmManager.landzones[pageIndex].pens[penIndex].animal!)
                    }
                    farmManager.penScales[penIndex + (pageIndex * 3)] = CGSize(width: 1, height: 1)
                    scale = CGSize(width: 1, height: 1)
                    
                } label:
                {
                    if (farmManager.checkAnimalTime(pageIndex: pageIndex, penIndex: penIndex)){
                        Image(farmManager.landzones[pageIndex].pens[penIndex].animal!.name)
                            .resizable()
                            .frame(width: 125, height: 125)
                    }else {
                        Image(farmManager.landzones[pageIndex].pens[penIndex].animal!.name)
                            .resizable()
                            .frame(width: 125, height: 125)
                            .scaleEffect(scale)//farmManager.penScales[penIndex + (pageIndex * 3)])
                            .animation(animation, value: scale)//farmManager.penScales[penIndex + (pageIndex * 3)])
                            .onAppear{
                                farmManager.penScales[penIndex + (pageIndex * 3)] = CGSize(width: 0.5, height: 0.5)
                                scale = CGSize(width: 0.5, height: 0.5)
                            }

                        //TODO: Want animation here to signal that it is ready for next action
                    }
                }.disabled(farmManager.checkAnimalTime(pageIndex: pageIndex, penIndex: penIndex))
                    .contextMenu(){
                        Text("Do you want to sell this animal?")
                        Button {
                            farmManager.sellAnimal(pageIndex: pageIndex, penIndex: penIndex, animal: farmManager.landzones[pageIndex].pens[penIndex].animal!)
                        } label: {
                            Text("Yes")
                        }
                        Button {
                            
                        } label: {
                            Text("No")
                        }
                        
                        
                    }
                
            }
            else {
                NavigationLink {
                    if (farmManager.checkAnimalTime(pageIndex: pageIndex, penIndex: penIndex))
                    {
                    }else {
                        if farmManager.landzones[pageIndex].pens[penIndex].animal!.currentStage == 2
                        {
                            FeedView(pageIndex: pageIndex, penIndex: penIndex, animal: farmManager.landzones[pageIndex].pens[penIndex].animal!)
                        }else {
                            switch farmManager.landzones[pageIndex].pens[penIndex].animal!.type {
                            case animalType.collect:
                                EggCollectView(pageIndex: pageIndex, penIndex: penIndex, animal: farmManager.landzones[pageIndex].pens[penIndex].animal!)
                            case animalType.milk:
                                MilkingView(pageIndex: pageIndex, penIndex: penIndex, animal: farmManager.landzones[pageIndex].pens[penIndex].animal!)
                            case animalType.shear:
                                ShearingView(pageIndex: pageIndex, penIndex: penIndex, animal: farmManager.landzones[pageIndex].pens[penIndex].animal!)
                                
                            }
                        }
                    }
                } label:
                {
                    
                    if (farmManager.checkAnimalTime(pageIndex: pageIndex, penIndex: penIndex)){
                        Image(farmManager.landzones[pageIndex].pens[penIndex].animal!.name)
                            .resizable()
                            .frame(width: 125, height: 125)
                    }else {
                        Image(farmManager.landzones[pageIndex].pens[penIndex].animal!.name)
                            .resizable()
                            .frame(width: 125, height: 125)
                            .scaleEffect(scale)//farmManager.penScales[penIndex + (pageIndex * 3)])
                            .animation(animation, value: scale)//farmManager.penScales[penIndex + (pageIndex * 3)])
                            .onAppear{
                                //farmManager.penScales[penIndex + (pageIndex * 3)] = CGSize(width: 0.5, height: 0.5)
                                scale = CGSize(width: 0.5, height: 0.5)
                            }

                        //TODO: Want animation here to signal that it is ready for next action
                    }
                }
                .contextMenu()
                {
                    Text("Do you want to sell this animal?")
                    Button {
                        farmManager.sellAnimal(pageIndex: pageIndex, penIndex: penIndex, animal: farmManager.landzones[pageIndex].pens[penIndex].animal!)
                    } label: {
                        Text("Yes")
                    }
                    Button {
                        
                    } label: {
                        Text("No")
                    }
                    
                }
            }
        }
        
    }
}

//struct AnimalView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimalView()
//    }
//}
