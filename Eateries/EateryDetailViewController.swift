//
//  EateryDetailViewController.swift
//  Eateries
//
//  Created by Елена Позднякова on 07.06.2018.
//  Copyright © 2018 swiftbook. All rights reserved.
//

import UIKit

class EateryDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
