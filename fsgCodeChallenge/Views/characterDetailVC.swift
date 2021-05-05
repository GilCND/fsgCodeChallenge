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
    var selectedImage: UIImage!
    var selectedName: String!
    var selecteStatus: String!
    var selectedSpecies: String!
    var selectedType: String!
    var selectedGender: String!
    var selectedCreated: String!
    var selectedLocation: String!
    var selectedOrigin: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgCharacter.image = selectedImage
        lblName.text = selectedName
        lblStatus.text = selecteStatus
        lblSpecies.text = selectedSpecies
        lblType.text = selectedType
        lblGender.text = selectedGender
        lblOrigin.text = selectedOrigin
        lblLocation.text = selectedLocation
        lblCreated.text = selectedCreated
    }
}
