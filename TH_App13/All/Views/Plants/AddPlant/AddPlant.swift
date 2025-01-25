//
//  AddPlant.swift
//  TH_App13
//
//  Created by IGOR on 25/01/2025.
//

import SwiftUI

struct AddPlant: View {
    
    @StateObject var viewModel: PlantsViewModel
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New plant")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                        })
                        
                        Spacer()
                    }
                }

                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 14) {
                        
                        Text("Plant category")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Menu(content: {
                            
                            ForEach(viewModel.families, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curFamily = index
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(index)
                                        
                                        Text(index)
                                    }
                                })
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(viewModel.curFamily)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30)
                                
                                Text(viewModel.curFamily)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                        
                        Text("Plant name")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.plName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.plName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Plant age (date of planting)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                
                                DatePicker("", selection: $viewModel.plDate, displayedComponents: .date)
                                    .labelsHidden()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)

                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Watering frequency")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                
                                ZStack(content: {
                                    
                                    Text("Every 0 day")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.plWF.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.plWF)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding(7)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Watering intensity")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                
                                HStack {
                                    
                                    ForEach(1...3, id: \.self) { water in
                                        
                                        Button(action: {
                                            
                                            viewModel.curIntens = water
                                            
                                        }, label: {
                                            
                                            Image(water <= viewModel.curIntens ? "fk" : "ek")
                                        })
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)

                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Lighting level")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                
                                HStack {
                                    
                                    ForEach(viewModel.types, id: \.self) { index in
                                    
                                        Button(action: {
                                            
                                            viewModel.curType = index
                                            
                                        }, label: {
                                            
                                            VStack {
                                                
                                                Image(index)
                                                    .opacity(viewModel.curType == index ? 1 : 0.3)
                                                
                                                Text(index)
                                                    .foregroundColor(viewModel.curType == index ? .black : .black.opacity(0.3))
                                                    .font(.system(size: 13, weight: .regular))
                                            }
                                            .frame(maxWidth: .infinity)
                                        })
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                        
                        HStack {
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    Text("Repotting")
                                        .foregroundColor(.black)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    ZStack(content: {
                                        
                                        Text("Every 0 month")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15, weight: .regular))
                                            .opacity(viewModel.plRep.isEmpty ? 1 : 0)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        TextField("", text: $viewModel.plRep)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    })
                                    .padding(7)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)

                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Temperature (℃)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                
                                ZStack(content: {
                                    
                                    Text("Enter")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .regular))
                                        .opacity(viewModel.plTemp.isEmpty ? 1 : 0)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    TextField("", text: $viewModel.plTemp)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                })
                                .padding(7)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                        
                        Text("Additional Notes")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.plNot.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.plNot)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                            .padding(.bottom, 50)
        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button(action: {
                        
                        viewModel.plCat = viewModel.curFamily
                        viewModel.plWI = String(viewModel.curIntens)
                        viewModel.plLL = viewModel.curType
                        
                        viewModel.addPlant()
                        
                        viewModel.plName = ""
                        viewModel.plWF = ""
                        viewModel.plRep = ""
                        viewModel.plTemp = ""
                        viewModel.plNot = ""
                        
                        viewModel.curType = "Low"
                        viewModel.curIntens = 1
                        viewModel.curFamily = "Other"
                        
                        viewModel.fetchPlants()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "checkmark")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("Save and add")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .padding(.horizontal, 40)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                    })
                    .opacity(viewModel.plName.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.plName.isEmpty ? true : false)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddPlant(viewModel: PlantsViewModel())
}
