//
//  AlarmView.swift
//  RelaxingNatureSounds
//
//  Created by Marko Kramar on 07/10/2020.
//  Copyright © 2020 Marko Kramar. All rights reserved.
//

import SwiftUI

struct AlarmView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var minutesUntilStop: Int
    private let possibleMinutes = [5, 10, 15, 20, 30, 45, 60, 120]
    
    var body: some View {
        VStack {
            Section {
                Text("Stop playing after")
                    .font(.title)
                Picker(selection: $minutesUntilStop, label: Text("")) {
                    ForEach(possibleMinutes, id: \.self) { minutes in
                        if minutes < 60 {
                            Text("\(minutes) minutes")
                        } else {
                            Text("\(minutes / 60) hours")
                        }
                    }
                }
                .labelsHidden()
                .pickerStyle(WheelPickerStyle())
                .frame(maxWidth: .infinity, maxHeight: 150, alignment: .bottom)
                
            }.padding(0)
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Start countdown")
                    .font(.title2)
            }
            .padding(10)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10.0)
            
            Spacer()
        }.padding(0)
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView(minutesUntilStop: .constant(5))
    }
}
