
import UIKit

protocol SegmentViewDelegate: AnyObject{
    func clickView(_ info: String)
}

@IBDesignable
class SegmentView: UIView {

    var isSetuped = false

   weak var delegate: SegmentViewDelegate?
    
    var segment_info = ""
    
    private let firstSegment = UIView(),
    secondSegment = UIView(),
    backView = UIView(),
    label_1 = UILabel(),
    label_2 = UILabel()
    
    var gesture_1 = UITapGestureRecognizer(),
    gesture_2 = UITapGestureRecognizer()

    @IBInspectable var backColor: UIColor = .systemBlue{
        didSet{
            backView.backgroundColor = backColor
        }
    }
    
    @IBInspectable var groundViewColor: UIColor = .systemGray{
          didSet{
            backgroundColor = groundViewColor
          }
      }
    
    @IBInspectable var setTitle_1: String = "# 1"{
        didSet{
            label_1.text = setTitle_1
        }
    }
    
    @IBInspectable var setTitle_2: String = "# 2"{
        didSet{
           label_2.text = setTitle_2
        }
    }
  
    override func prepareForInterfaceBuilder() {
         super.prepareForInterfaceBuilder()
         
         updateViews()
     }
     
     override func awakeFromNib() {
         super.awakeFromNib()
         
         updateViews()
     }
    
func updateViews(){
  
        gesture_1 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        gesture_2 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.firstSegment.addGestureRecognizer(gesture_1)
       self.secondSegment.addGestureRecognizer(gesture_2)
        
      backView.frame = CGRect(x: 0, y: 0, width: frame.size.width / 2, height: frame.size.height)
        checkAction(gesture_1)
    
        layer.cornerRadius = 20.0
    
        if isSetuped {return}
        isSetuped = true
        
        for v in [backView, firstSegment, secondSegment]{
                   addSubview(v)
        }
        
    }
    
    
    @objc func checkAction(_ sender: UITapGestureRecognizer){

        let w = frame.size.width,
        h = frame.size.height
        
        if sender === gesture_1{
        
        firstSegment.frame = CGRect(x: 5, y: 5, width: w / 2 - 10, height: h - 10)
        firstSegment.backgroundColor = .white
        firstSegment.layer.cornerRadius = 20.0
            
        label_1.frame = CGRect(x: 0, y: h / 4, width: w / 2 - 10, height: 30)
        label_1.textColor = .black
        label_1.textAlignment = .center
        firstSegment.addSubview(label_1)
         
        secondSegment.frame = CGRect(x: w / 2 + 10, y: 10, width: w / 2 - 20, height: h - 20)
        secondSegment.backgroundColor = .white
        secondSegment.layer.cornerRadius = 20.0
         
        label_2.frame = CGRect(x: 0, y: h / 4, width: w / 2 - 20, height: 20)
        label_2.textColor = .gray
        label_2.textAlignment = .center
        secondSegment.addSubview(label_2)
            
        UIView.animate(withDuration: 1){
            self.backView.frame = CGRect(x: 0, y: 0, width: w / 2, height: h)
            }

        backView.layer.cornerRadius = 20.0
            
            segment_info = "1 segment selected"
        delegate?.clickView(segment_info)
            
        }else if sender === gesture_2{
            firstSegment.frame = CGRect(x: 10, y: 10, width: w / 2 - 20, height: h - 20)
            firstSegment.backgroundColor = .white
            firstSegment.layer.cornerRadius = 20.0
            
            label_1.frame = CGRect(x: 0, y: h / 4, width: w / 2 - 20, height: 20)
            label_1.textColor = .gray
            label_1.textAlignment = .center
            firstSegment.addSubview(label_1)
            
            secondSegment.frame = CGRect(x: w / 2 + 5, y: 5, width: w / 2 - 10, height: h - 10)
            secondSegment.backgroundColor = .white
            secondSegment.layer.cornerRadius = 20.0
            
            label_2.frame = CGRect(x: 0, y: h / 4, width: w / 2 - 10, height: 30)
            label_2.textColor = .black
            label_2.textAlignment = .center
            secondSegment.addSubview(label_2)
           
            UIView.animate(withDuration: 1){
            self.backView.frame = CGRect(x: w / 2, y: 0, width: w / 2, height: h)
            }
            self.backView.layer.cornerRadius = 20.0

            segment_info = "2 segment selected"
            delegate?.clickView(segment_info)
            
            }else{
                print("error in buttons!")
        }
    }
}

