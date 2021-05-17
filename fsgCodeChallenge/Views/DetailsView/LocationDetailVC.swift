//
//  LocationDetailVC.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-05-17.
//

import UIKit

class LocationDetailVC: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblDimension: UILabel!
    @IBOutlet weak var lblUrl: UILabel!
    @IBOutlet weak var lblCreated: UILabel!
    @IBOutlet weak var pickerLocation: UIPickerView!
    
    var selectedIndex: Int = 0 {
        didSet {
            self.loadData(number: self.selectedIndex)
        }
    }
    var selectedLocation: [String] = []
    var apiService = ApiService()
    var episodes: [EpisodeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerLocation.dataSource = self
        self.pickerLocation.delegate = self
    }
    
    func loadData(number: Int) {
        apiService.getData(Url: "https://rickandmortyapi.com/api/episode/\(number)") { [weak self] (dataFromAPI: EpisodeModel) in
            guard let self = self else { return }
            self.selectedLocation.append(contentsOf: dataFromAPI.characters)
            self.pickerLocation.reloadAllComponents()
        }
    }
}
extension LocationDetailVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectedLocation.count
    }
}
extension LocationDetailVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectedLocation[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view {
            label = v as! UILabel
        }
        label.font = UIFont (name: "Helvetica Neue", size: 13)
        label.text =  selectedLocation[row]
        label.textAlignment = .center
        return label
    }
}
