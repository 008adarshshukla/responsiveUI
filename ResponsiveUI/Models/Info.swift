//
//  Info.swift
//  ResponsiveUI
//
//  Created by Adarsh Shukla on 13/09/22.
//

import SwiftUI

//MARK: Info Cards and Sample Data

struct Info: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var amount: String
    var percentage: Int
    var loss: Bool = false
    var icon: String
    var iconColor: Color
}

var infos: [Info] = [
    Info(title: "Revenue", amount: "$2.047", percentage: 10, icon: "arrow.up.right", iconColor: .orange),
    Info(title: "Orders", amount: "$356", percentage: 20, icon: "cart", iconColor: .green),
    Info(title: "Dine In", amount: "$220", percentage: 10, icon: "fork.knife", iconColor: .red),
    Info(title: "Take away", amount: "$135", percentage: 5, loss: true, icon: "takeoutbag.and.cup.and.straw.fill", iconColor: .yellow)
]
