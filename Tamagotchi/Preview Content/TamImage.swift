import SwiftUI

struct TamImage: View {
    var health: Double
    
    var body: some View {
        Image(chooseImage())
    }
    func chooseImage() -> String{
        if health >= 50.0{
            return "HappyTam"
        } else if health <= 0.0{
            return "DeadTam"
        }else{
            return "SadTam"
        }
        
        
    }
}

struct TamImage_Previews: PreviewProvider {
    static var previews: some View {
        TamImage(health:49.0)
    }
}
