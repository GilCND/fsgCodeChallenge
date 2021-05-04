//
//  characterDetailVC.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-04-30.
//

import UIKit

class characterDetailVC: UIViewController {

    //Images
    @IBOutlet weak var imgCharacter: UIImageView!
    
    
    //Labels
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    @IBOutlet weak var lblSpecies: UILabel!
    
    @IBOutlet weak var lblType: UILabel!
    
    @IBOutlet weak var lblGender: UILabel!
    
    @IBOutlet weak var lblOrigin: UILabel!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblCreated: UILabel!
    
    //Variables
    var selectedCharacterId: Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
