//
//  SettingsView.swift
//  TH_App13
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {

    @Environment(\.presentationMode) var back
    @State var isDeleteAll: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                back.wrappedValue.dismiss()
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .medium))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 40)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 16) {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Rate the app")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .regular))
                            }
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/5ebd1af2-4aaa-46af-a38a-5792d8d60fa9") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "menucard")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Usage policy")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .regular))
                            }
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.bottom, 30)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isDeleteAll = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Delete all plants and tasks")
                                    .foregroundColor(.red)
                                    .font(.system(size: 17, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .regular))
                            }
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                    }
                    .padding()
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(isDeleteAll ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isDeleteAll = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("Delete all data?")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                    
                    Text("Are you shure?")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)

                    Rectangle()
                        .fill(.gray.opacity(0.2))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical, 7)
                    
                    HStack {
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteAllData()
                            
                            withAnimation(.spring()) {
                                
                                isDeleteAll = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isDeleteAll = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                    .padding(.top, 25)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                .padding()
                .offset(y: isDeleteAll ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
