//
//  FavoritesView.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/16/21.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var favorites: Favorites
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                if !favorites.favorites.isEmpty {
                    
                    List {
                        
                        ForEach(favorites.favorites) { favoriteItem in
                            
                            ItemRow(item: favoriteItem)
                            
                        }
                        
                        //MARK: Need to dismiss the view if there are no items in the favorites array
                    }
                    .listStyle(GroupedListStyle())
                    
                } else {
                    
                    VStack(alignment: .center) {
                        
                        Image(systemName: "star")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        Text("Add some food to your favorites!")
                            .font(.title2)
                        
                    }
                    .foregroundColor(.gray)
                    .opacity(0.4)
                    .padding(.bottom, 150)
                    
                }
                
            }
            .navigationTitle("Favorites")
            
        }
        
    }
    
}

struct FavoritesView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        FavoritesView()
            .environmentObject(Favorites())
        
    }
    
}
