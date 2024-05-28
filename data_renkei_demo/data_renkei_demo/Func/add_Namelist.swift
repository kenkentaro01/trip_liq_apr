//
//  add_Namelist.swift
//  data_renkei_demo
//
//  Created by 健太郎 on 2024/05/27.
//

import Foundation
import SwiftUI

class UserData: ObservableObject {
    @Published var MemberNameList: [UserName] = []
    
    func addNameList(addName: String) {
        let newMember = UserName(name: addName,color: randomColor())
        MemberNameList.append(newMember)
    }
    
    func rowRemove(at offsets: IndexSet) {
        MemberNameList.remove(atOffsets: offsets)
    }
    
    private func randomColor() -> Color {
        let colors: [Color] = [.red, .blue, .green, .yellow, .purple, .orange, .pink, .teal, .indigo, .cyan]
        return colors.randomElement() ?? .black
    }
}
