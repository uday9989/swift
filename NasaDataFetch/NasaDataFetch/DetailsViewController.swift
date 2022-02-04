//
//  DetailsViewController.swift
//  NasaDataFetch
//
//  Created by Uday Vanaparthy on 02/02/22.
//

import Foundation
import UIKit
import SwiftUI

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var marsImageView: UIImageView!
    
    var newImage: UIImage!
    var fav: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if fav {
            statusSwitch.setOn(true, animated: false)
            
        } else { statusSwitch.setOn(false, animated: false) }
        
        marsImageView.image = newImage
        statusSwitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)
    }
    
    @objc func switchValueDidChange(sender:UISwitch!) {
        print(sender.isOn)
    }

}



