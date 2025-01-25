//
//  TasksView.swift
//  TH_App13
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI

struct TasksView: View {

    @StateObject var viewModel = PlantsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Tasks")
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
                        
                        viewModel.isAddTask = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("Add new task")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .padding(.horizontal, 40)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
                .opacity(viewModel.tasks.isEmpty ? 0 : 1)
                
                if viewModel.tasks.isEmpty {
                    
                    VStack(spacing: 15) {
                        
                        Image("empty2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 130)
                        
                        Text("You don't have any plant care tasks yet. Would you like to add it??")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(width: 220)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddTask = true
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
                            
                            ForEach(viewModel.tasks, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    HStack {
                                        
                                        Image(index.taPlantPhoto ?? "")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                        
                                        Text(index.taPlant ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedTask = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDeleteTask = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "trash")
                                                .foregroundColor(.red)
                                                .font(.system(size: 17, weight: .regular))
                                        })
                                    }
                                    
                                    Rectangle()
                                        .fill(.gray.opacity(0.2))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 1)
                                        .padding(.vertical)
                                    
                                    Text("Tasks")
                                        .foregroundColor(.black)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Text(index.taTask1 ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Text(index.taTask2 ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Text(index.taTask3 ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Text(index.taTask4 ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Text(index.taTask5 ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
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
            
            viewModel.fetchTasks()
        }
        .sheet(isPresented: $viewModel.isAddTask, content: {
            
            AddTask(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isSettings, content: {
            
            SettingsView()
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteTask ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteTask = false
                        }
                    }
                
                VStack(spacing: 15) {

                    Text("Delete this task??")
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
                            
                            CoreDataStack.shared.deleteTask(withTaTask1: viewModel.selectedTask?.taTask1 ?? "", completion: {
                                
                                viewModel.fetchTasks()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteTask = false
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
                                
                                viewModel.isDeleteTask = false
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
                .offset(y: viewModel.isDeleteTask ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    TasksView()
}
