//
//  characterDetailVC.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-04-30.
//

import UIKit

class CharacterDetailVC: UIViewController {
    

    @IBOutlet weak var imgCharacter: UIImageView!

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblSpecies: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblOrigin: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblCreated: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

