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
    //Variables
    var selectedName: String!
    var selectedAirDate: String!
    var selectedEpisodes: String!
    var selectedCharacters: [String] = [String]()
    var selectedCreated: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
//               self.pickerCharacters.delegate = self
//               self.pickerCharacters.dataSource = self
        
        
        lblName.text = selectedName
        //lblAirDate.text = selectedAirDate
        lblEpisode.text = selectedEpisodes
        lblCreated.text = selectedCreated

    }


}
//extension EpisodesDetailVC: UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 10
//
//        //return selectedCharacters.count
//    }
//
//}
//extension EpisodesDetailVC: UIPickerViewDelegate {
//
//    func pickerView	(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return "test"
//    }
//}
