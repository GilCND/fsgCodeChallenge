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
    var tempImage: String = ""
    var tempName: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.charactersTableView.dataSource = self
        self.charactersTableView.delegate = self
        

        //load data!
        apiService.getCharacters { (dataFromAPI) in
            self.characters = [dataFromAPI]
            self.tempImage = dataFromAPI.image
            self.tempName = dataFromAPI.name
            self.imagesArray.append(self.tempImage)
            self.namesArray.append(self.tempName)
            self.charactersTableView.reloadData()
       }
       // DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        // Added a delay time
        
            print ("Here should be an image address")
            print(self.tempImage)
            for element in self.imagesArray {
                print(element)
            }
            print ("Here should be a name")
            print(self.tempName)
            for element in self.namesArray {
            print(element)

          //  }

        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return namesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = charactersTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        //get images to the list

        let image = cell.viewWithTag(1) as! UIImageView

        //images
        image.image = UIImage(named: imagesArray[indexPath.row])
        //let image = imagesArray.object(at: indexPath.row) as? String
        print ("Here should be a name inside the table")
        print(self.tempName)
        for element in self.namesArray {
            print(element)}
            
        //names
        let name = cell.viewWithTag(2) as! UILabel
        name.text = namesArray[indexPath.row]
        

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
        if (segue.identifier == "segueShowSelectedCharacter"){
        let vc = segue.destination as! characterDetailVC
       //     vc.selectedCharacterId = characters.object(at: selectedCellIndex)as? Int
        }
    }
}

