//
//  TankVolumeView.swift
//  Tank-Maintenance
//
//  Created by Kurt De Jonghe on 13/11/2021.
//

import SwiftUI

struct TankVolumeView: View {
    
    @State private var diameterCircle = ""
    @State private var hightOffCilinder = ""
    @State private var volume = ""
    @State private var error = ""
    @State private var showAlert = false
    @State private var showOutcome = false
    
    var body: some View {
        
        ZStack {
            Color(.darkGray)
                .ignoresSafeArea()
                .navigationTitle("Volume tank")
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarHidden(false)
            
            VStack {
                
                Image(systemName: "cylinder.split.1x2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
                    .padding(.bottom, 30)
                    .padding(.top, 60)
                
                HStack(alignment: .center) {
                    Text("Diameter tank")
                        .font(.body)
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 150, height: 10, alignment: .leading)
                    TextField("", text: $diameterCircle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numbersAndPunctuation)
                        .foregroundColor(.blue)
                        .frame(width: 80, height: 10, alignment: .center)
                        .padding()
                }.padding()
                
                HStack(alignment: .center) {
                    Text("Hoogte tank")
                        .font(.body)
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 150, height: 10, alignment: .leading)
                    TextField("", text: $hightOffCilinder)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numbersAndPunctuation)
                        .foregroundColor(.blue)
                        .frame(width: 80, height: 10, alignment: .center)
                        .padding()
                }.padding()
                
                Spacer()
                
                HStack(alignment: .center) {
                    Button("Bereken".uppercased()) {
                        calculateTankVolume()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 280, height: 30)
                    .padding()
                    .background(
                        Capsule()
                            .stroke(Color.white, lineWidth: 2.0)
                    )
                    .alert("⚠️ Geef waardes in ⚠️", isPresented: $showAlert) {}
                    .alert(self.volume.uppercased(), isPresented: $showOutcome) {}
                }
                Spacer()
            }
        }
    }
    
    // Calculate tank volume
    private func calculateTankVolume() {
        var calcRadiusCircle: Double {
            guard let m = Double(diameterCircle),
                  let n = Optional(2.0) else { return 0 }
            return m / n
        }
        
        var surfaceCircle: Double {
            guard let m = Optional(calcRadiusCircle),
                  let n = Optional(3.14159) else { return 0 }
            return (m * m) * n
        }
        
        var volumeCylinder: Double {
            guard let m = Optional(surfaceCircle),
                  let n = Double(hightOffCilinder) else { return 0 }
            return m * n
        }
        
        // Format: separate thousends
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSeparator = " "
        
        let volume = volumeCylinder
        let myformattedVolume = numberFormatter.string(for: volume)
    
        self.volume = "Volume tank \n\(myformattedVolume!) m3"
        
        diameterCircle == "" || hightOffCilinder == "" ? showAlert.toggle() : showOutcome.toggle()
    }
}
