import SwiftUI

//View for the list of found and lost pets data
struct ListView: View {
    
    //Imported from Network.swift
    @EnvironmentObject var network: Network
    
    var body: some View {
        VStack {
            Text("List")
                .font(.title)
                .padding()
                .bold()
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(network.posts) { post in
                        HStack(alignment:.top) {
                            
                            VStack(alignment: .leading) {
                                Text(post.petname.capitalized(with: Locale.current))
                                    .bold()
                                Text(post.lastlocation.capitalized(with: Locale.current))
                                Spacer(minLength: 15)
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .onAppear {
                //Network method to call API and get lost and found pets data
                network.getPosts()
            }
        }
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(Network())
    }
}
