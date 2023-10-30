//
//  BuyMenuSections.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/18/22.
//

import SwiftUI

struct BuyMenuSections: View {
    @EnvironmentObject var farmManager : FarmManager
    var plotIndex : Int
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Section{
            ForEach(0...2, id: \.self){i in
                Button {
                    farmManager.landzones[farmManager.pageSelected].plots[plotIndex].plant = Plants[i]
                    farmManager.buyItem(price:  Plants[i].buyPrice)
                    farmManager.interactPlant(pageIndex: farmManager.pageSelected, plotIndex: plotIndex, plant: Plants[i])
                    dismiss()
                } label: {
                    BuyItemRow(name: Plants[i].name, price: Plants[i].buyPrice)
                }
                .disabled(farmManager.currentMoney < Plants[i].buyPrice)
            }
        }header: {
            Text("Quick Plants:")
        }
        
        Section{
            ForEach(0...2, id: \.self){i in
                Button {
                    farmManager.landzones[farmManager.pageSelected].plots[plotIndex].plant = Plants[i+3]
                    farmManager.buyItem(price:  Plants[i+3].buyPrice)
                    farmManager.interactPlant(pageIndex: farmManager.pageSelected, plotIndex: plotIndex, plant: Plants[i+3])
                    dismiss()
                } label: {
                    BuyItemRow(name: Plants[i+3].name, price: Plants[i+3].buyPrice)
                }
                .disabled(farmManager.currentMoney < Plants[i+3].buyPrice)
            }
        }header: {
            Text("Slow Plants:")
        }
        
        Section{
            ForEach(0...2, id: \.self){i in
                Button {
                    farmManager.landzones[farmManager.pageSelected].plots[plotIndex].plant = Plants[i+6]
                    farmManager.buyItem(price:  Plants[i+6].buyPrice)
                    farmManager.interactPlant(pageIndex: farmManager.pageSelected, plotIndex: plotIndex, plant: Plants[i+6])
                    dismiss()
                } label: {
                    BuyItemRow(name: Plants[i+6].name, price: Plants[i+6].buyPrice)
                }
                .disabled(farmManager.currentMoney < Plants[i+6].buyPrice)
            }
        }header: {
            Text("Very Slow Plants:")
        }
    }
}

//struct BuyMenuSections_Previews: PreviewProvider {
//    static var previews: some View {
//        BuyMenuSections()
//    }
//}
