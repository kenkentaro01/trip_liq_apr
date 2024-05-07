//
//  TripMemberNameList.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/02/14.
//

import Foundation
//
//struct NameItem{
//    //    　struct内で「var」宣告したときにmutatingをfuncの前につけなければならない
//    var addName : String
//    var MemberNameList:[String] = []
//    
//    mutating func addNameList(addName: String) -> [String]{
//        MemberNameList.append(addName)
//        return MemberNameList
//        
//        /// 行削除処理
//    func rowRemove(at offsets: IndexSet) {
//        MemberNameList.remove(atOffsets: offsets)
//        }
//    }
//}
class NameItem: ObservableObject {
    var addName: String
    @Published var MemberNameList: [tripMember] = []
    
    init(addName: String) {
        self.addName = addName
    }
    
    func addNameList(addName: String){
        let newMember = tripMember(id: UUID().uuidString, user: addName)
        MemberNameList.append(newMember)
    }
    
    func rowRemove(at offsets: IndexSet) {
        MemberNameList.remove(atOffsets: offsets)
    }
}
