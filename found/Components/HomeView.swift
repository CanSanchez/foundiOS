import Foundation
import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI


struct HomeView: View {
    
    //Map initial position
    // TODO: get user's current location (TestView)
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 49.280, longitude: -123.1150),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    var body: some View {
            ZStack {
                LinearGradient(colors: [.primaryPurple, .secondaryPurple, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                ScrollView {
                VStack {
                    //Instance of Map
                    HStack {
                        Map(position: $position)
                            .mapStyle(.hybrid(elevation: .realistic))
                    }
                    .frame(height: 500)
                    //ListView to display lost and found pets data
                    HStack {
                        ListView()
                    }
                    .frame(height: 450)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Network())
    }
}
