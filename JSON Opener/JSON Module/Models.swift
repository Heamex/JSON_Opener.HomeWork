//
//  Film model.swift
//  JSON Opener
//
//  Created by Nikita Belov on 09.02.23.
//

import Foundation

struct Movie: Codable {
	let id: String
	let title: String
	let year: String
	let image: String
	let releaseDate: String
	let runtimeMins: String
	let directors: String
	let actorList: [Actor]
}

struct Actor: Codable {
	let id: String
	let image: String
	let name: String
	let asCharacter: String
}
