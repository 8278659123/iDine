//
//  MainView.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/15/21.
//

import SwiftUI

struct MainView: View {
    
    @State private var selection = 2
    
    var body: some View {
        
        //This will create a instance of a view with selectable tabBars. With the selection: initilizer for the TabView it sets a @State property that tells it its default value form the tags in the views in the body
        TabView(selection: $selection) {
            
            FavoritesView()
                .tabItem {
                    
                    Label("Favorites", systemImage: "star")
                    
                }
                .tag(1)
            
            ContentView()
                //A tabItem consists of a label and an image which go as such .tabItem{ Label("Label Text", systemImage: "systemImage" }
                .tabItem {
                    
                    Label("Menu", systemImage: "list.dash")
                    
                }
                .tag(2)
            
            OrderView()
                .tabItem {
                    
                    Label("Order", systemImage: "square.and.pencil")
                    
                }
                .tag(3)
            
        }
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView()
            .environmentObject(Order())
            .environmentObject(Favorites())
        
    }
    
}
