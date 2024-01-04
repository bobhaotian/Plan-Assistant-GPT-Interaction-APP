# Plan-Assistant-GPT-Interaction-APP

<img src="https://github.com/bobhaotian/Plan-Assistant-GPT-Interaction-APP/assets/112147566/ead2f3d5-0b39-4eef-af86-90f4a514814f" width="128">

## Introduction to the APP

###### Note: Auto-GPT is an open-source Python application that was posted on GitHub. Some of its benefits are Ex. It has internet access, long-term, and short-term memory management. It has its IOS APP and much more powerful features till Jan 3, 2024, however, one of the best and most mature versions that I had when I started this project is version 0.3.1, so we'll discuss its features and restrictions.

#### After the user gives it their requirements, it can show the user their goals, plans, and next steps. The interface in the terminal looks like this ⬇️
<img width="961" alt="Screenshot 2024-01-04 at 2 14 33 PM" src="https://github.com/bobhaotian/Plan-Assistant-GPT-Interaction-APP/assets/112147566/b7acd999-7dce-43e9-87ff-7d419522ea51">

#### This version requires users to show their plans explicitly so that the gpt can find the next steps. Therefore, I made three bars for user input in the APP version, named as first, second, and third steps, so that the AutoGPT can get the input in the best format. ⬇️ 

<img src="https://github.com/bobhaotian/Plan-Assistant-GPT-Interaction-APP/assets/112147566/971437e5-b7fe-4c91-91f1-b3a212aa733a" width="128">      

#### It keeps the feature of restoring the previous task. "n" means not to continue, and "y" means to continue: 
<img src="https://github.com/bobhaotian/Plan-Assistant-GPT-Interaction-APP/assets/112147566/96717fdb-4f47-4d4a-802b-10b2d05a8147" width="128">

#### Put user input: 
<img src="https://github.com/bobhaotian/Plan-Assistant-GPT-Interaction-APP/assets/112147566/ac2c259b-75d4-4470-b87d-fc810cbd9b54" width="128">

#### In its workspace, it will work on your task
<img src="https://github.com/bobhaotian/Plan-Assistant-GPT-Interaction-APP/assets/112147566/f65117ca-8cee-4620-b852-102b495c7cc1" width="428">

#### Finally, I extracted the content in the workspace to the APP page, so that users can see it. 


## Procedure of Making
#### Below is a flowchart showing the overall concepts
<img src="https://github.com/bobhaotian/Plan-Assistant-GPT-Interaction-APP/assets/112147566/d4a40454-10a1-4ca8-a26c-39a30358f410" width="328">   

### 1. Set Up Xcode Project and all necessary keys.
#### Open Xcode and create a new project. The template I use is the IOS APP with SwiftUI interface. The version of Xcode is 14.1. There are two external tools I need to use – AutoGPT, and OpenAI’s assistant API. The AI generator I used is AutoGPT with version 0.3.1, which uses OpenAI’s assistant API as its core generator. Therefore, I need to have the openAI’s API key. Finally, as AutoGPT-0.3.1 operates in the terminal, obtaining its endpoint is necessary, but quite complicated. The process for acquiring it is detailed below.
Reference: AUTOGPT    
hQps://autogpt.net/harness-the-power-of-auto-gpt-supercharging-your-tasks-and-projects/

### 2. Create an interface and set the functions in Swift UI
#### Open the ContentView.swift and create an interface for prototyping and testing. I wrote a function called sendRequest which sends user inputs through an HTTP post request and receives AI responses.

### 3. Set Up Flask Server
#### Create a Python file (named gpt_service.py) that does the receiving the HTTP post request and generates the responses with the AutoGPT logic.

### 4. Run Flask Server Locally
#### Open a terminal, navigate to the directory containing gpt_service.py, and run:

`python gpt_service.py`

#### This will start the Flask server locally. Notice this server only runs locally, therefore, we need to expose it to let it be an endpoint.

### 5. Replace Ngrok URL in SwiftUI Code
#### Take note of the Ngrok-generated URL (something like https://your-ngrok-subdomain.ngrok.io). Note that we need to initialize the gptApiUrl in the swift file, so remember to change it by the actual Endpoint.
`let gptApiUrl = https://your-ngrok-subdomain.ngrok.io/generate_gpt`

### 6. Test the SwiftUI App
#### Build and run your SwiftUI app.

