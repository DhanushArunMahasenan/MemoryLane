//
//  MemoriesView.swift
//  MemoryLane
//
//  Created by Dhanush Arun.
//

import SwiftUI

struct Memories: View {
    @State var imagewidth: CGFloat = 300
    @State var imageHeight: CGFloat = 200
    @State var imagePadding: CGFloat = 10
    
    var body: some View {
        NavigationView {
            ZStack {
                //Background color
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    //Scrollview of 9 images
                    ScrollView(.vertical) {
                        
                        //Title of the page
                        Text("Album of Memories")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom, 20)
                            .foregroundColor(.white)
                        
                        //How to use
                        Text("Scroll down to see all the pictures.")
                            .bold()
                            .font(.system(size: 15))
                            .padding(.bottom, 20)
                            .foregroundColor(.white)
                        
                        Image("Banana")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imagewidth, height: imageHeight)
                            .padding(imagePadding)
                        Image("Castle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imagewidth, height: imageHeight)
                            .padding(imagePadding)
                        Image("Stocking")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imagewidth, height: imageHeight)
                            .padding(imagePadding)
                        Image("Deer")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imagewidth, height: imageHeight)
                            .padding(imagePadding)
                        Image("Earth")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imagewidth, height: imageHeight)
                            .padding(imagePadding)
                        Image("Peacock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imagewidth, height: imageHeight)
                            .padding(imagePadding)
                        Image("Plane")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imagewidth, height: imageHeight)
                            .padding(imagePadding)
                        Image("Tree")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imagewidth, height: imageHeight)
                            .padding(imagePadding)
                        Image("Waterfall")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imagewidth, height: imageHeight)
                            .padding(imagePadding)
                        
                    }
                    
                }
                
            }
        }
    }
}
