//
//  StockAppTutorialApp.swift
//  StockAppTutorial
//
//  Created by Joao Gripp on 09/12/22.
//

import SwiftUI
import StocksAPI

@main
struct StockAppTutorialApp: App {
    
    let stocksAPI = StocksAPI()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear() {
                    Task {
                        do {
                            let quotes = try await stocksAPI.fetchQuotes(symbols: "AAPL")
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
        }
    }
}
