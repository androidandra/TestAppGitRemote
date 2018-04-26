import UIKit
import SnapKit


class PulseViewController: UIViewController {
    
    var gitUpdateVariable1 = 0
    var gitUpdateVariable2 = "Hello World!"
    
    var previouslySelected: Int = 0
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if previouslySelected != 0 {
            
            let button = self.view.viewWithTag(previouslySelected) as! UIButton
            buttonReset(ButtonNumber: previouslySelected, Button: button)
        }
        
        previouslySelected = sender.tag
        buttonSelect(ButtonNumber: previouslySelected, Button: sender)
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
    
    func buttonSelect(ButtonNumber: Int, Button: UIButton) {
        
        Button.setImage(UIImage(named: "pulse\(ButtonNumber)_selected"), for: .normal)
        
        UIView.animate(withDuration: 0.2) {
            
            Button.snp.updateConstraints { (make) in
                make.width.equalTo(75)
                make.height.equalTo(75)
            }
            
            self.view.layoutIfNeeded()
        }
        
        Button.layer.shadowColor = UIColor.orange.cgColor
        Button.layer.shadowOffset = CGSize(width: 15, height: 15)
        
    }
}
