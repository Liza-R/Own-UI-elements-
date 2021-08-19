
import UIKit

@IBDesignable
class ClockView_2: UIView {
    
    var isSetuped = false,
    
    markerSize_Big: CGFloat = 6,
    markerSize_Little: CGFloat = 4,
    
    markerLenght: CGFloat = 12,
    markerLittleLenght: CGFloat = 8,
    
    markerColor = UIColor.white,
    
    roudColor = UIColor.white,

    hourHandOffset: CGFloat = 20,
    minutsHandOffset: CGFloat = 10,
    secundsHandOffset: CGFloat = 5
    
    private let topMarker_Big = UIView(),
    leftMarker_Big = UIView(),
    rightMarker_Big = UIView(),
    bottomMarker_Big = UIView(),
    
    hourLine = UIView(),
    minutLine = UIView(),
    secundLine = UIView(),
       
    roudView = UIView()
    
    @IBInspectable var hour: CGFloat = 12{
         didSet{
             layoutIfNeeded()
         }
     }
    
    @IBInspectable var minute: CGFloat = 23{
        didSet{
            layoutIfNeeded()
        }
    }
    
    @IBInspectable var second: CGFloat = 5{
        didSet{
            layoutIfNeeded()
        }
    }

    @IBInspectable var hourHandSize: CGFloat = 8{
        didSet{
            layoutIfNeeded()
           }
       }
       
      @IBInspectable var minutsHandSize: CGFloat = 6{
       didSet{
          layoutIfNeeded()
          }
      }
    
      @IBInspectable var secundsHandSize: CGFloat = 4{
       didSet{
          layoutIfNeeded()
          }
      }
    
    @IBInspectable var secondsHandColor: UIColor = .purple{
        didSet{
            secundLine.backgroundColor =  secondsHandColor
        }
    }
    
    @IBInspectable var minutesHandColor: UIColor = .black{
        didSet{
            minutLine.backgroundColor =  minutesHandColor
        }
    }
    
    @IBInspectable var hoursHandColor: UIColor = .black{
        didSet{
            hourLine.backgroundColor =  hoursHandColor
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
        let w = frame.size.width,
        h = frame.size.height
         
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        hourLine.frame = CGRect(x: w / 2 - hourHandSize / 2, y: hourHandOffset, width: hourHandSize, height: h / 2 - hourHandOffset)
        updateHours()
        
        minutLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minutLine.frame = CGRect(x: w / 2 - minutsHandSize / 2, y: minutsHandOffset, width: minutsHandSize, height: h / 2 - minutsHandOffset)
        updateMinuts()
        
        secundLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secundLine.frame = CGRect(x: w / 2 - secundsHandSize / 2, y: secundsHandOffset, width: secundsHandSize, height: h / 2 - secundsHandOffset)
        updateSeconds()
         
        roudView.frame = CGRect(x: w / 2 - 10, y: h / 2 - 10, width: 20, height: 20)
        roudView.layer.cornerRadius = 10
        roudView.backgroundColor = roudColor

        topMarker_Big.frame = CGRect(x: w / 2 - markerSize_Big / 2, y: 0, width: markerSize_Big, height: markerLenght)
        leftMarker_Big.frame = CGRect(x: 0, y: h / 2 - markerSize_Big / 2, width: markerLenght, height: markerSize_Big)
        rightMarker_Big.frame = CGRect(x: w - markerLenght, y: h / 2 - markerSize_Big / 2, width: markerLenght, height: markerSize_Big)
        bottomMarker_Big.frame = CGRect(x: w / 2 - markerSize_Big / 2, y: h - markerLenght, width: markerSize_Big, height: markerLenght)
        
        for v in [topMarker_Big, leftMarker_Big, rightMarker_Big, bottomMarker_Big ]{
             v.backgroundColor = markerColor
         }
         
        layer.cornerRadius = frame.size.width / 2
         
        if isSetuped {return}
        isSetuped = true
         
        for v in [topMarker_Big, leftMarker_Big, rightMarker_Big, bottomMarker_Big,
             
            hourLine, minutLine, secundLine, roudView]{
                addSubview(v)
         }
    }
     
    func updateHours(){
        let angle_hour = CGFloat.pi * 2 * (hour / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle_hour)
    }
    
    func updateMinuts(){
        let angle_minute = CGFloat.pi * 2 * (minute / CGFloat(60))
        minutLine.transform = CGAffineTransform(rotationAngle: angle_minute)
    }
    
    func updateSeconds(){
        let angle_second = CGFloat.pi * 2 * (second / CGFloat(60))
        secundLine.transform = CGAffineTransform(rotationAngle: angle_second)
    }
}
