//
//  PlantView.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/17/22.
//

import SwiftUI

struct PlantView: View {
    var pageIndex : Int
    var plotIndex : Int
    @EnvironmentObject var farmManager : FarmManager
    
    let animation = Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true)
    @State var scale = CGSize(width: 1, height: 1)
    
    var body: some View {
        if farmManager.landzones[pageIndex].plots[plotIndex].plant != nil{
            if farmManager.settings.lazyMode == true
            {
                Button {
                    if (farmManager.landzones[pageIndex].plots[plotIndex].plant!.currentStage < farmManager.landzones[pageIndex].plots[plotIndex].plant!.finishStage){
                        //Still at least one more stage
                        farmManager.interactPlant(pageIndex: pageIndex, plotIndex: plotIndex, plant: farmManager.landzones[pageIndex].plots[plotIndex].plant!)
                    }else {
                        //Ready to be harvested
                        farmManager.sellItem(price: farmManager.landzones[pageIndex].plots[plotIndex].plant!.sellPrice)
                        farmManager.landzones[pageIndex].plots[plotIndex].plant = nil
                        
                    }
                    scale = CGSize(width: 1, height: 1)
                    farmManager.plotScales[plotIndex + (pageIndex * 13)] = CGSize(width: 1, height: 1)
                } label: {
                    if (farmManager.checkPlantTime(pageIndex: pageIndex, plotIndex: plotIndex)){
                        Image("plotPlant")
                            .resizable()
                            .frame(width: 125, height: 125)
                    }else {
                        Image("plotPlant")
                            .resizable()
                            .frame(width: 125, height: 125)
                            .scaleEffect(farmManager.plotScales[plotIndex + (pageIndex * 13)] )
                            .animation(animation, value: farmManager.plotScales[plotIndex + (pageIndex * 13)] )
                            .onAppear{
                                farmManager.plotScales[plotIndex + (pageIndex * 13)] = CGSize(width: 2, height: 2)
                            }
                        //TODO: Want animation here to singal that it is ready
                    }
                }.disabled(farmManager.checkPlantTime(pageIndex: pageIndex, plotIndex: plotIndex))
            }
            else {
                NavigationLink {
                    if (farmManager.checkPlantTime(pageIndex: pageIndex, plotIndex: plotIndex))
                    {
                    }else {
                        if farmManager.landzones[pageIndex].plots[plotIndex].plant!.currentStage == 2
                        {
                            WateringView(pageIndex: pageIndex, plotIndex: plotIndex, plant: farmManager.landzones[pageIndex].plots[plotIndex].plant!)
                        }else {
                            switch farmManager.landzones[pageIndex].plots[plotIndex].plant!.type {
                            case plantType.root:
                                RootHarvest(pageIndex: pageIndex, plotIndex: plotIndex, plant: farmManager.landzones[pageIndex].plots[plotIndex].plant!)
                            case plantType.vine:
                                VineHarvest(pageIndex: pageIndex, plotIndex: plotIndex, plant: farmManager.landzones[pageIndex].plots[plotIndex].plant!)
                            case plantType.tree:
                                TreeHarvest(pageIndex: pageIndex, plotIndex: plotIndex, plant: farmManager.landzones[pageIndex].plots[plotIndex].plant!)
                                
                            }
                        }
                    }
                } label:
                {
                    if (farmManager.checkPlantTime(pageIndex: pageIndex, plotIndex: plotIndex)){
                        Image("plotPlant")
                            .resizable()
                            .frame(width: 125, height: 125)
                    }else {
                        Image("plotPlant")
                            .resizable()
                            .frame(width: 125, height: 125)
                            .scaleEffect(scale)//farmManager.plotScales[plotIndex + (pageIndex * 13)] )
                            .animation(animation, value: scale)//farmManager.plotScales[plotIndex + (pageIndex * 13)] )
                            .onAppear{
                                //farmManager.plotScales[plotIndex + (pageIndex * 13)] = CGSize(width: 2.0, height: 2.0)
                                scale = CGSize(width: 2.0, height: 2.0)
                            }
                        //TODO: Want animation here to singal that it is ready
                    }
                }
            }
        }
    }
}

//struct PlantView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlantView()
//    }
//}
