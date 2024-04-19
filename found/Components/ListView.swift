import SwiftUI

// View for the list of found and lost pets data
struct ListView: View {
    @StateObject private var viewModel = PostViewModel()
    
    var body: some View {
        VStack {
            Text("List")
                .font(.title)
                .padding()
                .bold()
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.posts) { post in
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
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
