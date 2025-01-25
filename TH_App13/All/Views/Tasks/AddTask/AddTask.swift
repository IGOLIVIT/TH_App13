//
//  AddTask.swift
//  TH_App13
//
//  Created by IGOR on 25/01/2025.
//

import SwiftUI

struct AddTask: View {

    @StateObject var viewModel: PlantsViewModel
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New task")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddTask = false
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
                        
                        Text("My plants")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Menu(content: {
                            
                            ForEach(viewModel.plants, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedPlant = index
                                    
                                    viewModel.taskCurPlant = viewModel.selectedPlant?.plName ?? ""
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(index.plCat ?? "")
                                        
                                        Text(index.plName ?? "")
                                    }
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.taskCurPlant.isEmpty {
                                
                                HStack {

                                    Text("Select plant")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                }
                                
                            } else {
                                
                                HStack {
                                    
                                    Image(viewModel.selectedPlant?.plCat ?? "")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    
                                    Text(viewModel.selectedPlant?.plName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                }
                            }
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                        
                        Text("Tasks")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        ZStack(content: {
                            
                            Text("Enter task 1")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.taTask1.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.taTask1)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                        
                        ZStack(content: {
                            
                            Text("Enter task 2 (optional)")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.taTask2.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.taTask2)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                        
                        ZStack(content: {
                            
                            Text("Enter task 3 (optional)")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.taTask3.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.taTask3)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                        
                        ZStack(content: {
                            
                            Text("Enter task 4 (optional)")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.taTask4.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.taTask4)
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 7)
                        
                        ZStack(content: {
                            
                            Text("Enter task 5 (optional)")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .opacity(viewModel.taTask5.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.taTask5)
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
                        
                        viewModel.taPlant = viewModel.taskCurPlant
                        viewModel.taPlantPhoto = viewModel.selectedPlant?.plCat ?? ""
                        
                        viewModel.addTask()
                        
                        viewModel.taTask1 = ""
                        viewModel.taTask2 = ""
                        viewModel.taTask3 = ""
                        viewModel.taTask4 = ""
                        viewModel.taTask5 = ""
                        
                        viewModel.taskCurPlant = ""
                        
                        viewModel.fetchTasks()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddTask = false
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
                    .opacity(viewModel.taskCurPlant.isEmpty || viewModel.taTask1.isEmpty ? 0.6 : 1)
                    .disabled(viewModel.taskCurPlant.isEmpty || viewModel.taTask1.isEmpty ? true : false)
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchPlants()
        }
    }
}

#Preview {
    AddTask(viewModel: PlantsViewModel())
}
