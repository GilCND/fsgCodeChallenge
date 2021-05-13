//
//  EpisodesDetailVC.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-05-07.
//

import UIKit

class EpisodesDetailVC: UIViewController{

    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAirDate: UILabel!
    @IBOutlet weak var lblEpisode: UILabel!
    @IBOutlet weak var pickerCharacters: UIPickerView!
    @IBOutlet weak var lblCreated: UILabel!
    var selectedCharacters: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
