//
//  OBU1.swift
//  TH_App13
//
//  Created by IGOR on 07/02/2025.
//

import SwiftUI

struct OBU1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 17) {
                    
                    Text("Welcome to Betano!")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                    
                    Text("Just play and earn easily!")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        OBUR()
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
    OBU1()
}
