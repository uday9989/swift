//
//  ViewController.swift
//  NasaDataFetch
//
//  Created by Uday Vanaparthy on 02/02/22.
//

import UIKit
import SwiftUI

@available(iOS 13, *)
class Favourites: ObservableObject {
    var favs: [Int] = [Int]()
}

@available(iOS 13, *)
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ListView: UITableView!
    var photosArray = [NewPhotos]()
//    @EnvironmentObject var favourites: Favourites = Favourites()
    var favourites: Favourites = Favourites()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ListView.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getJson() { (json) in
            print(json)
            self.photosArray = json
            DispatchQueue.main.async { [self] in
                self.ListView.reloadData()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photosArray.count
    }
    
    func isFav(_ photo: NewPhotos) -> Bool {
        if let id = photo.id {
            return favourites.favs.contains(id)
        }
        return false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell") as? DataTableViewCell {
            if let data_dict = self.photosArray[indexPath.row] as? NewPhotos {
                cell.ID_Label.text = "ID: \(data_dict.id ?? 0)"
                cell.status_Label.text = "status: \(isFav(data_dict))"
                
                return cell
            } else {
                return UITableViewCell()
            }
        }
        return (UITableViewCell())
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let data_dict = self.photosArray[indexPath.row] as? NewPhotos {
            
            if let vc = storyboard?.instantiateViewController(withIdentifier: "detailsVC") as? DetailsViewController {
                    
                    vc.fav = isFav(data_dict)
                
                    DispatchQueue.main.async {
                        let URLStr = data_dict.img_src
                        let data = NSData(contentsOf: NSURL(string: URLStr!)! as URL)
                        vc.newImage = UIImage(data: data! as Data)
                        self.navigationController?.pushViewController(vc, animated: true)
                        }
                
            }
        }
    }
}



