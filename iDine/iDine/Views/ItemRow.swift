//
//  ItemRow.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/15/21.
//

import SwiftUI

struct ItemRow: View {
    
    //This is the one MenuItem we will display on each of the rows. This MenuItem has all the information we need from each menu item.
    let item: MenuItem
    
    let colors: [String:Color] = ["D":.purple,"G":.black,"N":.red,"S":.blue,"V":.green]
    
    @EnvironmentObject var favorite: Favorites
    
    var body: some View {
        
        NavigationLink(destination: ItemDetail(item: item)) {
            
            HStack {
                
                //Thumbnail Image
                Image(item.thumbnailImage)
                    //Clips the image into a circle
                    .clipShape(Circle())
                    //Then we add an overlay shape of another circle with a stroke in ecenece creating a border
                    .overlay(
                        
                        Circle().stroke(Color.gray, lineWidth: 2.0)
                        
                    )
                
                VStack(alignment: .leading) {
                    
                    //Name of MenuItem
                    HStack {
                        
                        Text(item.name)
                            .font(.headline)
                        
                        //If the current item in view is on the favorites array then it will show the "star.fill"
                        if favorite.favorites.contains(item) {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.blue)
                                .font(.subheadline)
                            
                        }
                        
                    }
                    
                    //Price of MenuItem
                    Text("$\(item.price)")
                    
                }
                
                //This will add some space it between the left views and the restrictions views.
                Spacer()
                
                //This is going to loop through the restrictions array of the MenuItem which are Strings as ["G", "V"]
                ForEach(item.restrictions, id: \.self) { restriction in
                    
                    //Then for each of the strings it's going to create a Text{} view with varies font and weight sizes with some padding.
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5.0)
                        //In addition, for it's background it will use the dictionary of colors above to enter the key from the MenuItem's array and it will return a color value to use for that specified key. For dictionary's we can specify a key, but if it cannot find that key we can specify a default value as such dictionary[key, default: value] in this case we give a default value of .black.
                        .background(colors[restriction, default: .black])
                        //Clip the image to a circle
                        .clipShape(Circle())
                        //Change the color of the text to white.
                        .foregroundColor(.white)
                    
                }
                
            }
            
        }
        
    }
    
}

struct ItemRow_Previews: PreviewProvider {
    
    static var previews: some View {
        
        //Here we added a example MenuItem from Menu.swift in the #if Debug #end code
        ItemRow(item: MenuItem.example)
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(Favorites())
        
    }
    
}
