//
//  OBUR.swift
//  TH_App13
//
//  Created by IGOR on 07/02/2025.
//

import SwiftUI
import StoreKit

struct OBUR: View {

    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 17) {
                    
                    Text("Rate our app in the AppStore!")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                    
                    Text("Help us to become better. We work for you.")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    OBUR()
}
