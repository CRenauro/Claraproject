//
//  HomeViewController.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/11/22.
//

import UIKit

class Downloader{
    class func downloadImageWithURL(url: String) -> UIImage{
        let data = NSData(contentsOf: NSURL(string: url)! as URL)
        return UIImage(data: data! as Data)!
        
    }
}

class HomeViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var users = [User]()

    @IBOutlet weak var userView: UITableView!
    let itemsPerBatch = 15
    var currentRow: Int = 1



    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.06274509804, green: 0.4470588235, blue: 0.7294117647, alpha: 1).cgColor, UIColor(red: 9/255, green: 168/255, blue: 157/255, alpha: 1).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5) // Left
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5) // Right
        
       
        
        userView.dataSource = self
        userView.delegate = self
        getUsersList()

    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(users.count)
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "User", for: indexPath) as! HomeTableViewCell
        
        cell.userName.text = "\(users[indexPath.row].first_name)  \(users[indexPath.row].last_name)"
        cell.userEmail.text = users[indexPath.row].email

        cell.userImage.image = Downloader.downloadImageWithURL(url: users[indexPath.row].avatar)

       
        print("here")
        return cell
    }
    

    func getUsersList()
    {
        if !Utilities.isNetworkAvailable()
        {
            showAlert(title: "No network", message: "No Network. Please check your connection")
        }
        showIndicator(message: "getting users")
        let userURL = URL(string: BASE_URL + USERS)!
        let userRequest = URLRequest(url: userURL, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        
        URLSession.shared.dataTask(with: userRequest){
            (data, response, error) in
            guard let Data = data, error==nil
            else
            {
                print(error as Any)
                return
            }
            if let httpStatus = (response as? HTTPURLResponse)
            {
                if(httpStatus.statusCode != 200)
                {
                    print(httpStatus.statusCode)
                    return
                }
            }
            DispatchQueue.main.async
            {
                    self.extractData(data: Data)
            }
        }.resume()
        
    }
    func extractData(data: Data)
    {
        print("got data")
        hideIndicator()
        let users = try? JSONDecoder().decode(Result.self, from: data)
        print(users?.total)
        self.users = users!.data
        userView.reloadData()
    }
   

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */
    
    
    //DEMO TO STOP SEGUE FUNCTION:
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        if userView.indexPathForSelectedRow?.row == 3 {
//            return false
//        }
//        return true
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue .identifier == "UserDetailSegue"
        {
        let userDetailViewController = segue.destination as!
            UserDetailViewController
        
        let indexPath = userView.indexPathForSelectedRow
        
        let userToSendToSecondView = users[indexPath!.row]
        
        userDetailViewController.user = userToSendToSecondView
        }
    }

}
