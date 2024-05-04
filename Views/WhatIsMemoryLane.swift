//
//  WhatIsMemoryLane.swift
//  MemoryLane
//
//  Created by Dhanush Arun.
//

import SwiftUI

struct WhatIsMemoryLane: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        
                        Text("What is MemoryLane?")
                            .font(.title)
                            .foregroundColor(.blue)
                            .bold()
                            .padding(.top, 40)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Text("Memory Lane is a digital tool for improving the lives of Alzheimer's patients and their caregivers using Machine Learning.")
                            .font(.system(size: 19))
                            .font(.body)
                            .foregroundColor(.white)
                            .bold()
                            .padding(.top, 2)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Image("AppLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 180)
                            .padding(.top, 30)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Text("Features of MemoryLane:")
                            .font(.title)
                            .foregroundColor(.blue)
                            .bold()
                            .padding(.top, 30)
                        
                        Spacer()
                        
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        BulletList(text: "Enhances patients' memory for daily tasks")
                        
                        Spacer()
                        
                        BulletList(text: "Stimulates memory through the use of unseen pictures in an album")
                        
                        Spacer()
                        
                        BulletList(text: "Patient engagement through quizzes")
                        
                    }
                    .padding(.top, 2)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: WhatIsAlzheimer().navigationBarBackButtonHidden(true)) {
                            Text("← Back")
                                .font(.headline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.top, 40)
                        }
                        
                        Spacer()
                        
                        //To bring to main page
                        NavigationLink(destination: MainPage().navigationBarBackButtonHidden(true)) {
                            Text("Next →")
                                .font(.headline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.top, 40)
                        }
                        
                        Spacer()
                        
                    }
                    
                }
            }
            
        }
        
    }
}


//To help create bullet point lists
struct BulletList2: View {
    var text: String

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text("•")
                .foregroundColor(.white)
                .font(.system(size: 30))
            Text(text)
                .bold()
                .font(.system(size: 19))
                .foregroundColor(.white)
                .padding(.top, 5)
                .fixedSize(horizontal: false, vertical: true) // Allow text to wrap
        }
    }
}

struct WhatIsMemoryLane_Previews: PreviewProvider {
    static var previews: some View {
        WhatIsMemoryLane()
    }
}
