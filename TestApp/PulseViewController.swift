
import UIKit
import SnapKit


class PulseViewController: UIViewController {
    
    @IBOutlet weak var button1Height: NSLayoutConstraint!
    @IBOutlet weak var button1Width: NSLayoutConstraint!
    
    @IBOutlet weak var button2Height: NSLayoutConstraint!
    @IBOutlet weak var button2Width: NSLayoutConstraint!
    
    @IBOutlet weak var button3Height: NSLayoutConstraint!
    @IBOutlet weak var button3Width: NSLayoutConstraint!
    
    @IBOutlet weak var button4Height: NSLayoutConstraint!
    @IBOutlet weak var button4Width: NSLayoutConstraint!
    
    @IBOutlet weak var button5Height: NSLayoutConstraint!
    @IBOutlet weak var button5Width: NSLayoutConstraint!
    
    var previouslySelected: Int = 0
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if previouslySelected != 0 {
            
            let button = self.view.viewWithTag(previouslySelected) as! UIButton
            buttonReset(ButtonNumber: previouslySelected, Button: button)
        }
        
        previouslySelected = sender.tag
        
        switch sender.tag {
            
        case 1: buttonSelect(ButtonNumber: 1, Button: sender, ButtonHeight: button1Height, ButtonWidth: button1Width)
            break
            
        case 2: buttonSelect(ButtonNumber: 2, Button: sender, ButtonHeight: button2Height, ButtonWidth: button2Width)
            break
            
        case 3: buttonSelect(ButtonNumber: 3, Button: sender, ButtonHeight: button3Height, ButtonWidth: button3Width)
            break
            
        case 4: buttonSelect(ButtonNumber: 4, Button: sender, ButtonHeight: button4Height, ButtonWidth: button4Width)
            break
            
        case 5: buttonSelect(ButtonNumber: 5, Button: sender, ButtonHeight: button5Height, ButtonWidth: button5Width)
            break
            
        default: break
        }
    }
}


private extension PulseViewController {
    
    func buttonReset(ButtonNumber: Int, Button: UIButton) {
        
        Button.setImage(UIImage(named: "pulse\(ButtonNumber)_unselected"), for: .normal)
        
        Button.snp.updateConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        Button.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    func buttonSelect(ButtonNumber: Int, Button: UIButton, ButtonHeight: NSLayoutConstraint, ButtonWidth: NSLayoutConstraint) {
        
        Button.setImage(UIImage(named: "pulse\(ButtonNumber)_selected"), for: .normal)
        
        UIView.animate(withDuration: 0.2) {
            
            if (ButtonHeight.constant == 50) {
                ButtonHeight.constant += 25
            }
            
            if (ButtonWidth.constant == 50) {
                ButtonWidth.constant += 25
            }
            
            self.view.layoutIfNeeded()
        }
        
        Button.layer.shadowColor = UIColor.orange.cgColor
        Button.layer.shadowOffset = CGSize(width: 15, height: 15)
        
    }
}
