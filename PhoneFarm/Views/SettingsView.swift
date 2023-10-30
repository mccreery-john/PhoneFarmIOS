//
//  SettingsView.swift
//  PhoneFarm
//
//  Created by John McCreery on 11/18/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var farmManager : FarmManager
    var body: some View {
        List{
            VStack{
                Text("Speed:")
                Picker("Choose a Speed", selection: $farmManager.settings.speed) {
                    ForEach(speedType.allCases, id: \.self){
                        Text($0.rawValue.capitalized)
                        
                    }
                }.pickerStyle(.segmented)
            }
            Spacer()
            //Lazy Mode:
            Toggle(isOn: $farmManager.settings.lazyMode) {
                Text("Lazy Mode:")
            }
            
            Spacer()
            
            //Vegan Mode:
            Toggle(isOn: $farmManager.settings.veganMode) {
                Text("Vegan Mode:")
            }
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
