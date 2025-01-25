//
//  TabBar.swift
//  TH_App13
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 6, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim2") : Color.gray.opacity(0.4))
                            .frame(width: 15, height: 15)

                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("prim2") : Color.gray.opacity(0.4))
                            .font(.system(size: 13, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 24)
        .padding(.bottom, 38)
        .background(RoundedRectangle(cornerRadius: 0).fill(Color("prim")))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Plants = "My plants"
    
    case Tasks = "Tasks"
    
    case Tips = "Tips"

}
