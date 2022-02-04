//
//  DataTableViewCell.swift
//  NasaDataFetch
//
//  Created by Uday Vanaparthy on 02/02/22.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet var status_Label: UILabel!
    @IBOutlet var ID_Label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
