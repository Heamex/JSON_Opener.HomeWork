//
//  Unpacker.swift
//  JSON Opener
//
//  Created by Nikita Belov on 09.02.23.
//

import UIKit

class Unpacker {
	
	
	func showPath () {
		//		if let fileDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask). {
		//			print(fileDirectory)
		//		}
		print(NSHomeDirectory())
	}
	func getJsonString() -> String {
		var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
		let fileName = "inception.json"
		documentsURL.appendPathComponent(fileName)
		let jsonString = try? String(contentsOf: documentsURL)
		let data = jsonString!.data(using: .utf8)!
		if let jsonString = jsonString {
			return jsonString
		} else {
			return ""
		}
	}
	func getJsonData() -> Data {
		var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
		let fileName = "inception.json"
		documentsURL.appendPathComponent(fileName)
		let jsonString = try? String(contentsOf: documentsURL)
		let data = jsonString!.data(using: .utf8)!
		return data
	}
	
	func getMovie(from jsonString: String) -> Movie? {
		var movie: Movie? = nil
		let data = getJsonData()
		do {
			let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
			
			guard let json = json,
				  let id = json["id"] as? String,
				  let title = json["title"] as? String,
				  let jsonYear = json["year"] as? String,
				  let year = Int(jsonYear),
				  let image = json["image"] as? String,
				  let releaseDate = json["releaseDate"] as? String,
				  let jsonRuntimeMins = json["runtimeMins"] as? String,
				  let runtimeMins = Int(jsonRuntimeMins),
				  let directors = json["directors"] as? String,
				  let actorList = json["actorList"] as? [Any] else {
				return nil
			}
			
			var actors: [Actor] = []
			
			for actor in actorList {
				guard let actor = actor as? [String: Any],
					  let id = actor["id"] as? String,
					  let image = actor["image"] as? String,
					  let name = actor["name"] as? String,
					  let asCharacter = actor["asCharacter"] as? String else {
					return nil
				}
				let mainActor = Actor(id: id,
									  image: image,
									  name: name,
									  asCharacter: asCharacter)
				actors.append(mainActor)
				
				movie = Movie(id: id,
							  title: title,
							  year: year,
							  image: image,
							  releaseDate: releaseDate,
							  runtimeMins: runtimeMins,
							  directors: directors,
							  actorList: actors)
			}
		} catch {
			print("Failed to parse: \(jsonString)")
		}
		
		return movie
	}
	
	
	
}
