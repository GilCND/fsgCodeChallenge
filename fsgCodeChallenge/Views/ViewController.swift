//
//  ViewController.swift
//  fsgCodeChallenge
//
//  Created by Felipe Gil on 2021-04-29.
//

import UIKit


class ViewController: UITabBarController {

    var apiService = ApiService()
    var characters: [CharacterModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
