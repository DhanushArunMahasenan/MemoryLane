//
//  WelcomeView.Swift
//  MemoryLane
//
//  Created by Dhanush Arun.
//

import SwiftUI
import CoreML

struct WelcomeView: View {
    
    @State private var showResult = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    //Load app icon
                    Image("AppLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    Text("MemoryLane")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Welcome")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    //Bring to WhatIsAlzheimer view
                    NavigationLink(destination: WhatIsAlzheimer().navigationBarBackButtonHidden(true)) {
                        Text("Get Started →")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.top, 40)
                    }
                }
            }
        }
    }
}


