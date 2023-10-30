//
//  LandPageView.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/18/22.
//

import SwiftUI

struct LandPageView: View {
    @EnvironmentObject var farmManager : FarmManager
    var pageIndex : Int
    var body: some View {
        NavigationStack{
            VStack{
                ForEach(0...3, id:\.self ){i in
                    HStack{
                        ForEach(0...2, id: \.self){ z in
                            if farmManager.landzones[farmManager.pageSelected].plots[z + i*3].plant != nil{
                                PlotView(plotIndex: z + (i*3))
                            }else {
                                NavigationLink(destination: PlantBuyMenu(plotIndex: z + i*3), label: {
                                    PlotView(plotIndex: z + (i*3))
                                })//.disabled(farmManager.landzones[farmManager.pageSelected].plots[z + i*3].plant != nil)
                            }
                        }
                    }
                }
                
                Spacer()
                //Pens or if vegan mode is on, 3 more plots
                if (!farmManager.settings.veganMode){
                    HStack{
                        ForEach(0...2, id: \.self){x in
                            if farmManager.landzones[farmManager.pageSelected].pens[x].animal != nil{
                                PenView(penIndex: x)
                            }else {
                                NavigationLink(destination: AnimalBuyMenu(penIndex: x), label: {
                                    PenView(penIndex: x)
                                }).disabled(farmManager.landzones[farmManager.pageSelected].pens[x].animal != nil)
                            }
                        }
                    }
                }else {
                    HStack{
                        ForEach(0...2, id: \.self){ z in
                            if farmManager.landzones[farmManager.pageSelected].plots[z + 4*3].plant != nil{
                                PlotView(plotIndex: z + (4*3))
                            }else {
                                NavigationLink(destination: PlantBuyMenu(plotIndex: z + 4*3), label: {
                                    PlotView(plotIndex: z + (4*3))
                                }).disabled(farmManager.landzones[farmManager.pageSelected].plots[z + 4*3].plant != nil)
                            }
                        }
                    }
                }
                
            }
        }
    }
}

struct LandPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandPageView(pageIndex: 0)
    }
}
