//
//  MainView.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/15/21.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        //This will create a view with selectable tabs which we need to supply the view we want in the braces
        TabView {
            
            ContentView()
            
        }
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView()
        
    }
    
}
