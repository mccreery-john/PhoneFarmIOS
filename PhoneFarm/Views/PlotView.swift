//
//  PlotView.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/15/22.
//

import SwiftUI

struct PlotView: View {
    @EnvironmentObject var farmManager : FarmManager
    var plotIndex : Int
    var body: some View {
        ZStack{
            
            //Dirt patch
            Image("emptyPlot")
                .resizable()
                .frame(width: 125, height: 125)
            
            if (farmManager.landzones[farmManager.pageSelected].plots[plotIndex].plant != nil) //If a plot has a plant
            {
                //Visual plant indication
                PlantView(pageIndex: farmManager.pageSelected, plotIndex: plotIndex)
            }
            
            
        }
    }
}

struct PlotView_Previews: PreviewProvider {
    static var previews: some View {
        PlotView(plotIndex: 0)
    }
}
