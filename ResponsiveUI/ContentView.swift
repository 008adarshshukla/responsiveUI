//
//  ContentView.swift
//  ResponsiveUI
//
//  Created by Adarsh Shukla on 13/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ResponsiveView { props in
            Home(props: props)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
