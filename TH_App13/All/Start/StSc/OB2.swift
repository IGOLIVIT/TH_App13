//
//  OB2.swift
//  TH_App13
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI

struct OB2: View {
        
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("o2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 17) {
                    
                    Text("Organize Plant Care Tasks")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                    
                    Text("Track watering, fertilizing, and repotting schedules for each plant in one place.")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        OB3()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim2")))
                    })
                    .padding(.bottom, 35)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 240)
                .background(Rectangle().fill(.white))
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    OB2()
}
