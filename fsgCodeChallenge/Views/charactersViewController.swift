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
    var convertedImage: UIImage?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.charactersTableView.rowHeight = 64
        self.charactersTableView.dataSource = self
        self.charactersTableView.delegate = self
        
        //TODO: Implement pagination
        //TODO: Implement loop or method to load parts of data at a time

        //Load Data
        apiService.getData(Url: "https://rickandmortyapi.com/api/character/1") { (dataFromAPI: CharacterModel) in
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
        
        print ("Here should be an image address")
        for element in self.imagesArray {
            print(element)
        }
        print ("Here should be a name")
        for element in self.namesArray {
            print(element)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = charactersTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //Get images to the list
        let image = cell.viewWithTag(1) as! UIImageView
        let imageUrl = URL(string: imagesArray[indexPath.row])
        if imageUrl == nil {
            print("Error image path is Nil")
        }else{
            let imageData = try! Data(contentsOf: imageUrl!)
            image.image = UIImage(data: imageData)
            convertedImage = UIImage(data: imageData)!
        }
        //names
        //TODO: Implement Guard
        
        let name = cell.viewWithTag(2) as? UILabel
        name?.text = namesArray[indexPath.row]
        //inflate cell
        return cell
    }
    
    //pass data
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellIndex = indexPath.row
        self.performSegue(withIdentifier: "segueShowSelectedCharacter", sender: nil)
    }
    
    //create an object with the ID selected
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueShowSelectedCharacter",
        let viewController = segue.destination as? characterDetailVC  {
            viewController.selectedImage = convertedImage
            viewController.selectedName = namesArray[selectedCellIndex]
            viewController.selecteStatus = statusArray[selectedCellIndex]
            viewController.selectedSpecies = speciesArray[selectedCellIndex]
            viewController.selectedType = typeArray[selectedCellIndex]
            viewController.selectedGender = genderArray[selectedCellIndex]
            viewController.selectedCreated = createdArray[selectedCellIndex]
            viewController.selectedLocation = locationArray[selectedCellIndex]
            viewController.selectedOrigin = originArray[selectedCellIndex]
        }
    }
}

