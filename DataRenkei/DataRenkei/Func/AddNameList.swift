//
//  AddNameList.swift
//  DataRenkei
//
//  Created by 健太郎 on 2024/05/24.
//

import Foundation

class UserData: ObservableObject {
//    var addName: String
    @Published var MemberNameList: [UserName] = []
    
//    init(addName: String) {
//        self.addName = addName
//    }
//    
    func addNameList(addName: String){
        let newMember = UserName(name: addName)
        MemberNameList.append(newMember)
    }
    
    func rowRemove(at offsets: IndexSet) {
        MemberNameList.remove(atOffsets: offsets)
    }
}
