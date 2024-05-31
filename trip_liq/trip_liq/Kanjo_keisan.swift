//
//  Kanjo_keisan.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/02/18.
//

import Foundation
//
//struct SeisanItem {
//    let id = UUID()
//    var Fromcount: Int = 0
//    var heikin_amount: Int = 0
//    var addSeisanList: [[String: String]] = []
//
//    mutating func addSeisanListElement(selectedNamesFrom: [String], selectedNameTo: String?, selectionValue: Warikanway, inputMoney: Int) -> [[String : String]] {
//        Fromcount = selectedNamesFrom.count
//        let averageAmount = warikanCalc(fromCount: Fromcount, inputMoney: inputMoney)
//        for name in selectedNamesFrom {
//            let newElement = [
//                "From": name,
//                "To": selectedNameTo ?? "未選択",
//                "Method": selectionValue.rawValue,
//                "Money": "\(inputMoney)",
//                "shiharai": "\(averageAmount)"
//            ]
//            addSeisanList.append(newElement)
//        }
//        print("現在のaddSeisanList: \(addSeisanList)")
//        return addSeisanList
//    }
//    
//    func warikanCalc(fromCount: Int, inputMoney: Int) -> Int {
//        let averageAmount = inputMoney / (fromCount + 1)
//        return averageAmount
//    }
//}
