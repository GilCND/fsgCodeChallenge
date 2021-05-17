//
//  locationViewController.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-04-30.
//

import UIKit

class LocationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{ 
    @IBOutlet weak var locationTableView: UITableView!
    
    var apiService = ApiService()
    var location: [LocationModel] = []
    var selectedCellIndex: Int = 0
    var namesArray: [String] = []
    var typeArray: [String] = []
    var dimensionArray: [String] = []
    var residentsArray: [String] = []
    var urlArray: [String] = []
    var createdArray: [String] = []
    var locationNumber: Int = 21
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationTableView.rowHeight = 64
        self.locationTableView.dataSource = self
        self.locationTableView.delegate = self
        
        let count = 1...20
        
        for number in count{
            loadData(number: number)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as?
                LocationCellTableView else {
            return UITableViewCell()
        }
        cell.lblLocationName.text = namesArray[indexPath.row]
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height {
            loadData(number: locationNumber)
            locationNumber += 1
        }
    }
    
    func loadData(number: Int){
        apiService.getData(Url: "https://rickandmortyapi.com/api/location/\(number)") { [weak self] (dataFromAPI: LocationModel) in
            guard let self = self else { return }
            self.location = [dataFromAPI]
            self.namesArray.append(dataFromAPI.name)
            self.typeArray.append(dataFromAPI.type)
            self.dimensionArray.append(dataFromAPI.dimension)
            //self.residentsArray.append(dataFromAPI.residents)
            self.urlArray.append(dataFromAPI.url)
            self.createdArray.append(dataFromAPI.created)
            self.locationTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellIndex = indexPath.row
        let LocationDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "LocationDetailVC") as? LocationDetailVC
        //TODO: remove DispatchQueue and replace with something correct
        DispatchQueue.main.async {
            LocationDetailsViewController?.lblCreated.text = self.createdArray[self.selectedCellIndex]
            LocationDetailsViewController?.lblName.text = self.namesArray[self.selectedCellIndex]
            LocationDetailsViewController?.lblType.text = self.typeArray[self.selectedCellIndex]
            LocationDetailsViewController?.lblDimension.text = self.dimensionArray[self.selectedCellIndex]
            LocationDetailsViewController?.lblUrl.text = self.urlArray[self.selectedCellIndex]
            LocationDetailsViewController?.lblCreated.text = self.createdArray[self.selectedCellIndex]
            LocationDetailsViewController?.selectedIndex = self.selectedCellIndex
        }
        
        self.navigationController?.pushViewController(LocationDetailsViewController!, animated: true)
    }
}
