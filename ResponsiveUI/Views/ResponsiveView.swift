//
//  ResponsiveView.swift
//  ResponsiveUI
//
//  Created by Adarsh Shukla on 13/09/22.
//

import SwiftUI

//MARK: Custom View which will give useful properties for adaptive UI
struct ResponsiveView<Content: View>: View {
    
    var content: (Properties) -> Content
    init(@ViewBuilder content: @escaping (Properties) -> Content) {
        self.content = content
    }
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let isLandscape = size.width > size.height
            let isIPad = UIDevice.current.userInterfaceIdiom == .pad
            let isMaxSplit = isSplit() && size.width < 400
            
            let properties = Properties(isLandscape: isLandscape, isiPad: isIPad, isSplit: isSplit(), isMaxSplit: isMaxSplit, size: size)
            
            content(properties)
                .frame(width: size.width, height: size.height)
        }
    }
    
    //MARK: Simple way to find if the app is in Split View.
    func isSplit() -> Bool {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return false }
        
        return screen.windows.first?.frame.size != screen.screen.bounds.size
    }
}

struct ResponsiveView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Properties {
    var isLandscape: Bool
    var isiPad: Bool
    var isSplit: Bool
    //MARK: if the app size is reduced to more than 1/3 in split mode on iPad
    var isMaxSplit: Bool
    var size: CGSize
}
