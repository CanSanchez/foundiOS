import SwiftUI

// View for the list of found and lost pets data
struct ListView: View {
    @State public var viewModel:any PostViewModelProtocol
    
    var body: some View {
        
        VStack {
            Text("List")
                .font(.title2)
                .padding(5)
                .bold()
            
            List {
                ForEach(viewModel.posts) { post in
                    CardView(card: post)
                        .padding(10)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: PreviewViewModel())
    }
}

struct PreviewViewModel: PostViewModelProtocol {
    var posts: [Post] {
        [
            .exampleItem,
            .exampleItem
        ]
    }
    public init() {
        
    }
}
