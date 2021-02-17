//
//  ItemDetail.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/15/21.
//

import SwiftUI

struct ItemDetail: View {
    
    //This is the one MenuItem we will display on each of the detailViews. This MenuItem has all the information we need from each menu item.
    let item: MenuItem
    
    //@State private var isStarred: Bool = false
    
    //When this view is shown, SwiftUI will automatically look in its list of environment objects for something that is of type Order, and attach it to that property. If no Order object can be found then we have a problem: something we said would be there isn’t, and our code will crash. This is just like an implicitly unwrapped optional, so be careful with it. This wrapper tells SwiftUI to watch the object for any changes and refresh its UI when a change announcement comes through.
    @EnvironmentObject var order: Order
    
    @EnvironmentObject var favorite: Favorites
    
    var body: some View {
        
        VStack {
            
            ZStack(alignment: .bottomTrailing) {
                
                Image(item.mainImage)
                    //Makes the image resizable
                    .resizable()
                    //Makes it fit the specified display (all iphones) being used.
                    .scaledToFit()
                
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    //Offsets our text to be 5 CGFloat to the left and 5 CGFloat up.
                    .offset(x: -5, y: -5)
                
            }
            
            Text(item.description)
                .padding()
            
            Spacer()
            
            HStack {
                
                Button(action: { favorite.addToFavorites(favoriteItem: item) }) { SubmitButtonView(text: "Favorite") }
                
                if favorite.favorites.contains(item) {
                    
                    Button(action: { favorite.removeFromFavorites(favoriteItem: item)}, label: {
                        SubmitButtonView(text: "Remove Favorite")
                    })
                    
                }
                
                
            }
            
            //Here we have a button that when tapped will run the add() method and we will pass the current item in this detail view we selected from the rows in ContentView()
            Button(action: { order.add(item: item) }) { SubmitButtonView(text: "Order This") }
                .padding(.bottom, 50)
        }
        .navigationTitle(item.name)
        //Navigation bar title shouldn’t be big, because Apple recommends using that style only for top-level screens in a user interface.
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct ItemDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NavigationView {
            
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
                .environmentObject(Favorites())
            
        }
        
    }
    
}
