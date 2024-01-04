import SwiftUI

struct RunningView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State private var firstStep: String = ""
    @State private var secondStep: String = ""
    @State private var thirdStep: String = ""
    @State private var aiResponse: String = ""

    let apiKey = "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"
    // Replace with your Flask server URL
    let gptApiUrl = "http://127.0.0.1:5000/generate_gpt"

    var body: some View {
        NavigationView {
            
            ZStack {
                
                // Yellow frame around the screen
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.yellow)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .frame(width: 370, height: 780)
                    .padding(.top, 10)

                // White content area in the middle
                VStack (spacing: 0){
                    
                    Text("AI Response:")
                        .padding()
                        .padding(.top, 10)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                    // AI response display at the top
                    RoundedRectangle(cornerRadius: 30) // Set your desired corner radius
                        .fill(Color.white)
                        .frame(width: 300, height: .infinity)
                        .overlay(
                            ScrollView {
                                VStack {
                                    // AI response display at the top
                                    Text(aiResponse)
                                        .padding()
                                        .multilineTextAlignment(.center)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                            }
                        )
                        .padding()  // Add padding to the RoundedRectangle
                    
                    // User input bars vertically aligned
                    VStack(alignment: .leading, spacing: 14) {
                      
                        TextField("Your First Step", text: $firstStep)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .frame(width: 300)  // Adjust the width to make it narrower

                        TextField("Second Step", text: $secondStep)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .frame(width: 300)  // Adjust the width to make it narrower

                        TextField("Third Step", text: $thirdStep)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .frame(width: 300)  // Adjust the width to make it narrower
                    }

                    // Button to trigger AI request on the right
                    HStack {
                        // Button to trigger AI request on the right
                        Button(action: {
                            self.sendRequest()
                        }) {
                            Text("Send")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding(.trailing)
                                .padding(.bottom, 20)  // Adjust the amount to move it down by changing the value
                                .frame(width: 200, height: 65)  // Adjust the width to make it longer
                        }

                        // Navigation link to HomeView
                        NavigationLink(destination: ContentView()) {
                            Text("Home")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding(.bottom, 20)
                                .frame(width: 200, height: 85)  // Adjust the width to make it longer
                                .navigationBarBackButtonHidden(true)
                        }
                   
                    }
                }
            }
            .padding()
        }
        .navigationBarTitle("", displayMode: .inline) // Empty title to hide the default title
        .navigationBarBackButtonHidden(true) // Hide the back button
        // You can add additional navigation bar customization here
    }


    func sendRequest() {
        guard let url = URL(string: gptApiUrl) else {
            print("Error: Invalid GPT API URL")
            aiResponse = "Error getting GPT response"
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Customize the payload based on your GPT input format
        let requestData: [String: Any] = [
            "plan": firstStep
            // Add other input fields as needed
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestData)
        } catch {
            print("Error: Failed to serialize JSON")
            aiResponse = "Error getting GPT response"
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                self.aiResponse = "Error getting GPT response"
                return
            }

            if let data = data {
                // Parse GPT response and update UI
                // Modify this part based on your GPT response format
                if let gptOutput = String(data: data, encoding: .utf8) {
                    DispatchQueue.main.async {
                        self.aiResponse = gptOutput
                        // Replace "\\n" with a newline character "\n"
                        self.aiResponse = self.aiResponse.replacingOccurrences(of: "\\n", with: "\n")
                    }
                } else {
                    print("Error: Failed to parse GPT response")
                    self.aiResponse = "Error getting GPT response"
                }
            }
        }.resume()
    }

        
}

struct RunningView_Previews: PreviewProvider {
    static var previews: some View {
        RunningView()
    }
}
