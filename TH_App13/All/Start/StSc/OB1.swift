//
//  OB1.swift
//  TH_App13
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI

struct OB1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("o1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 17) {
                    
                    Text("Welcome to SproutSpace!")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                    
                    Text("Take care of your plants with ease and keep them healthy with helpful tips!")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        OB2()
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
    OB1()
}
