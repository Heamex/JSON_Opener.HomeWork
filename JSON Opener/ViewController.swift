//
//  ViewController.swift
//  JSON Opener
//
//  Created by Nikita Belov on 09.02.23.
//

import UIKit

class ViewController: UIViewController {
	
	private var unpacker: Unpacker?

	override func viewDidLoad() {
		super.viewDidLoad()
		
		unpacker = Unpacker()
		
		let data = unpacker?.getJsonData()
		if let jsonString = unpacker?.getJsonString() {
			let movie = unpacker?.getMovie(from: jsonString)
			print(movie)
		}
	}


}

