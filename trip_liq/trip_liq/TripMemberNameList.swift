//
//  TripMemberNameList.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/02/14.
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
//colorsに値が入っていない場合は強制的に黒色になる。
        return colors.randomElement() ?? .black
    }
}
