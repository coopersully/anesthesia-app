//
//  ContentView.swift
//  Shared
//
//  Created by Cooper Sullivan on 9/6/22.
//

// Cooper was here
// Merritt was here
// Jake was here
import SwiftUI

struct ContentView: View {
    
    // Login screen state variables
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    // Create an account state variables
    @State private var showingCreateScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(Color.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(Color.white)
                
                VStack {
                    Text("Hindsight")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(Color.red, width: CGFloat(wrongUsername))
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(Color.red, width: CGFloat(wrongPassword))
                        .textInputAutocapitalization(.never)
                    
                    HStack {
                        
                        Button("Create an account") {
                            // TODO - Allow account creation
                            showingCreateScreen = true
                        }
                        .foregroundColor(Color.white)
                        .frame(width: 180, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(5)
                        
                        Button("Login") {
                            // TODO - Handle user to login
                            attemptLogin(username: username, password: password)
                        }
                        .foregroundColor(Color.white)
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(5)
                        
                        // Shown when creating an account
                        NavigationLink(destination: Text("Creating an account is not currently an option."), isActive: $showingCreateScreen) {
                            EmptyView()
                        }
                        
                        // Shown when successfully logged in
                        NavigationLink(destination: Text("You logged in as @\(username)"), isActive: $showingLoginScreen) {
                            EmptyView()
                        }
                        
                    }
                    .padding()
                    
                    
                }
                
            }
            .navigationBarHidden(true)
        }
    }
    
    func attemptLogin(username: String, password: String) {
        // If the username is correct
        if username == "coopersully" {
            
            // Don't display red border around field
            wrongUsername = 0
            
            // If the password is correct
            if password == "samford1841" {
                
                // Don't display red border around field
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
    
}

struct ContentView_Previews:
    
    PreviewProvider {
    
        static var previews: some View {
            Group {
                ContentView()
            }
        }
    
    }
