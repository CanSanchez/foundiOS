import Foundation
import SwiftUI
import CoreLocation
import CoreLocationUI
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    override func viewDidLoad() {
        manager.delegate = self
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
}

struct TestView: View {
    @StateObject var locationManager = LocationManager()

    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your location: \(location.latitude), \(location.longitude)")
            }

            LocationButton {
                locationManager.requestLocation()
            }
            .frame(height: 44)
            .padding()
        }
    }
}

#Preview {
    TestView()
}
