//
//  RestlifeBottomView.swift
//  Tank-Maintenance
//
//  Created by Kurt De Jonghe on 07/11/2021.
//

import SwiftUI

struct RestlifeBottomView: View {
    
    @State private var tankAge = ""
    @State private var nominalThikness = ""
    @State private var pittingDepth = ""
    @State private var minimumThikness = 2.5
    @State private var restleven = ""
    @State private var error = ""
    @State private var rest = ""
    @State private var showAlert = false
    @State private var showOutcome = false
    
    var body: some View {
        
        ZStack {
            Color(.darkGray)
                .ignoresSafeArea()
                .navigationTitle("Restleven bodem")
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarHidden(false)
            
            VStack {
                Spacer()
                Image(systemName: "rectangle.portrait.bottomthird.inset.filled")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
                    .padding(.bottom, 30)
                    .padding(.top, 60)
                
                HStack(alignment: .center) {
                    Text("Tank ouderdom")
                        .font(.body)
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 150, height: 10, alignment: .leading)
                    TextField("", text: $tankAge)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numbersAndPunctuation)
                        .foregroundColor(.blue)
                        .frame(width: 80, height: 10, alignment: .center)
                        .padding()
                }.padding()
                
                HStack(alignment: .center) {
                    Text("Nom. dikte")
                        .font(.body)
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 150, height: 10, alignment: .leading)
                    TextField("", text: $nominalThikness)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numbersAndPunctuation)
                        .foregroundColor(.blue)
                        .frame(width: 80, height: 10)
                        .padding()
                }.padding()
                
                HStack(alignment: .center) {
                    Text("Diepste pitting")
                        .font(.body)
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 150, height: 10, alignment: .leading)
                    TextField("", text: $pittingDepth)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numbersAndPunctuation)
                        .foregroundColor(.blue)
                        .frame(width: 80, height: 10)
                        .padding()
                }.padding()
                
                Spacer()
                
                HStack(alignment: .center) {
                    Button("Bereken".uppercased()) {
                        calculateTankBottomRestLife()
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
                    .alert(self.restleven.uppercased(), isPresented: $showOutcome) {}
                }
                Spacer()
            }
        }
    }
    
    // Calculation restlife bottom
    private func calculateTankBottomRestLife() {
        var restDikteBodem : Double {
            guard let m = Double(nominalThikness),
                  let n = Double(pittingDepth) else { return 0 }
            return m - n
        }
        
        var afnameSnelheid : Double {
            guard let m = Double("\(pittingDepth)"),
                  let n = Double(tankAge) else { return 0 }
            return m / n
        }
        
        var restlevensduurBodem : Double {
            guard let m = Double("\(restDikteBodem)"),
                  let n = Double("\(minimumThikness)"),
                  let o = Double("\(afnameSnelheid)") else { return 0 }
            return ((m - n) / o)
        }
        
        let rest = String(format:"%.1f", restlevensduurBodem)
        self.restleven = "Restleven bodem \n\(rest) jaar"
        
        tankAge == "" || nominalThikness == "" || pittingDepth == "" ? showAlert.toggle() : showOutcome.toggle()
        
    }
    
}
 
