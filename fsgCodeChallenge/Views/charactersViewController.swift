////
////  charactersViewController.swift
////  fsgCodeChallenge
////
////  Created by Felipe Gil on 2021-04-30.
////
////
import UIKit

class charactersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        apiService.getData(Url: "https://rickandmortyapi.com/api/character/\(number)") { (dataFromAPI: CharacterModel) in
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
        let CharacterDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "CharacterDetailVC") as? CharacterDetailVC
        guard let imageUrl = URL(string: imagesArray[selectedCellIndex]) else {return}
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageUrl)
            DispatchQueue.main.async {
                CharacterDetailsViewController?.imgCharacter.image = UIImage(data: data!)
                CharacterDetailsViewController?.lblCreated.text = self.createdArray[self.selectedCellIndex]
                CharacterDetailsViewController?.lblName.text = self.namesArray[self.selectedCellIndex]
                CharacterDetailsViewController?.lblStatus.text = self.statusArray[self.selectedCellIndex]
                CharacterDetailsViewController?.lblSpecies.text = self.speciesArray[self.selectedCellIndex]
                CharacterDetailsViewController?.lblType.text = self.typeArray[self.selectedCellIndex]
                CharacterDetailsViewController?.lblGender.text = self.genderArray[self.selectedCellIndex]
                CharacterDetailsViewController?.lblCreated.text = self.createdArray[self.selectedCellIndex]
                CharacterDetailsViewController?.lblLocation.text = self.locationArray[self.selectedCellIndex]
                CharacterDetailsViewController?.lblOrigin.text = self.originArray[self.selectedCellIndex]
            }
        }
        
        self.navigationController?.pushViewController(CharacterDetailsViewController!, animated: true)
    }
}

