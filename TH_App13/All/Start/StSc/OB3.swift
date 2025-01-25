//
//  OB3.swift
//  TH_App13
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI

struct OB3: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("o3")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 17) {
                    
                    Text("Add Your First Plant")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                    
                    Text("Start by adding your first plant. Customize the details of his care and monitor his health over time!")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Add your first plant")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
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
    OB3()
}
