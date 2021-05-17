//
//  episodesViewController.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-04-30.
//
import UIKit

class EpisodesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var episodesTableView: UITableView!
    
    var apiService = ApiService()
    var episodes: [EpisodeModel] = []
    var selectedCellIndex: Int = 0
    
    var namesArray: [String] = []
    var airDateArray: [String] = []
    var episodeArray: [String] = []
    var charactersArray: [[String]] = []
    var charactersIndex: [Int] = []
    var createdArray: [String] = []
    var episodesNumber = 21
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.episodesTableView.rowHeight = 64
        self.episodesTableView.dataSource = self
        self.episodesTableView.delegate = self
        
        let count = 1...20
        
        for number in count{
            loadData(number: number)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as?
                EpisodesCellTableView else {
            return UITableViewCell()
        }
        cell.lblEpisodeName.text = namesArray[indexPath.row]
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height {
            loadData(number: episodesNumber)
            episodesNumber += 1
        }
    }
    
    func loadData(number: Int){
        apiService.getData(Url: "https://rickandmortyapi.com/api/episode/\(number)") { [weak self] (dataFromAPI: EpisodeModel) in
            guard let self = self else { return }
            self.episodes = [dataFromAPI]
            self.namesArray.append(dataFromAPI.name)
            self.airDateArray.append(dataFromAPI.airDate)
            self.episodeArray.append(dataFromAPI.episode)
            self.createdArray.append(dataFromAPI.created)
            self.charactersIndex.append(dataFromAPI.id)
            self.episodesTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellIndex = indexPath.row
        let EpisodeDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "EpisodesDetailVC") as? EpisodesDetailVC
        //TODO: remove DispatchQueue and replace with something correct
        DispatchQueue.main.async {
            EpisodeDetailsViewController?.lblCreated.text = self.createdArray[self.selectedCellIndex]
            EpisodeDetailsViewController?.lblName.text = self.namesArray[self.selectedCellIndex]
            EpisodeDetailsViewController?.lblAirDate.text = self.airDateArray[self.selectedCellIndex]
            EpisodeDetailsViewController?.lblEpisode.text = self.episodeArray[self.selectedCellIndex]
            EpisodeDetailsViewController?.selectedIndex = self.selectedCellIndex
            EpisodeDetailsViewController?.lblCreated.text = self.createdArray[self.selectedCellIndex]
        }
        
        self.navigationController?.pushViewController(EpisodeDetailsViewController!, animated: true)
    }
}
