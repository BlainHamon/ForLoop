//
//  ContentView.swift
//  ForLoop
//
//  Created by Katie Hamon on 11/22/21.
//

import SwiftUI

extension String {
  public func localized() -> String {
    Bundle.main.localizedString(forKey: self, value: nil, table: nil)
  }
}

struct ContentView: View {
  @Environment(\.openURL) var openURL
  @State var name = "no-pony".localized()

  var body: some View {
    VStack {
      Spacer()
      Text("your-name \(name)")
      Spacer()
      Button("new-name") {
        self.name = DataSource.default.RequestName()
      }
      Spacer()
      Text(LocalizedStringKey("credits")).underline(true, color: .blue)
      .onTapGesture {
        if let url = URL(string: "ponyurl".localized()) {
          openURL(url)
        }
      }
    }.padding()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
