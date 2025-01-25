//
//  PlantsView.swift
//  TH_App13
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI

struct PlantsView: View {

    @StateObject var viewModel = PlantsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("My plants")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .medium))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isSettings = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "gearshape")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                    })
                }

                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.vertical, 7)
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("Add new plant")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .padding(.horizontal, 40)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
                .opacity(viewModel.plants.isEmpty ? 0 : 1)
                
                if viewModel.plants.isEmpty {
                    
                    VStack(spacing: 15) {
                        
                        Image("empty")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 130)
                        
                        Text("You don't have any plants yet. Would you like to add it?")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(width: 220)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {

                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))

                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.plants, id: \.self) { index in
                                
                                HStack(alignment: .top) {
                                    
                                    Image(index.plCat ?? "")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        
                                        Text(index.plName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 22, weight: .medium))
                                        
                                        Text((index.plDate ?? Date()).convertDate(format: "dd.MM.YYYY"))
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                        
                                        HStack {
                                            
                                            VStack {
                                                
                                                Image(index.plLL ?? "")
                                                    
                                                Text(index.plLL ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .regular))
                                            }
                                            
                                            if index.plWI == "1" {
                                                
                                                Image("fk")
                                                
                                            } else if index.plWI == "2" {
                                                
                                                HStack {
                                                    
                                                    Image("fk")

                                                    Image("fk")

                                                }
                                                
                                            } else {
                                                
                                                HStack {
                                                    
                                                    Image("fk")

                                                    Image("fk")

                                                    Image("fk")

                                                }
                                            }
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedPlant = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDelete = true
                                        }
                                        
                                    }, label: {
                                        
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                            .font(.system(size: 17, weight: .regular))
                                    })
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(.white).shadow(color: .gray.opacity(0.5), radius: 4))
                                .padding(5)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchPlants()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddPlant(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isSettings, content: {
            
            SettingsView()
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("Delete this plant??")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical)

                    Rectangle()
                        .fill(.gray.opacity(0.2))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical, 7)
                    
                    HStack {
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deletePlant(withPlName: viewModel.selectedPlant?.plName ?? "", completion: {
                                
                                viewModel.fetchPlants()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
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
                                
                                viewModel.isDelete = false
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
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    PlantsView()
}
