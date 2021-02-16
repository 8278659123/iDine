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
                    //Need to research this method and also the edith button
                    .onDelete(perform: deleteItems)
                    
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
            .toolbar {
                
                //SwiftUI already knows that an edit button should toggle the table between editing and non-editing mode, while also changing title between Edit and Done
                EditButton()
                
            }
            
        }
        
    }
    
    func deleteItems(at offsets: IndexSet) {
        
        order.items.remove(atOffsets: offsets)
        
    }
    
}

struct OrderView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        OrderView()
            .environmentObject(Order())
        
    }
    
}
