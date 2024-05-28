//
//  viewModel.swift
//  data_renkei_demo
//
//  Created by 健太郎 on 2024/05/27.
//

import SwiftUI

struct UserName: Identifiable {
    var id = UUID()  // 一意の識別子
    var name: String
    var color: Color  // 各ユーザーの色
}
