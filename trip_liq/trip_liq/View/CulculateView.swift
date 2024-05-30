//
//  CulculateView.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/04/09.
//

import SwiftUI

struct preUserName: Hashable {
    var id = UUID()
    var name: String
    var color: Color
}

struct CulculateView: View {
    @State var MemberNameList: [preUserName] = [
        preUserName(name: "永田", color: .red),
        preUserName(name: "乾", color: .blue),
        preUserName(name: "山田", color: .green)
    ]
    
    @State private var selectedValue: Set<preUserName> = []
    @State private var singleselectedValue: preUserName?
    @State private var selectedTab: String = "均等"
    @State var money: Int = 0
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 0) {
                VStack {
                    Text("奢られ手")
                    List(selection: $selectedValue) {
                        ForEach(MemberNameList, id: \.self) { person in
                            Text("\(person.name)")
                        }
                    }
                    .environment(\.editMode, .constant(.active))
                }
                VStack {
                    Text("奢り手")
                    List {
                        ForEach(MemberNameList, id: \.self) { person in
                            Text("\(person.name)")
                        }
                    }
                    .environment(\.editMode, .constant(.active))
                }
            }
            .frame(height: 400)
            
            HStack(spacing: 0) {
                Button(action: {
                    selectedTab = "均等"
                }) {
                    Text("均等")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedTab == "均等" ? Color.gray.opacity(0.2) : Color.clear)
                        .cornerRadius(1)
                }
                Button(action: {
                    selectedTab = "均等以外"
                }) {
                    Text("均等以外")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedTab == "均等以外" ? Color.gray.opacity(0.2) : Color.clear)
                        .cornerRadius(1)
                }
            }
            
            if selectedTab == "均等" {
                TextField("Int", value: $money, format: .number)
                                    .textFieldStyle(.roundedBorder)
                    .padding()
            } else {
                Text("均等以外タブの内容")
                    .padding()
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CulculateView()
}

