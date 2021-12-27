//
//  ContentView.swift
//  Test
//
//  Created by Kamil on 23/12/2021.
//

import SwiftUI

var promptArray = ["WIN", "LOSE"].shuffled()
var tools = ["Rock", "Paper", "Scissors"].shuffled()


struct ContentView: View {
    
    
    
    @State private var prompt = promptArray[0]
    @State private var appTool = tools[0]
    @State private var userToolOne = tools[1]
    @State private var userToolTwo = tools[2]
    @State private var score = 0
    @State private var userChoose = ""
    @State private var questionCounter = 1
    
    @State private var scoreTitle = ""
    @State private var endTitle = ""
    
    @State private var showingScore = false
    @State private var showingEnd = false
    
    
    
    
    
    var body: some View {
        VStack{
            VStack {
                
                Spacer()
                
                Text(prompt)
                    .font(.largeTitle.bold())
                Text("with")
                Text(appTool)
                    .font(.largeTitle.bold())
                    .foregroundColor(.black.opacity(0.7))
                ZStack{
                    Color.black
                        .frame(width: 265, height: 265)
                    Image(appTool)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                }
                
                Spacer()
                Spacer()
                Spacer()
                
                VStack{
                    Text("Choose item:")
                        .font(.title.bold())
                    HStack(spacing: 30) {
                        Button(){
                            userChoose = userToolOne
                            allPossibilities()
                        } label: {
                            ZStack{
                                Color.black
                                    .frame(width: 160, height: 160)
                                Image(userToolOne)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150  , height: 150)
                            }
                        }
                        Button() {
                            userChoose = userToolTwo
                            allPossibilities()
                        } label: {
                            ZStack{
                                Color.black
                                    .frame(width: 160, height: 160)
                                Image(userToolTwo)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150  , height: 150)
                            }
                        }
                    }
                    Spacer()
                    
                    Text("Score: \(score)")
                        .font(.title.bold())
                }
                
                Spacer()
                
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert(endTitle, isPresented: $showingEnd) {
            Button("Try again", action: reset)
        } message: {
            Text("Your final score is \(score)/10")
        }
        
    }
    func allPossibilities() {
        if appTool == "Paper" && prompt == "WIN" && userChoose == "Scissors" {
            correct()
        } else if appTool == "Paper" && prompt == "LOSE" && userChoose == "Rock" {
            correct()
        } else if appTool == "Scissors" && prompt == "WIN" && userChoose == "Rock" {
            correct()
        } else if appTool == "Scissors" && prompt == "LOSE" && userChoose == "Paper" {
            correct()
        } else if appTool == "Rock" && prompt == "WIN" && userChoose == "Paper" {
            correct()
        } else if appTool == "Rock" && prompt == "LOSE" && userChoose == "Scissors" {
            correct()
        } else {
            scoreTitle = "Upss.. wrong!"
            showingScore = true
        }
    }
    
    
    func correct() {
        score += 1
        scoreTitle = "Correct!"
        showingScore = true
    }
    
    func askQuestion() {
        if questionCounter < 10 {
            promptArray.shuffle()
            tools.shuffle()
            prompt = promptArray[0]
            appTool = tools[0]
            userToolOne = tools[1]
            userToolTwo = tools[2]
            
            questionCounter += 1
        } else {
            endTitle = "Game over!"
            showingEnd = true
        }
    }
    func reset() {
        questionCounter = 0
        score = 0
        askQuestion()
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
