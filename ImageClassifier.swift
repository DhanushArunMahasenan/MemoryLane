//
//  TestView.swift
//  MemoryLane
//
//  Created by Dhanush Arun.
//

import CoreML
import Vision
import UIKit

class ImageClassifier {

    func analyzeImage(image: UIImage) -> String {
        guard let cgImage = image.cgImage else {
            return "Failed to analyze image"
        }

        var predictionResult = ""

        do {
            //Use Squeeze Net model
            let model = try SqueezeNet(configuration: MLModelConfiguration())
            let mlModel = model.model
            let visionModel = try VNCoreMLModel(for: mlModel)
            let request = VNCoreMLRequest(model: visionModel) { response, error in
                if let error = error {
                    print("Error analyzing image: \(error.localizedDescription)")
                    return
                }

                guard let results = response.results as? [VNClassificationObservation],
                      let firstResult = results.first else {
                    print("No results found")
                    return
                }

                let id = firstResult.identifier
                predictionResult = id.prefix(1).capitalized + id.dropFirst()
            }
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            try handler.perform([request])
        } catch {
            print("Error initializing model: \(error.localizedDescription)")
        }

        return predictionResult
    }
}


