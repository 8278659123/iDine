//
//  MainView.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/15/21.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        //This will create a instance of a view with selectable tabBars.
        TabView {
            
            ContentView()
                //A tabItem consists of a label and an image which go as such .tabItem{ Label("Label Text", systemImage: "systemImage" }
                .tabItem {
                    
                    Label("Menu", systemImage: "list.dash")
                    
                }
            
            OrderView()
                .tabItem {
                    
                    Label("Order", systemImage: "square.and.pencil")
                    
                }
            
        }
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView()
            .environmentObject(Order())
        
    }
    
}
