//
//  CheckoutView.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/15/21.
//

import SwiftUI

struct CheckoutView: View {
    
    //Various payment types we can select from
    let paymentTypes = ["Cash","Credit Card","Apple Pay","Apple Cash","iDine Points"]
    
    //Various tip amount we can select from
    let tipAmounts = [10,15,20,25,0]
    
    //@Stae variable to update our view dependin on what type of payment we choose from the picker. By default it's set to cash.
    @State private var paymentType = "Apple Pay"
    
    //Default tipAmount and also keeps track of the tipAmount to update the UI
    @State private var tipAmount = 15
    
    //Boolean to keep track on when to add the loyalty ID to update the UI
    @State private var addLoyaltyDetails = false
    
    //Lets the user add the loyalty number which my default is empty
    @State private var loyaltyNumber = ""
    
    //Keeps track of when to show the alerm
    @State private var showingPaymentAlert = false
    
    //Computed property to add all the items + the tip amount and return it
    var totalPrice: String {
        
        //Formatter that converts between numeric values and their textual representations. In this case is converting the total amount with tip (numbers) into formatted strings, in this case formatted as currency.
        let formatter = NumberFormatter()
        
        //We want the returned value to be in currency as $0.00
        formatter.numberStyle = .currency
        
        //This property runs the computed total from the order class and returns it as a double to show precision on "cents"
        let total = Double(order.total)
        
        //This calculates the tip from the percentage chosen. It first divides the tip by 100 to make it a decimal. Second, it multiplies it by the total amount which it it gives you the total tip amount.
        let tipValue = total * (Double(tipAmount) / 100)
        
        //Here we use the formatter and we specify we want result as a string value from a NSNumber which is what it expects that adds the total + tipVlaue. If for some reason it can't calculate the toatl it will use the default value of a string "$0"
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
        
    }
    
    
    //Pass in the same oder object we need for almost all the views to have access to what the user has added to the items array.
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        //Form: is a special view that creates rows with views (much how the iphone settings work). The first item in our Form is a Picker that lets you choose a payment method.
        Form {
            
            //Creates a picker which is a list of items that we can pick from which we specify in the closure. TitleKey: A localized string key that describes the purpose of selecting an option. Selection: A binding to a property that determines the currently-selected option. Content (trailing closure): A view that contains the set of options.
            //For the picker we use a @State property wrapper for paymentType because 1) we want our UI to change when that variable is changed 2) the picker control actually works as a 2-way binder so when we choose a different paymentType the paymentType state variable is written with a different value.
            //If we do not specify a picker style it will just be row that will take you to a default view with more rows of your data.
            Picker("How do you want to pay?", selection: $paymentType) {
                
                //We will use a for each to create text views for each of the items in our paymentTypes array
                ForEach(paymentTypes, id: \.self) { paymentType in
                    
                    Text(paymentType)
                    
                }
                
            }
            //Some cool pickers are WheelPickerStyle, MenuPickerStyle, SegmentedPickerStyle
            //.pickerStyle(MenuPickerStyle())
            
            //A control that toggles between on and off states (bool value). Also this toggle switch has some text inside that will automatically appear to the left as a description. We add an animation and we have to set it to the binding variable because that is what is making the view change.
            Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
            
            //If the user wants to user the iDine loyalty card then add the textfild to enter the ID.
            if addLoyaltyDetails == true {
                
                //TextField: User enters information. This has some text inside that will automatically appear to the left as a description.
                TextField("Enter your iDine ID", text: $loyaltyNumber)
                
            }
            
            //Here we add a way to add a tip but we put it on a different section of its own because it lets us add a title
            Section(header: Text("Add a tip?")) {
                
                Picker("Percentage:", selection: $tipAmount) {
                    
                    ForEach(tipAmounts, id: \.self) { tip in 
                        
                        Text("\(tip)%")
                        
                    }
                    
                }
                //Here we do not use the default styel
                .pickerStyle(SegmentedPickerStyle())
                
            }
            
            Section(header: Text("TOTAL: \(totalPrice)").font(.title)) {
                
                Button(action: {
                    
                    //Toggles from the default value
                    showingPaymentAlert.toggle()
                    
                }) {
                    
                    Text("Confirm Order ")
                    
                }
                
            }
            
            
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice) - thank you!"), dismissButton: .default(Text("OK")))
            
        }
        
    }
    
}

//Without @State we wouldn’t be able to change properties in our structs, because structs are fixed values.
//Without StateObject we wouldn’t be able to create classes that stay alive for the duration of our app.
//Without @EnvironmentObject we wouldn’t be able to receive shared data from elsewhere in our app.
//Without ObservableObject we wouldn’t be notified when an external value changes.
//Without $property two-way bindings we would need to update values by hand.

struct CheckoutView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CheckoutView()
            .environmentObject(Order())
        
    }
    
}
