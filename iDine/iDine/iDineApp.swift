//
//  iDineApp.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/15/21.
//

import SwiftUI

@main
struct iDineApp: App {
    
    //This @StateObject property wrapper lets us pass this property to the main view of our app and then update any subviews whenver the StateObject property changes.. We can only use StateObject wrappers on instances that conform to the @ObservableObject protocol like the Order() class which in this case has the items array which is a @Published property meaning the @StateObject will change the items array on any views that are underneight in this case the ContentView().
    //This is an instance of the Order() class.
    @StateObject var order = Order()
    
    var body: some Scene {
        
        WindowGroup {
            
            ContentView()
                //We place the instance of the order property in an enviromentObject because this environmentObject can be read by any child or subView by using EnvironmentObject wrapper. EnvironmentObjects in swiftUI share data accros many places, but by themselfs they do not do much because they have no way of updating the values if they change (so we could have differnt values for different views). That is why we have to use the EnvironmentObject with the ObservableObject because the ObservableObject actually keeps track of changes and then publishes them which is when the @StateObject gets them and sends it to the EnvironmenObject.
                .environmentObject(order)
            
        }
        
    }
    
}
