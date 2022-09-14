//
//  Home.swift
//  ResponsiveUI
//
//  Created by Adarsh Shukla on 13/09/22.
//

import SwiftUI

struct Home: View {
    
    var props: Properties
    @State var currenTab: String = "Home"
    @Namespace var animation
    @State var showSideBar: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            //MARK: showing only for iPad
            if props.isiPad {
                ViewThatFits {
                    ScrollView(.vertical, showsIndicators: false) {
                        SideBar()
                    }
                    .background(
                        Color.white.ignoresSafeArea()
                    )
                }
            }
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HeaderView()
                }
                .padding(15)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(
            Color.black
                .opacity(0.04)
                .ignoresSafeArea()
        )
        .overlay(alignment: .leading) {
            //MARK: Sidebar for non ipad devices
            ViewThatFits {
                ScrollView(.vertical, showsIndicators: false) {
                    SideBar()
                }
                .background(
                    Color.white.ignoresSafeArea()
                )
            }
            .offset(x: showSideBar ? 0 : -100)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background {
                Color.black
                    .opacity(showSideBar ? 0.25 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showSideBar.toggle()
                        }
                    }
                
            }
        }
    }
    
    //MARK: Header View
    @ViewBuilder
    func HeaderView() -> some View {
        let layout = (props.isiPad && !props.isMaxSplit) ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        
        layout {
            VStack(alignment: .leading, spacing: 8) {
                Text("Seatle, New York")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 10) {
                if !(props.isiPad && !props.isMaxSplit) {
                    Button {
                        withAnimation(.easeInOut) {
                            showSideBar.toggle()
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title2)
                            .foregroundColor(.black)
                        
                    }
                    
                    TextField("Search", text: .constant(""))
                    
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 22)
                    
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background {
                Capsule()
                    .fill(.white)
            }
        }
    }
    
    //MARK: Side Bar
    @ViewBuilder
    func SideBar() -> some View {
        
        //MARK: Tabs
        let tabs: [String] = [
            "Home", "Table", "Menu", "Order", "History", "Report", "Alert", "Settings"
        ]
        
        VStack(spacing: 10) {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .padding(.bottom, 10)
            
            ForEach(tabs, id: \.self) { tab in
                VStack(spacing: 8) {
                    Image(tab)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 22)
                    Text(tab)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .foregroundColor(currenTab == tab ? Color.orange : Color.gray)
                .padding(.vertical, 13)
                .frame(width: 65)
                .background {
                    if currenTab == tab {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color.orange.opacity(0.1))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        currenTab = tab
                    }
                }
            }
            
            Button {
                
            } label: {
                VStack {
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                    Text("Profile")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 20)
        }
        .padding(.vertical)
        .frame(maxHeight: .infinity, alignment: .top)
        .frame(width: 100)
        .background {
            Color.white
                .ignoresSafeArea()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
