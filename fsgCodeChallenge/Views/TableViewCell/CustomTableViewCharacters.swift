//
//  CustomTableViewCharacters.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-05-10.
//

import UIKit
	
class CustomTableViewCharacters: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    var imageAddress: String = ""
        var model: CharacterModel? {
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
