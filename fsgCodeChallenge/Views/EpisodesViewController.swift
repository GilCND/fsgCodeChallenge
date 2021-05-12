//
//  episodesViewController.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-04-30.
//
import UIKit

class EpisodesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var episodesTableView: UITableView!

        var apiService = ApiService()
        var episodes: [EpisodeModel] = []
        var selectedCellIndex: Int = 0
    
        
        var namesArray: [String] = []
        var airDateArray: [String] = []
        var episodeArray: [String] = []
        var charactersArray: [String] = []
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

    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return namesArray.count
        }


    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = episodesTableView.dequeueReusableCell (withIdentifier: "Cell", for: indexPath)

            let name = cell.viewWithTag(2) as? UILabel
            name?.text = namesArray[indexPath.row]

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
            apiService.getData(Url: "https://rickandmortyapi.com/api/episode/\(number)") { (dataFromAPI: EpisodeModel) in
                self.episodes = [dataFromAPI]
                self.namesArray.append(dataFromAPI.name)
                self.airDateArray.append(dataFromAPI.airDate)
                self.episodeArray.append(dataFromAPI.episode)
                //self.charactersArray.append(dataFromAPI.characters[number])
                self.createdArray.append(dataFromAPI.created)
                self.episodesTableView.reloadData()

            }
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedCellIndex = indexPath.row
            self.performSegue(withIdentifier: "segueShowSelectedEpisode", sender: nil)
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "segueShowSelectedEpisode",
               let viewController = segue.destination as? EpisodesDetailVC {
                viewController.selectedName = namesArray[selectedCellIndex]
                viewController.selectedAirDate = airDateArray[selectedCellIndex]
                viewController.selectedEpisodes = episodeArray[selectedCellIndex]
                viewController.selectedCreated = createdArray[selectedCellIndex]

            }
        }
    }
