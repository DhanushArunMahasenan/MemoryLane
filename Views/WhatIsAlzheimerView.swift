//
//  WhatIsAlzheimerView.swift
//  MemoryLane
//
//  Created by Dhanush Arun.
//

import SwiftUI

struct WhatIsAlzheimer: View {
    @State var textSize: CGFloat = 19
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        
                        Text("Alzheimer's Disease")
                            .font(.title)
                            .foregroundColor(.blue)
                            .bold()
                            .padding(.top, 20)
                        
                        Spacer()
                        
                    }
                    
                    Text("A brain disease that causes a slow decline in memory, thinking, and reasoning skills.")
                        .font(.system(size: textSize))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.top, 5)
                        .padding(.leading, 20)
                    
                    Text("This disease has no cure and limited therapeutic options, making it a global health crisis.")
                        .font(.system(size: textSize))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.top, 7)
                        .padding(.leading, 20)
                        
                    HStack {
                        Spacer()
                        
                        Image("AlzheimerBrain")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 340, height: 300)
                            .padding(.top, -24)
                        
                        Spacer()
                    }
                    .padding(.top, -20)
                    
                    Text("Key Facts:")
                        .font(.title)
                        .foregroundColor(.blue)
                        .bold()
                        .padding(.top, -30)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        BulletList(text: "About 1 in 9 people who are above the age of 65 has Alzheimer’s.")
                        
                        BulletList(text: "Americans age 65 and older are projected to grow from 58 million in 2021 to 88 million by 2050.")
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        //Bring to What is MemoryLane view
                        NavigationLink(destination: WhatIsMemoryLane().navigationBarBackButtonHidden(true)) {
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
struct BulletList: View {
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

struct WhatIsAlzheimer_Previews: PreviewProvider {
    static var previews: some View {
        WhatIsAlzheimer()
    }
}
