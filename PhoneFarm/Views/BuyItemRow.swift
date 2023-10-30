//
//  BuyItemRow.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/18/22.
//

import SwiftUI

struct BuyItemRow: View {
    @EnvironmentObject var farmManager : FarmManager
    var name: String
    var price : Double
    var body: some View {
        HStack{
            Text(name)
            Spacer()
            Text("$ " + farmManager.formatDouble(number: price))
        }
    }
}

struct BuyItemRow_Previews: PreviewProvider {
    static var previews: some View {
        BuyItemRow(name: "example", price: 20)
    }
}
