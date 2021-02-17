//
//  ContentView.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/15/21.
//

import SwiftUI

struct ContentView: View {
    
    //This will parse the menu.json into 5 menu selections consisting of Breakfast, Main, Desssert and Drinks with each having an array of MenuItems
    let menu = Bundle.main.decode([MenuSelection].self, from: "menu.json")
    
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        
        //Everything is inside a NavigationView so we can make the rows go to a destination and add a title
        NavigationView {
            
            //Here we are first using the MenuSelection to display the name of one of the selection (Ex.Breakfast) then we display all the MenuItems in the items array using the section.items. Here we embed a ForEach inside a List becasue we need it for editing support of our rows.
            List {
                
                //This ForEach is displaying the 4 MenuSelections we have.
                ForEach(menu) { section in
                    
                    //For the 4 MenuSelections we will use a Section{} to seperate each of the MenuItems
                    Section(header: Text(section.name)) {
                        
                        //This ForEach is dislaying the items inside each section
                        ForEach(section.items) { item in
                            
                            ItemRow(item: item)
                            
                        }
                        
                    }
                    
                }
                
            }
            //Sets the title for the NavigationView
            .navigationTitle("Menu")
            //Removes the plain style of the Section{} and gives it a grouped style.
            .listStyle(GroupedListStyle())
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
            .environmentObject(Favorites())
        
    }
    
}
