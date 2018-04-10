

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var ivCompassBack: UIImageView!
    @IBOutlet weak var ivCompassNeedle: UIImageView!
    
    var compassManager  : CompassDirectionManager!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        compassManager =  CompassDirectionManager(dialerImageView: ivCompassBack, pointerImageView: ivCompassNeedle)
        compassManager.initManager()
    }
}

