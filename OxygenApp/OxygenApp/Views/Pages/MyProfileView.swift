//
//  MyProfileView.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//
import SwiftUI

struct MyProfileView: View {
    @State private var userName: String = "Jane Doe"
    @State private var userEmail: String = "jane.doe@example.com"
    @State private var userPhoneNumber: String = "123-456-7890"
    @State private var userState: String = "Washington, USA"
    @State private var userCity: String = "Seattle"
    
    private let certifications: [String] = ["CPR", "First Aid", "AED", "EMT Basic", "RN", "CSW", "BLS"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Text("My Profile")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    ProfileCircleImage()
                }
                .padding(.bottom, -15)
                
                VStack(alignment: .leading, spacing: 15) {
                    Label("Name: \(userName)", systemImage: "person.crop.circle")
                        .font(.headline)
                    Label("Email: \(userEmail)", systemImage: "envelope.fill")
                        .font(.subheadline)
                    Label("Phone: \(userPhoneNumber)", systemImage: "phone.fill")
                        .font(.subheadline)
                    Label("Location: \(userCity), \(userState)", systemImage: "location.fill")
                        .font(.subheadline)
                    
                    
                    Text("My Certifications")
                        .font(.headline)
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            ForEach(certifications, id: \.self) { cert in
                                Text(cert)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                            }
                            
                            Button(action: {
                                // Action to add more certifications
                            }) {
                                HStack(spacing: 8) {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                    Text("Add More")
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(8)
                                
                            }
                        }
                    }
                }
                .padding(.vertical, 15)
                
                VStack(spacing: 15) {
                    // ... [Other Buttons]
                    Button(action: {
                        // Action to edit resume
                    }) {
                        HStack {
                            Spacer()
                            Text("Edit My Resume")
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    
                    NavigationLink(destination: JobDetailsView_Preview.previews) {
                        Button(action: { /* empty action */ }) {
                            HStack {
                                Spacer()
                                Text("What Employers See")
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "eye")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                    }
                    ConnectButton(title: "Connect to Facebook", icon: "f.circle.fill", color: .blue)
                    ConnectButton(title: "Connect to Google", icon: "g.circle.fill", color: .red)
                    ConnectButton(title: "Connect to LinkedIn", icon: "l.circle.fill", color: .blue)
                    ConnectButton(title: "Connect to Apple", icon: "applelogo", color: .black)
                    
                    Button(action: {
                        // Action to delete account
                    }) {
                        Text("Delete My Account")
                            .foregroundColor(.red.opacity(0.9))
                            .padding()
                            .background(Color.gray.opacity(0.15))
                            .cornerRadius(8)
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("My Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ConnectButton: View {
    let title: String
    let icon: String
    let color: Color
    let width: CGFloat = 230 // Here's the width
    
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(title)
                    .foregroundColor(.primary)
            }
            .frame(minWidth: 0, maxWidth: .infinity) // This will make the HStack stretch
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
        }
        .frame(width: width)  // Apply the width to the entire button
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
            .previewLayout(.sizeThatFits)
    }
}
