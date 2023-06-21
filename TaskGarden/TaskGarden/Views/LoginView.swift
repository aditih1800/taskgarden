//
//  LoginView.swift
//  TaskGarden
//
//  Created by Aditi Hariharan on 6/10/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                ZStack{
                    Color(red: 1.0, green: 0.973, blue: 0.784)
                        .ignoresSafeArea()
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(Color.accentColor)
                        .rotationEffect(Angle(degrees: 15))
                    
                    VStack{
                        HStack {
                            Text("Task Garden")
                                .font(.system(size: 50))
                                .foregroundColor(Color.white)
                                .bold()
                            Image(systemName: "leaf")
                        }
                        Text("Productivity made easy")
                            .font(.system(size:20))
                            .foregroundColor(Color.white)
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 3,
                       height: 300)
                
                //Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button {
                        viewModel.login()
                    } label: {
                        ZStack  {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            Text("Log In")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                    .padding()
                }
                //Create Account
                VStack{
                    Text("New here?")
                    NavigationLink("Create an account!", destination: Registration())
                    .foregroundColor(Color.blue)
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
