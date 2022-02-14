//
//  ProfileViewController.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/3/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIView!

    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var logOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor, UIColor(red: 9/255, green: 168/255, blue: 157/255, alpha: 1).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5) // Left
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5) // Right

    }

    
    override func viewWillAppear(_ animated: Bool) {
        cardView.layer.cornerRadius = 12
        cardView.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor).cgColor
        cardView.layer.borderWidth = 2.0
        //Image view 100x100
        //Radius 50
        self.imageView.layer.cornerRadius=self.imageView.frame.size.width/2
        self.imageView.clipsToBounds = true
        self.imageView.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor).cgColor
        self.imageView.layer.borderWidth = 2
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    

    @IBAction func logOut(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
