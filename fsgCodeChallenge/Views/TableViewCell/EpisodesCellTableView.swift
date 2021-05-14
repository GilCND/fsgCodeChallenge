//
//  EpisodesCellTableView.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-05-13.
//

import UIKit

class EpisodesCellTableView: UITableViewCell {
    
    @IBOutlet weak var lblEpisodeName: UILabel!
    
    var model: EpisodeModel? {
        didSet{
            //label.text = model?.name
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //initialization code here
    }
    override func setSelected(_ selected:Bool, animated:Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
