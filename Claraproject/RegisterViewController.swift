//
//  RegisterViewController.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/1/22.
//

import UIKit

class RegisterViewController: UIViewController {
    

    @IBOutlet weak var clickButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor, UIColor(red: 9/255, green: 168/255, blue: 157/255, alpha: 1).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5) // Left
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5) // Right
        // Do any additional setup after loading the view.
    }

    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func `switch`(_ sender: UISwitch) {
        
        if (sender.isOn == true){
            clickButton.isEnabled = true
        } else {
            clickButton.isEnabled = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
