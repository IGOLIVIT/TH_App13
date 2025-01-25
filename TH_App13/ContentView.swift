//
//  ContentView.swift
//  TH_App13
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Plants

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {

                        PlantsView()
                            .tag(Tab.Plants)
                        
                        TasksView()
                            .tag(Tab.Tasks)

                        TipsView()
                            .tag(Tab.Tips)
                        
                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                OB1()
            }
        }
    }
}

#Preview {
    ContentView()
}
