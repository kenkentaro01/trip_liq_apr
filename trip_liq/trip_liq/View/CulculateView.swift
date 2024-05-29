//
//  CulculateView.swift
//  trip_liq
//
//  Created by 健太郎 on 2024/04/09.
//

import SwiftUI

struct preUserName: Hashable{
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
    
    var body: some View {
        HStack(spacing: 0){
            VStack{
                Text("奢られ手")
                List(selection: $selectedValue) {
                    ForEach(MemberNameList, id: \.self) { person in
                        Text("\(person.name)")
                    }
                }
                .environment(\.editMode, .constant(.active))

            }
            VStack{
                Text("奢り手")
                List {
                                ForEach(MemberNameList, id: \.self) { person in
                                    Text("\(person.name)")
                                }
                            }
                            .environment(\.editMode, .constant(.active))
            }

}
        .padding()
    }
}

#Preview {
    CulculateView()
}
