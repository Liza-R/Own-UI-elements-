
import UIKit

@IBDesignable
class ButtonClass_1: UIButton{
    
    @IBInspectable var borderWidth: CGFloat = 2{
        didSet{
            layer.borderWidth = borderWidth
            layoutIfNeeded()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 10{
        didSet{
        layer.cornerRadius = cornerRadius
            layoutIfNeeded()
        }
    }
    
    @IBInspectable var borderColor: UIColor = .white{
        didSet{
        layer.borderColor = borderColor.cgColor
            layoutIfNeeded()
        }
    }
    
override func layoutSubviews() {
    titleLabel?.text = "BUTTON"
    }
    
    
}
