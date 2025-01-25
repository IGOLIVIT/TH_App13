//
//  TipsViewModel.swift
//  TH_App13
//
//  Created by IGOR on 24/01/2025.
//

import SwiftUI

final class TipsViewModel: ObservableObject {
    
    @Published var types: [String] = ["Guide to Plant Care", "Plant Selection by Environment"]
    @Published var curType = "Guide to Plant Care"
    
    @Published var imPlayers: [String] = ["boy1", "boy2", "girl1", "girl2"]
    @Published var currentImPlayer = ""

    @Published var genders: [String] = ["Male", "Female"]
    @Published var selGen = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false

}
