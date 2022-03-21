//
//  memorizeApp.swift
//  memorize
//
//  Created by Бекдаулет Касымов on 21.03.2022.
//

import SwiftUI

@main
struct memorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(gameViewModel: game)
        }
    }
}
