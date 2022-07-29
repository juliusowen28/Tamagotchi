
import SwiftUI

struct FeedButton: View {
    @Binding var game: Game
    var feedRate: Double
    var body: some View {
        Button(action: {
            if game.isRunning{
                game.health = min(game.health+feedRate,100.0)
            }
        }) {
            Text("Feed".uppercased())
                .font(.title3)
                .bold()
                .tracking(2)
                .foregroundColor(Color.white)
        }
        .padding()
        .background(Color("TamColor"))
        .cornerRadius(15)
        .disabled(!game.isRunning)
    }
}

struct FeedButton_Previews: PreviewProvider {
    static var previews: some View {
        FeedButton(game: .constant(Game()), feedRate: 0.0)
    }
}
