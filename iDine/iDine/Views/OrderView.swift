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
                    
                }
                
                Section {
                    
                    //This will take the user to another view to "Check Out"
                    NavigationLink(destination: Text("Check Out")) {
                        
                        Text("Place Order")
                        
                    }
                    
                }
                
            }
            .navigationTitle("Order")
            //This list style will show each item as its on white row
            .listStyle(InsetGroupedListStyle())
            
        }
        
    }
    
}

struct OrderView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        OrderView()
            .environmentObject(Order())
        
    }
    
}
