//
//  SurfaceBottomView.swift
//  Tank-Maintenance
//
//  Created by Kurt De Jonghe on 12/11/2021.
//

import SwiftUI

struct SurfaceBottomView: View {
    
    @State private var diameterOffBottom = ""
    @State private var surfaceBottom = ""
    @State private var error = ""
    @State private var showAlert = false
    @State private var showOutcome = false
    
    var body: some View {
        
        ZStack {
            Color(.darkGray)
                .ignoresSafeArea()
                .navigationTitle("Oppervlakte bodem")
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarHidden(false)
            
            VStack {
                
                Image(systemName: "circle")
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
                    TextField("", text: $diameterOffBottom)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numbersAndPunctuation)
                        .foregroundColor(.blue)
                        .frame(width: 80, height: 10, alignment: .center)
                        .padding()
                }.padding()
                
                Spacer()
                
                HStack(alignment: .center) {
                    Button("Bereken".uppercased()) {
                        calculateTankBottomSurface()
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
                    .alert(self.surfaceBottom.uppercased(), isPresented: $showOutcome) {}
                }
                Spacer()
            }
        }
    }
    
    // Calculate bottom surface
    private func calculateTankBottomSurface() {
        var calcRadiusBottom: Double {
            guard let m = Double(diameterOffBottom),
                  let n = Optional(2.0) else { return 0 }
            return m / n
        }
        
        var calcSurfaceBottom: Double {
            guard let m = Optional(calcRadiusBottom),
                  let n = Optional(3.14159) else { return 0 }
            return (m * m) * n
        }
        
        // Format: separate thousends
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSeparator = " "
        
        let curface = calcSurfaceBottom
        let myformattedVolume = numberFormatter.string(for: curface)
        
        self.surfaceBottom = "Oppervlakte bodem \n\(myformattedVolume!) m2"
        
        diameterOffBottom == "" ? showAlert.toggle() : showOutcome.toggle()
    }
    
}
