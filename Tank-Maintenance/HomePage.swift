//
//  HomePage.swift
//  Tank-Maintenance
//
//  Created by Kurt De Jonghe on 12/11/2021.
//

import SwiftUI

struct HomePage: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HomePage_View()
                    .offset(y: -40)
                
                NavigationLink(
                    destination: RestlifeBottomView(),
                    label: {
                        Text("Restleven bodem".uppercased())
                            .font(.headline)
                            .bold()
                            .frame(width: 280, height: 30)
                            .foregroundColor(.red)
                            .padding()
                            .padding(.horizontal, 10)
                            .background(
                                Capsule()
                                    .stroke(Color.gray, lineWidth: 2.0)
                            )
                    }
                ).padding()
                
                NavigationLink(
                    destination: SurfaceBottomView(),
                    label: {
                        Text("Oppervlakte bodem".uppercased())
                            .font(.headline)
                            .bold()
                            .frame(width: 280, height: 30)
                            .foregroundColor(.red)
                            .padding()
                            .padding(.horizontal, 10)
                            .background(
                                Capsule()
                                    .stroke(Color.gray, lineWidth: 2.0)
                            )
                    }
                ).padding()
                
                NavigationLink(
                    destination: TankVolumeView(),
                    label: {
                        Text("Volume tank".uppercased())
                            .font(.headline)
                            .bold()
                            .frame(width: 280, height: 30)
                            .foregroundColor(.red)
                            .padding()
                            .padding(.horizontal, 10)
                            .background(
                                Capsule()
                                    .stroke(Color.gray, lineWidth: 2.0)
                            )
                    }
                ).padding()
                Spacer()
                Text("©KDJ-Projects")
                    .font(.system(size: 12))
                    .padding(.top, 10)
                
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarHidden(true)
        }
        .accentColor(Color(.label))
    }
    
    struct HomePage_View: View {
        
        var body: some View {
            
            VStack {
                Image("tank2")
                    .resizable()
                    .scaledToFill()
                    .frame(width:350, height: 300)
                    .padding()
                
                Text("TANK MAINTENANCE")
                    .padding(.top, 10)
            }
            
        }
    }
    
    struct HomePage_Previews: PreviewProvider {
        static var previews: some View {
            HomePage()
                //.preferredColorScheme(.dark)
        }
    }
}
