
import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var segment: SegmentView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
    
        segment.delegate = self
        
        }
    }

extension ViewController: SegmentViewDelegate{
    func clickView(_ info: String) {
        
        print(info)
    }
}
