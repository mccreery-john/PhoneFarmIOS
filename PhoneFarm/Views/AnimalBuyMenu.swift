//
//  AnimalBuyMenu.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/18/22.
//

import SwiftUI

struct AnimalBuyMenu: View {
    @EnvironmentObject var farmManager : FarmManager
    var penIndex : Int
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(0...0, id: \.self){i in
                        Button {
                            farmManager.landzones[farmManager.pageSelected].pens[penIndex].animal = Animals[i]
                            farmManager.buyItem(price:  Animals[i].buyPrice)
                            farmManager.interactAnimal(pageIndex: farmManager.pageSelected, penIndex: penIndex, animal: Animals[i])
                            dismiss()
                        } label: {
                            BuyItemRow(name: Animals[i].name, price: Animals[i].buyPrice)
                        }
                        
                    }
                }header: {
                    Text("Quick Animals:")
                }
                
                Section{
                    ForEach(0...0, id: \.self){i in
                        Button {
                            farmManager.landzones[farmManager.pageSelected].pens[penIndex].animal = Animals[i+1]
                            farmManager.buyItem(price:  Animals[i+1].buyPrice)
                            farmManager.interactAnimal(pageIndex: farmManager.pageSelected, penIndex: penIndex, animal: Animals[i+1])
                            dismiss()
                        } label: {
                            BuyItemRow(name: Animals[i+1].name, price: Animals[i+1].buyPrice)
                        }
                    }
                }header: {
                    Text("Slow Animals:")
                }
                
                Section{
                    ForEach(0...0, id: \.self){i in
                        Button {
                            farmManager.landzones[farmManager.pageSelected].pens[penIndex].animal = Animals[i+2]
                            farmManager.buyItem(price:  Animals[i+2].buyPrice)
                            farmManager.interactAnimal(pageIndex: farmManager.pageSelected, penIndex: penIndex, animal: Animals[i+2])
                            dismiss()
                        } label: {
                            BuyItemRow(name: Animals[i+2].name, price: Animals[i+2].buyPrice)
                        }
                    }
                }header: {
                    Text("Very Slow Animals:")
                }
            }
        }.toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("$ \(farmManager.formatDouble(number: farmManager.currentMoney))")
                    .padding()
                    .background(.red)
            }
        }
    }
}

//struct AnimalBuyMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimalBuyMenu()
//    }
//}
