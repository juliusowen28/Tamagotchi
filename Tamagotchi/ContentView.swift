
import SwiftUI

struct ContentView: View {
    
    var feedRate = 5.0
    var dyingRate = 20.0
    @State private var game = Game()
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            Color("BackgroundColor").ignoresSafeArea()
            VStack(spacing: 20)
            {
                HStack(spacing: 20){
                    Button(action:{
                        game.restart()
                        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    }){
                        RestartButton()
                    }
                    Spacer()
                }
                .padding(.horizontal)
                Spacer()
                Text("Keep the Tamagotchi Alive!".uppercased())
                    .tracking(2)
                    .font(.headline)
                    .padding()
                VStack(spacing:30)
                {
                    TamImage(health: game.health)
                    VStack(alignment: .leading)
                    {
                        Text("Score: \(game.score)")
                            .font(.title2)
                            .bold()
                            .onReceive(timer){ _ in
                                if game.isRunning{
                                    game.score += 100
                                }
                            }
                        Text("Health: \(Int(game.health))")
                            .font(.title2)
                            .bold()
                            .onReceive(timer){ _ in
                                if game.isRunning{
                                    game.health = max(game.health - dyingRate, 0.0)
                                }
                                if game.health == 0.0{
                                    game.isRunning = false
                                }
                            }
                    }
                    ProgressView(value: game.health/100.0)
                        .padding(.horizontal,50.0)
                        .accentColor(Color("TamColor"))
                    
                    FeedButton(game: $game, feedRate: feedRate)
                }
                Spacer()
            }
            
        }
        
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
            .previewInterfaceOrientation(.portrait)
    }
}
