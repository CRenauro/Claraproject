//
//  UserDetailViewController.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/4/22.
//

import UIKit

//class Downloader{
//    class func downloadImageWithURL(url: String) -> UIImage{
//        let data = NSData(contentsOf: NSURL(string: url)! as URL)
//        return UIImage(data: data! as Data)!
//
//    }
//}


class UserDetailViewController: UIViewController {
    
    var user: User?
  
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "User Detail"
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor, UIColor(red: 9/255, green: 168/255, blue: 157/255, alpha: 1).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5) // Left
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5) // Right
         
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         
        cardView.layer.cornerRadius = 12
        cardView.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor).cgColor
        cardView.layer.borderWidth = 2.0

        self.userImage.layer.cornerRadius=self.userImage.frame.size.width/2
        self.userImage.clipsToBounds = true
        self.userImage.layer.borderColor = UIColor(cgColor: #colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor).cgColor
        self.userImage.layer.borderWidth = 2
        
        self.navigationController?.navigationBar.tintColor = UIColor.systemGreen
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        userName.text = user!.first_name + "" + user!.last_name
        userEmail.text = user!.email
        userImage.image = Downloader.downloadImageWithURL(url: user!.avatar)
        
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
