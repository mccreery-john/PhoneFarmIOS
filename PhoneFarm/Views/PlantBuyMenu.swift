//
//  PlantBuyMenu.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/18/22.
//

import SwiftUI

struct PlantBuyMenu: View {
    @EnvironmentObject var farmManager : FarmManager
    var plotIndex : Int
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            List{
                BuyMenuSections(plotIndex: plotIndex)
            }.toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("$ \(farmManager.formatDouble(number: farmManager.currentMoney))")
                        .padding()
                        .background(.red)
                }
            }
        }
        
    }
}

//struct PlantBuyMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        PlantBuyMenu()
//    }
//}
