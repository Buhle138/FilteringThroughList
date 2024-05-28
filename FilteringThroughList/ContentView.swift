//
//  ContentView.swift
//  FilteringThroughList
//
//  Created by Buhle Radzilani on 2024/05/28.
//

import SwiftUI

struct ContentView: View {
    @State private var search: String = ""
    @State private var friends: [String] = ["John", "Mary", "Steven", "Steve", "Jerry"]
    @State private var filterFriends: [String] = []
    
    var body: some View {
        VStack{
            List(filterFriends, id: \.self){friend in
                Text(friend)
            }
            .listStyle(.plain)
            .searchable(text: $search)
            //onChange is going to get fired whenever something changes
            .onChange(of: search) { newValue in
               filterFriends = friends.filter{$0.contains(search)}
                if search.isEmpty {
                    filterFriends = friends
                }else{
                    filterFriends = friends.filter{$0.contains(search)}
                }
            }
            
            Spacer()
        }.padding()
            .onAppear(perform: {
                //We want to ensure that when the list appears we don't see an empty list when the user has not searched for anything. We want to see the current item.
               filterFriends = friends
            })
            .navigationTitle("Friends")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
        
    }
}
