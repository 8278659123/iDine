//
//  Order.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/15/21.
//

import SwiftUI

//@ObservableObject: For more complex properties – when you have a custom type you want to use that might have multiple properties and methods, or might be shared across multiple views – you will often use @ObservedObject instead. Because this order class is going to be access from different views (meaning each row we can add a different item) we need it to conform to the ObservableObject protocol. This is very similar to the @State except now we're using an external reference type rather than a simple local property like a string or an integer. You’re still saying that your view depends on data that will change, except now it’s data you’re responsible for managing yourself – you need to create an instance of the class, create its own properties, and so on.

//@StateObject: Somewhere between @State and @ObservedObject lies @StateObject. This is a specialized version of @ObservedObject, and it works in almost exactly the same way: you must conform to the ObservableObject protocol, you can use @Published to mark properties as causing change notifications, and any views that watch an @StateObject will refresh their body when the object changes. There is one important difference between @StateObject and @ObservedObject, which is ownership – which view created the object, and which view is just watching it. The rule is this: whichever view is the first to create your object must use @StateObject, to tell SwiftUI it is the owner of the data and is responsible for keeping it alive. All other views must use @ObservedObject, to tell SwiftUI they want to watch the object for changes but don’t own it directly.

//@EnviromentObject: There’s another type of property wrapper available to use, which is @EnvironmentObject. This is a value that is made available to your views through the application itself – it’s shared data that every view can read if they want to. So, if your app had some important model data that all views needed to read, you could either hand it from view to view to view or just put it into the environment where every view has instant access to it.Think of @EnvironmentObject as a massive convenience for times when you need to pass lots of data around your app. Because all views point to the same model, if one view changes the model all views immediately update – there’s no risk of getting different parts of your app out of sync.

//1) Use @State for simple properties that belong to a single view. They should usually be marked private.

//2) Use @ObservedObject for complex properties that might belong to several views. Most times you’re using a reference type you should be using @ObservedObject for it.

//3) Use @StateObject once for each observable object you use, in whichever part of your code is responsible for creating it.

//4) Use @EnvironmentObject for properties that were created elsewhere in the app, such as shared data.

//Of the four you will find that @ObservedObject is both the most useful and the most commonly used, so if you’re not sure which to use start there.

//The ObservableObject Protocol knows how to anounce changes to view, but the @Published wrapper is what actually makes the announces. It "Publisheses them"
class Order: ObservableObject {
    
    //IMPORTANT: We use the @Published property wrapper to indicate that we want this property to notify the views that items have changed. In this case we want each of the views to respond accordingly when we add or delete an item to our "cart" from the items array.
    //This Published variable will keep track of view changes for the items array.
    @Published var items = [MenuItem]()
    
    //Computed property to calculate the total
    var total: Int {
        
        //If there are items in the items array it will return the total price of the items in the array, else return zero for the total.
        if items.count > 0 {
            
            //The reduce method: specified by a closure that we specify how we want the items used, combines (sums) the elements in a sequence and returns them. How it works is in the first parameter we specify the initial value/results and then we pass a closure that that accumulates to the inital value. Here we use the sequence (array) of items we specify that the inital value is 0 (because we always start with 0 items in our cart which is the price is always $0). Then for the closure we take the initial value (zero dollars) + the price of the second item and returns the total by going through the array. Example items = ["Pizza"($5),"Soda"($1),"Fries"($3)] the inital value is $0 so the reduce method will do this: $0 + $5 = $5, then $5 + $1 = $6, $6 + $3 = $9, reduce method will return $9 as the total.
            return items.reduce(0) { (initialValue, nextItem) in
                
                
                return initialValue + nextItem.price
                
            }
            
        } else {
            
            //Total = Zero
            return 0
            
        }
        
    }
    
    //This method adds a MenuItem to the items array containing the total MenuItems.
    func add(item: MenuItem) {
        
        items.append(item)
        
    }
    
    //This method first finds the index of a specifed item on the items array using firstIndex(of: index) and then in the statement it uses the remove(at: index) to pass the index of the item found and removes it from the array and then returns the array again with the item removed.
    func remove(item: MenuItem) {
        
        if let index = items.firstIndex(of: item) {
            
            items.remove(at: index)
            
        }
        
    }
    
}
