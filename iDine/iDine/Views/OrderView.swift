//
//  OrderView.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/15/21.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        NavigationView {
            
            if !order.items.isEmpty {
                
                List {
                    
                    Section{
                        
                        //Here we get the items array that should have all the items that we add to the "cart" so this ForEach will loop through all the items one by one
                        ForEach(order.items) { item in
                            
                            HStack {
                                
                                //Will display the item name
                                Text(item.name)
                                
                                Spacer()
                                
                                //Will display the item price
                                Text("$\(item.price)")
                                
                            }
                            
                        }
                        //Here we can add modifiers to the ForEach which out of the box it can do onDelete(perform: IndexSet) and onMove(perform: IndexSet) arguments that do an action once tapped on either the delete button that slides up or the move lines that appear on the trailing part of the row so the user is able to move the row. The most important part is that you will have to create a method to handle this action and that you have to reference the "index" of each row as indexSet which is a smart array of indexes that stores the index you actually need. This method has a closure that provides a index set each time you want to remove a row so you have write code that says what you want to do with that index. In the code below I specified an array (items array which has all the items in our cart) and we then used the remove(atOffsets: IndexSet) method to remove the specifed indetSet. So basicly we pass and indexSet and the remove(atOffset) method removes it from the array. Another way to make your code cleaner is to create a method ouside this struct like the deleteItems(offsets: IndexSet) that I created that takes an offset as an argument, then just run put the same code as here, then just add it to the onDelete(perform: deleteItems) as such with no paranthesis.
                        .onDelete(perform: { indexSet in
                            
                            order.items.remove(atOffsets: indexSet)
                            
                        })
                        //How to use the onMove method to move rows
    //                    .onMove(perform: { indices, newOffset in
    //                        order.items.move(fromOffsets: indices, toOffset: newOffset)
    //                    })
                        
                        
                        
                    }
                    
                    Section {
                        
                        //This will take the user to another view to "Check Out"
                        NavigationLink(destination: CheckoutView()) {
                            
                            Text("Place Order")
                            
                        }
                        
                    }
                    //If there are not items in the items array then do not show this view
                    .disabled(order.items.isEmpty == true)
                    
                }
                .navigationTitle("Order")
                //This list style will show each item as its on white row
                .listStyle(InsetGroupedListStyle())
                //The toolbar modifier adds an item to either the NavigationView or the BottomBar.
                .toolbar {
                    
                    //By default you can only add one view on the curley braces. In order to do more than one use ToolBarItemGroup which you can use the placement as .buttomBar. Also by default without using  the ToolBarItemGroup you will add any view to the NavigationView by default.
                
                    //This button basicly turns on or off editing capabilites but it does not know which capabilites until we define them where we create our loop of views most likely on a ForEach(). ForEach supports deletion and moving of rows out of the box so they can be added there as modifiers. The modifiers code is onDelete(perform: IndexSet) and onMove(perform: IndexSet)
                    EditButton()
                    
                }
                
            } else {
                
                VStack(alignment: .center) {
                    
                    Image(systemName: "bag")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("Add some food to your cart!")
                        .font(.title2)
                    
                }
                .foregroundColor(.gray)
                .opacity(0.4)
                .padding(.bottom, 150)
                
            }
            
        }
        
    }
    
    //Here we write a method to perform our deletion from the ForEach loop. How the onDelete(perform: ) modifier works is you need to write a function that takes
    func deleteItems(offsets: IndexSet) {

        order.items.remove(atOffsets: offsets)

    }
    
}

struct OrderView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        OrderView()
            .environmentObject(Order())
        
    }
    
}
