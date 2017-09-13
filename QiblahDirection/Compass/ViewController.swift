

import UIKit
import CoreLocation

class ViewController: UIViewController ,CLLocationManagerDelegate{
    
    @IBOutlet weak var ivCompassBack: UIImageView!
    @IBOutlet weak var ivCompassNeedle: UIImageView!
    
    let latOfKabah = 21.4225
    let lngOfKabah = 39.8262
    
    var location: CLLocation?
    
    let locationManager = CLLocationManager()
    
    
    var bearingOfKabah = Double()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        initManager()
        
    }
    
    
    func initManager(){
        
        locationManager.requestAlwaysAuthorization()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
        
        
        let north = -1 * heading.magneticHeading * Double.pi/180
        
        let directionOfKabah = bearingOfKabah * Double.pi/180 + north
        
        ivCompassBack.transform = 	CGAffineTransform(rotationAngle: CGFloat(north));
        
        ivCompassNeedle.transform =       CGAffineTransform(rotationAngle: CGFloat(directionOfKabah));
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation = locations.last!
        
        location = newLocation
        
        bearingOfKabah = getBearingBetweenTwoPoints1(location!, latitudeOfKabah: self.latOfKabah, longitudeOfKabah: self.lngOfKabah) //calculating the bearing of KABAH
    }
    
    
    func degreesToRadians(_ degrees: Double) -> Double { return degrees * Double.pi / 180.0 }
    
    
    func radiansToDegrees(_ radians: Double) -> Double { return radians * 180.0 / Double.pi }
    
    func getBearingBetweenTwoPoints1(_ point1 : CLLocation, latitudeOfKabah : Double , longitudeOfKabah :Double) -> Double {
        
        let lat1 = degreesToRadians(point1.coordinate.latitude)
        let lon1 = degreesToRadians(point1.coordinate.longitude)
        
        let lat2 = degreesToRadians(latitudeOfKabah);
        let lon2 = degreesToRadians(longitudeOfKabah);
        
        let dLon = lon2 - lon1;
        
        let y = sin(dLon) * cos(lat2);
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
        var radiansBearing = atan2(y, x);
        if(radiansBearing < 0.0){
            
            radiansBearing += 2 * Double.pi;
            
        }
        
        return radiansToDegrees(radiansBearing)
    }
    
}
