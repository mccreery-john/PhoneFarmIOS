//
//  PenView.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/17/22.
//

import SwiftUI

struct PenView: View {
    @EnvironmentObject var farmManager : FarmManager
    var penIndex: Int
    var body: some View {
        ZStack{
            //Temporary visualization of pen
            Image("emptyPen")
                .resizable()
                .frame(width: 125, height: 125)
            if (farmManager.landzones[farmManager.pageSelected].pens[penIndex].animal != nil) //If a plot has a plant
            {
                //Visual animal indication
                AnimalView(pageIndex: farmManager.pageSelected, penIndex: penIndex)
            }
            
        }
    }
}

struct PenView_Previews: PreviewProvider {
    static var previews: some View {
        PenView( penIndex: 0)
    }
}
