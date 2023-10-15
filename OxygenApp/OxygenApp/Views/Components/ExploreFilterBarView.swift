//
//  ExploreFilterBarView.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/15/23.
//
import SwiftUI

struct ExploreFilterBarView: View {
    @State private var searchText: String = ""
    @State private var showFilterMenu: Bool = false
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.blue)
                    .padding(.leading, 10)
                
                TextField("Search for jobs...", text: $searchText)
                    .font(.subheadline)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.blue.opacity(0.5), lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            )
            .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 2)
            
            Spacer(minLength: 10) // A little spacing between search and filter button
            
            Button(action: {
                self.showFilterMenu.toggle()
            }) {
                Image(systemName: "slider.horizontal.3")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 24, height: 24)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(Color(UIColor.systemGray6)) // Slightly lighter gray background
        .cornerRadius(15)
    }
}

struct ExploreFilterBarView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreFilterBarView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
