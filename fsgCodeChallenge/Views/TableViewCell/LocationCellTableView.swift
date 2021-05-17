//
//  LocationCellTableView.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-05-17.
//

import UIKit

class LocationCellTableView: UITableViewCell {

    @IBOutlet weak var lblLocationName: UILabel!
    
    var model: LocationModel? {
        didSet{
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
