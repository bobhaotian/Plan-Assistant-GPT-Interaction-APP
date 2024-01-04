# Plan-Assistant-GPT-Interaction-APP

<img src="https://github.com/bobhaotian/Plan-Assistant-GPT-Interaction-APP/assets/112147566/ead2f3d5-0b39-4eef-af86-90f4a514814f" width="128">

<img src="https://github.com/bobhaotian/Plan-Assistant-GPT-Interaction-APP/assets/112147566/971437e5-b7fe-4c91-91f1-b3a212aa733a" width="128">

<img src="https://github.com/bobhaotian/Plan-Assistant-GPT-Interaction-APP/assets/112147566/96717fdb-4f47-4d4a-802b-10b2d05a8147" width="128">

<img src="https://github.com/bobhaotian/Plan-Assistant-GPT-Interaction-APP/assets/112147566/ac2c259b-75d4-4470-b87d-fc810cbd9b54" width="128">

<img src="https://github.com/bobhaotian/Plan-Assistant-GPT-Interaction-APP/assets/112147566/f65117ca-8cee-4620-b852-102b495c7cc1" width="428">

## Procedure of Making
#### Below is a flowchart showing the overall concepts
<img src="https://github.com/bobhaotian/Plan-Assistant-GPT-Interaction-APP/assets/112147566/d4a40454-10a1-4ca8-a26c-39a30358f410" width="328">   

### 1. Set Up Xcode Project and all necessary keys.
#### Open Xcode and create a new project. The template I use is the IOS APP with SwiftUI interface. The version of Xcode is 14.1. There are two external tools I need to use – AutoGPT, and OpenAI’s assistant API. The AI generator I used is AutoGPT with version 0.3.1, which uses OpenAI’s assistant API as its core generator. Therefore, I need to have the openAI’s API key. Finally, as AutoGPT-0.3.1 operates in the terminal, obtaining its endpoint is necessary, but quite complicated. The process for acquiring it is detailed below.
Reference: AUTOGPT    
hQps://autogpt.net/harness-the-power-of-auto-gpt-supercharging-your-tasks-and-projects/

### 2. Create an interface and set the functions in Swift UI
#### Open the ContentView.swift and create an interface for prototyping and testing. Figure 1.1 is the interface I created. Then I wrote a function called sendRequest (shown in Figure 1.2) which sends user inputs through an HTTP post request and receives AI responses.

