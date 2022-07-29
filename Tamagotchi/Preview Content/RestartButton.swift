import SwiftUI

struct RestartButton: View {
    var body: some View {
        Image(systemName: "arrow.counterclockwise")
          .frame(width: 40, height: 40)
          .padding()
          .foregroundColor(Color("TextColor"))
          .font(.title)
          .background(Circle().fill(Color.white))
          .shadow(color: Color.gray, radius: 2, x: 2, y: 2)
          .overlay(
            Circle()
              .strokeBorder(Color("TamColor"), lineWidth: 3)
            )
    }
}

struct RestartButton_Previews: PreviewProvider {
    static var previews: some View {
        RestartButton()
    }
}
