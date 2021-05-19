////
////  CharacterViewController.swift
////  fsgCodeChallenge
////
////  Created by Felipe Gil on 2021-04-30.
////
////
import UIKit

class CharacterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var charactersTableView: UITableView!
    
    var apiService = ApiService()
    var characters: [CharacterModel] = []
    var selectedCellIndex: Int = 0
    
    var imagesArray: [String] = []
    var namesArray: [String] = []
    var statusArray: [String] = []
    var speciesArray: [String] = []
    var typeArray: [String] = []
    var genderArray: [String] = []
    var createdArray: [String] = []
    var locationArray: [String] = []
    var originArray: [String] = []
    var characterNumber: Int = 21
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.charactersTableView.rowHeight = 64
        self.charactersTableView.dataSource = self
        self.charactersTableView.delegate = self
        
        let count = 1...20
        
        for number in count{
            loadData(number: number)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as?
                CharactersCellTableView else {
            return UITableViewCell()
        }
        let imageUrl = URL(string: imagesArray[indexPath.row])
        if imageUrl == nil {
            print("Error image path is Nil")
        }else{
            let imageData = try! Data(contentsOf: imageUrl!)
            cell.characterImage.image = UIImage(data: imageData)
        }
        
        cell.lblCharacterName.text = namesArray[indexPath.row]
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height {
            loadData(number: characterNumber)
            characterNumber += 1
        }
    }
    
    func loadData(number: Int){
        apiService.getData(Url: "https://rickandmortyapi.com/api/character/\(number)") { [weak self](dataFromAPI: CharacterModel) in
            guard let self = self else { return }
            self.characters = [dataFromAPI]
            self.imagesArray.append(dataFromAPI.image)
            self.namesArray.append(dataFromAPI.name)
            self.statusArray.append(dataFromAPI.status)
            self.speciesArray.append(dataFromAPI.species)
            self.typeArray.append(dataFromAPI.type)
            self.genderArray.append(dataFromAPI.gender)
            self.createdArray.append(dataFromAPI.created)
            self.originArray.append(dataFromAPI.origin.name)
            self.locationArray.append(dataFromAPI.location.name)
            self.charactersTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellIndex = indexPath.row
        let characterDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "CharacterDetailVC") as? CharacterDetailVC
        
        guard let imageUrl = URL(string: imagesArray[selectedCellIndex]),
              let data = try? Data(contentsOf: imageUrl),
              let image = UIImage(data: data)
              else { return }
        
        
        //TODO: remove DispatchQueue and replace with something correct
        #warning("TODO: remove DispatchQueue and replace with something correct")
        let characterViewModel = CharacterDetailViewModel(imgCharacter: image,
                                                          name: self.namesArray[self.selectedCellIndex],
                                                          status: self.statusArray[self.selectedCellIndex],
                                                          species: self.speciesArray[self.selectedCellIndex],
                                                          type: self.typeArray[self.selectedCellIndex],
                                                          gender: self.genderArray[self.selectedCellIndex],
                                                          origin: self.originArray[self.selectedCellIndex],
                                                          location: self.locationArray[self.selectedCellIndex],
                                                          created: self.createdArray[self.selectedCellIndex])
        characterDetailsViewController?.viewModel = characterViewModel
        
        self.navigationController?.pushViewController(characterDetailsViewController!, animated: true)
    }
}
