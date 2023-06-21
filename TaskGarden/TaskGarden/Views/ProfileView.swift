//
//  ProfileView.swift
//  TaskGarden
//
//  Created by Aditi Hariharan on 6/10/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if let user = viewModel.user {
                        //Avatar
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.accentColor)
                            .frame(width: 125, height: 125)
                            .padding()
                        
                        //Info: Name, Email, Member since
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Name: ")
                                    .bold()
                                Text(user.name)
                            }
                            //.padding()
                            HStack {
                                Text("Email: ")
                                    .bold()
                                Text(user.email)
                            }
                            //.padding()
                            HStack {
                                Text("Member Since: ")
                                    .bold()
                                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                            }
                            //.padding()
                        }
                        .padding()
                        
                        //Sign out
                        Button("Log Out") {
                            viewModel.logout()
                        }
                        .padding()
                        .background(Color.red.cornerRadius(10))
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .padding()
                        Spacer()
                        
                    } else  {
                        Text("Loading Profile...")
                    }
                }
                .navigationTitle("Profile")
            }
            .onAppear {
                viewModel.fetchUser()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
