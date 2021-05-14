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
    var selectedIndex: Int!
    var selectedCharacters: [String] = []
    var apiService = ApiService()
    var episodes: [EpisodeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //QUESTION: Why I had to use DispatchQueue twice? I figure out how to solve the problem
        // but I dont know whats going on in here
        DispatchQueue.main.async {
            self.loadData(number: self.selectedIndex+1)
            DispatchQueue.main.async {
                self.pickerCharacters.dataSource = self
                self.pickerCharacters.delegate = self
            }
        }
    }
    
    func loadData(number: Int){
        apiService.getData(Url: "https://rickandmortyapi.com/api/episode/\(number)") { (dataFromAPI: EpisodeModel) in
            self.selectedCharacters.append(contentsOf: dataFromAPI.characters)
        }
    }
}
extension EpisodesDetailVC: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectedCharacters.count
    }
}
extension EpisodesDetailVC: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectedCharacters[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view {
            label = v as! UILabel
        }
        label.font = UIFont (name: "Helvetica Neue", size: 13)
        label.text =  selectedCharacters[row]
        label.textAlignment = .center
        return label
    }
}
