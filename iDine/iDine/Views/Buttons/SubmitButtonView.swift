//
//  SubmitButtonView.swift
//  iDine
//
//  Created by Josue Perez Torres on 2/16/21.
//

import SwiftUI

struct SubmitButtonView: View {
    
    var text: String
    
    var body: some View {
        
        Text(text)
            .padding(10)
            .padding([.leading,.trailing], 50)
            .font(.title3)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(30)
        
    }
    
}

struct SubmitButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SubmitButtonView(text: "Order This")
            .previewLayout(.sizeThatFits)
            .padding()
        
    }
    
}
