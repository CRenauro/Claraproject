//
//  LoginViewController.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/1/22.
//

import UIKit

class LoginViewController: UIViewController {
    

    @IBOutlet weak var loginView: UIView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor, UIColor(red: 9/255, green: 168/255, blue: 157/255, alpha: 1).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5) // Left
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5) // Right

    }
    
    override var shouldAutorotate: Bool {
           return false
       }
    override func viewWillAppear(_ animated: Bool) {
        loginView.layer.cornerRadius = 12
        loginView.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor).cgColor
        loginView.layer.borderWidth = 2.0
        //Image view 100x100
        //Radius 50
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
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
