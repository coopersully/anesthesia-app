//
//  CreateAccountView.swift
//  Anesthesia
//
//  Created by Cooper Sullivan on 9/18/22.
//

import SwiftUI

struct CreateAccountView: View {
    var body: some View {
        VStack() {
            Text("Create an account")
                .bold()
                .font(.largeTitle)
                .padding()
            Text("This feature has not yet been implemented; check back later!")
                .padding()
        }
        .frame(width: 350, height: 200)
        .background(Color.blue.opacity(0.05))
        .cornerRadius(20)
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
