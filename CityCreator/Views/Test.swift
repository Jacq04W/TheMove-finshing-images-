//
//  Test.swift
//  TheMove
//
//  Created by Jacquese Whitson  on 6/4/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Player: Identifiable,Codable {
    var id: String
    var name: String
}

struct Game: Identifiable,Codable {
    var id: String
    var name: String
    var participants: [Player]
}


struct Test: View {
  
    let player1 = Player(id: "1", name: "Player 1")
    let player2 = Player(id: "2", name: "Player 2")
    
    @FirestoreQuery(collectionPath: "games") var games: [Game]
    

    var body: some View {
        let game = Game(id: "1", name: "My uuu", participants: [player1, player2])

        VStack {
            ForEach(games, id: \.id) { game in
                Text("\(game.name)")
            }

            Button("OK"){
                storeGameInFirestore(game: game)
            }
        }

    }
    
    
    
    func storeGameInFirestore(game: Game) {
        let db = Firestore.firestore()
        
        do {
            let gameData = try JSONEncoder().encode(game)
            
            if let gameDictionary = try JSONSerialization.jsonObject(with: gameData, options: []) as? [String: Any] {
                db.collection("games").addDocument(data: gameDictionary) { error in
                    if let error = error {
                        print("Error adding game: \(error)")
                    } else {
                        print("Game added successfully!")
                    }
                }
            }
        } catch {
            print("Error encoding game: \(error)")
        }
    }

}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
