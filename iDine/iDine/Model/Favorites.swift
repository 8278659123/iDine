//
//  Favorites.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/16/21.
//

import Foundation

class Favorites: ObservableObject {
    
    @Published var favorites = [MenuItem]()
    
    //Adds a favorite Item to the favorites array
    func addToFavorites(favoriteItem: MenuItem) {

        if !favorites.contains(favoriteItem) {
            
            favorites.append(favoriteItem)
            
        }
        
    }
    
    func removeFromFavorites(favoriteItem: MenuItem) {
        
        guard let index = favorites.firstIndex(of: favoriteItem) else {
            return print("error")
        }
        
        favorites.remove(at: index)
        
    }
    
}
