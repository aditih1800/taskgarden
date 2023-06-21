//
//  Registration.swift
//  TaskGarden
//
//  Created by Aditi Hariharan on 6/10/23.
//

import SwiftUI

struct Registration: View {
    @StateObject var viewModel = RegistrationViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                ZStack{
                    Color(red: 1.0, green: 0.973, blue: 0.784)
                        .ignoresSafeArea()
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(Color.accentColor)
                        .rotationEffect(Angle(degrees: -15))
                    
                    VStack{
                        HStack {
                            Text("Register")
                                .font(.system(size: 50))
                                .foregroundColor(Color.white)
                                .bold()
                        }
                        Text("Start your productivity journey")
                            .font(.system(size:20))
                            .foregroundColor(Color.white)
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 3,
                       height: 240)
                
                //Login Form
                Form {
                    TextField("Full Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        //Attempt to register
                        viewModel.register()
                    } label: {
                        ZStack  {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.green)
                            Text("Create account")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                    .padding()
                }
                Spacer()
            }
        }
    }
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
    }
}
