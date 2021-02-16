//
//  Menu.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/15/21.
//

import SwiftUI

//This is in enence an array of MenuItems. But for this case we are seperating them into different array's of MenuItems depending on the category as Breakfast, Mains, Dessert, Drinks with the category being the name in the variable below, the items all the items in that category of the json file.
struct MenuSelection: Codable, Identifiable {
    
    //Unique identifiable to seperate each of the items in a list
    var id: UUID

    //Name of the MenuSelection
    var name: String
    
    //Array of MenuItems
    var items: [MenuItem]
    
}

struct MenuItem: Codable, Equatable, Identifiable {
    
    //Unique identifiable to seperate each of the MenuItems
    var id: UUID
    
    //MenuItem Name
    var name: String
    
    //Name of the person who took the photo
    var photoCredit: String
    
    //Price of the MenuItem
    var price: Int

    //Different things that make this MenuItem different such as gluten free, non-GMO etc..
    var restrictions: [String]
    
    //Short description of the menu item
    var description: String
    
    //All of our images in our Assets.xcassets folder have a "-" instad of spaces so we need to fix this accrodingly.
    var mainImage: String {
        
        //ReplacingOccurences method replaces a specified String with another string. In this case we are replacing any spaces from the name property on the menu.json file with "-". This is because we want it to match our image assets which have a dash instead of a space in between words.
       return name.replacingOccurrences(of: " ", with: "-").lowercased()
        
    }
    
    var thumbnailImage: String {
        
        //This is a computer property returns the created the thumbnailImage name for the specified MenuItem uring th emainImage computed string. This is so it maches our assets images names which match this layout food-name-thumb thumbnails for our rows.
        return "\(mainImage)-thumb"
        
    }
    
    //Do not what #if Debug #endif do
    #if DEBUG
    static let example = MenuItem(id: UUID(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: ["G","V"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
    #endif
    
}
