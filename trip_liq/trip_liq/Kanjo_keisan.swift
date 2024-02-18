//
//  Kanjo_keisan.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/02/18.
//

import Foundation

struct SeisanItem {
    let id = UUID()
    let Fromname: [String] // 複数の名前を含むことができる
    let Toname: String
    let keisanhoho: String
    var addSeisanList: [[String: String]] = [] // 辞書型の配列として定義
    
    // addSeisanList に辞書型のデータを追加するメソッド
    mutating func addSeisanListElement() {
        for name in Fromname {
            // Fromname の各要素に対して、Toname と keisanhoho と共に辞書を作成し追加
            let newElement = ["From": name, "To": Toname, "Method": keisanhoho]
            addSeisanList.append(newElement)
            // ここで追加された辞書を出力
            print("追加された辞書: \(newElement)")
        }
        // 全部の追加後のリストを出力
        print("現在のaddSeisanList: \(addSeisanList)")
    }
}
