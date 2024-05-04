//
//  QuizView.swift
//  MemoryLane
//
//  Created by Dhanush Arun.
//

import SwiftUI

struct Quiz: View {
    //initalize
    let randomOptions = [
        "Apple", "Cat", "Dog", "Elephant", "Fish", "Giraffe", "Horse", "Ice cream", "Jungle",
        "Kangaroo", "Lemon", "Monkey", "Noodle", "Octopus", "Penguin", "Quilt", "Rainbow", "Snake", "Tiger",
        "Umbrella", "Violin", "Watermelon", "Xylophone", "Yogurt", "Zebra", "Mountain", "Ocean", "Planet"
    ]
    
    @State var questions: [Question] = [
        Question(text: "", imageName: "Castle", options: ["", "", "", ""], correctAnswer: 1),
        Question(text: "", imageName: "Peacock", options: ["", "", "", ""], correctAnswer: 1),
        Question(text: "", imageName: "Stocking", options: ["", "", "", ""], correctAnswer: 1),
        Question(text: "", imageName: "Banana", options: ["", "", "", ""], correctAnswer: 0),
        Question(text: "", imageName: "Plane", options: ["", "", "", ""], correctAnswer: 2)
    ]
    
    @State private var selectedAnswers: [Int?] = Array(repeating: nil, count: 5)
    @State private var imageClassifier = ImageClassifier()
    @State private var showResult = false
    
    var isAllQuestionsAnswered: Bool {
        return !selectedAnswers.contains(nil)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                GeometryReader { geometry in
                    HStack(spacing: 20) {
                        Spacer()
                        
                        ScrollView(.vertical) {
                            ZStack {
                                Color.black // Set the background color of the ZStack to black
                                    .ignoresSafeArea()
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        Spacer()
                                        
                                        Text("Album Quiz")
                                            .font(.system(size: 25))
                                            .bold()
                                            .padding(.top, 5)
                                            .foregroundColor(Color(red: 0/255, green: 130/255, blue: 255/255))
                                        
                                        Spacer()
                                    }
                                    
                                    Text("Choose the option that is best shown for each picture.")
                                        .font(.system(size: 15))
                                        .bold()
                                        .padding(.top, 12)
                                        .foregroundColor(.white)
                                    
                                    ForEach(0..<questions.count, id: \.self) { index in
                                        VStack(alignment: .leading, spacing: 10) {
                                            Text("Picture \(index + 1): \(questions[index].text)")
                                                .fontWeight(.bold)
                                                .padding(.top, 30)
                                                .foregroundColor(.white)
                                            
                                            if let imageName = questions[index].imageName {
                                                Image(imageName)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(maxHeight: geometry.size.height / 2)
                                                    .padding(.leading, 28)
                                                    .padding(.bottom, 10)
                                            }
                                            
                                            ForEach(0..<questions[index].options.count, id: \.self) { optionIndex in
                                                Button(action: {
                                                    selectedAnswers[index] = optionIndex
                                                }) {
                                                    HStack {
                                                        Image(systemName: selectedAnswers[index] == optionIndex ? "largecircle.fill.circle" : "circle")
                                                            .foregroundColor(selectedAnswers[index] == optionIndex ? .green : .white)
                                                        Text(questions[index].options[optionIndex])
                                                            .foregroundColor(.white)
                                                    }
                                                    .foregroundColor(selectedAnswers[index] == optionIndex ? .green : .primary)
                                                    .padding(.vertical, 5)
                                                }
                                            }
                                        }
                                    }
                                    
                                    HStack {
                                        Spacer()
                                        
                                        if isAllQuestionsAnswered {
                                            Button(action: {
                                                showResult = true
                                            }) {
                                                Text("Submit")
                                                    .padding()
                                                    .background(Color.blue)
                                                    .cornerRadius(10)
                                                    .foregroundColor(.black)
                                            }
                                            .padding()
                                        }
                                        
                                        Spacer()
                                    }
                                    .fullScreenCover(isPresented: $showResult) {
                                        ResultView(questions: questions, selectedAnswers: selectedAnswers)
                                    }
                                }
                                .background(Color.black)
                            }
                        }
                        Spacer()
                    }
                }
            }
            
            .onAppear {
                for index in 0..<questions.count {
                    var updatedOptions = [String]()
                    var addedOptions = Set<String>()
                    
                    // Add correct option
                    let correctOption = imageClassifier.analyzeImage(image: UIImage(named: questions[index].imageName!)!)
                    updatedOptions.append(correctOption)
                    addedOptions.insert(correctOption)
                    
                    // Add random options
                    while updatedOptions.count < questions[index].options.count {
                        let randomIndex = Int.random(in: 0..<randomOptions.count)
                        let randomOption = randomOptions[randomIndex]
                        if !addedOptions.contains(randomOption) { // Check if option is not already added
                            updatedOptions.append(randomOption)
                            addedOptions.insert(randomOption) // Add option to set
                        }
                    }
                    
                    // Shuffle options
                    updatedOptions.shuffle()
                    
                    // Update options in question
                    questions[index].options = updatedOptions
                    
                    // Find the index of the correct option in the updated options array
                    if let correctIndex = updatedOptions.firstIndex(of: correctOption) {
                        questions[index].correctAnswer = correctIndex
                    } else {
                        // Default to 0 if correct option not found
                        questions[index].correctAnswer = 0
                    }
                }
            }
        }
    }
}

struct ResultView: View {
    let questions: [Question]
    let selectedAnswers: [Int?]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                    
                    ScrollView {
                        VStack {
                            if calculateScore() == questions.count {
                                Text("Your Score: \(calculateScore()) / \(questions.count)")
                                    .bold()
                                    .padding()
                                    .font(.largeTitle)
                                
                                Text("Good Job!")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.blue)
                                
                                Image("Encouragement")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 350, height: 350)
                                    .padding(.top, 70)
                                
                            } else {
                                Text("Your Score: \(calculateScore()) / \(questions.count)")
                                    .bold()
                                    .padding()
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                            }
                        
                        ForEach(0..<questions.count, id: \.self) { index in
                            if let imageName = questions[index].imageName,
                               let selectedAnswer = selectedAnswers[index],
                               selectedAnswer != questions[index].correctAnswer {
                                VStack {
                                    Text("Question \(index + 1):")
                                        .font(.headline)
                                    Image(imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 200)
                                        .padding()
                                    Text("Your Answer: \(questions[index].options[selectedAnswer])")
                                    Text("Correct Answer: \(questions[index].options[questions[index].correctAnswer])")
                                }
                                .padding()
                                .background(Color.red.opacity(0.6))
                                .cornerRadius(10)
                                .padding()
                            }
                        }
                        
                        Button(action: {}) {
                            NavigationLink(
                                destination: MainPage().navigationBarBackButtonHidden(true),
                                label: {
                                    Text("Go to Main page")
                                }
                            )
                        }
                        .font(.system(size: 16))
                        .frame(width: 150, height: 40)
                        .foregroundColor(Color.black)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(8)
                        .padding()

                    }
                }
            }
        }
}
    
    func calculateScore() -> Int {
        var score = 0
        for (index, selectedAnswer) in selectedAnswers.enumerated() {
            if let selectedAnswer = selectedAnswer, selectedAnswer == questions[index].correctAnswer {
                score += 1
            }
        }
        return score
    }
}

struct Question {
    let text: String
    let imageName: String?
    var options: [String]
    var correctAnswer: Int
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Quiz()
    }
}
