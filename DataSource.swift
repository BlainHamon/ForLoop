//
//  DataSource.swift
//  ForLoop
//
//  Created by Katie Hamon on 11/22/21.
//

import Foundation

/** Data Source
 This is the source of Truth with a capital T, and would be the be-all and end-all to keep state/data stable
 In a larger app, this would have:
  * much more than a single request exposed
  * Probably request formats and other means to get information
  * Another classes, one to read/write cache, the other for networking, and Data Source would control these
  * JSON support
*/

class DataSource {
  static let `default` = DataSource()
  private lazy var names : [String] = read(plist: "ponies")

  private func read(plist: String) -> [String] {

    guard let url = Bundle.main.url(forResource: plist, withExtension: "plist"),
      let data = try? Data.init(contentsOf: url) else {
      return [] //Maybe error handling and logging?
    }

    let decoder = PropertyListDecoder()
    let list : [String] //The list must be outside for scoping reasons

    do {
      list = try decoder.decode([String].self, from: data)
    } catch {
      // Handle error state here
      return []
    }

    return list
  }

  func RequestName() -> String {
    names.randomElement() ?? "Unknown pony"
  }
}
