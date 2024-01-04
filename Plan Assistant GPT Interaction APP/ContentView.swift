import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to your personal Steward!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                NavigationLink(destination: RunningView()) {
                    Text("Running Page")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.cyan)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.bottom, 20)
                        .frame(width: 200, height: 85)
                }
            }
            .background(Color(.systemBackground)) // Set a light background color
        }
        .navigationBarTitle("", displayMode: .inline) // Empty title to hide the default title
        .navigationBarBackButtonHidden(true) // Hide the back button
        // You can add additional navigation bar customization here
        .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .top, endPoint: .bottom)) // Use a warm color gradient
            .edgesIgnoringSafeArea(.all) // Ignore safe area to fill the whole screen
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
