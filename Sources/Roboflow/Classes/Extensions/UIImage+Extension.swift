//
//  UIImage+Extension.swift
//  Roboflow
//
//  Created by Nicholas Arner on 7/11/22.
//

import AppKit
import VideoToolbox

extension NSImage {
    //Create a NSImage out of a CVPixelBuffer
    public convenience init?(pixelBuffer: CVPixelBuffer) {
        var cgImage: CGImage?
        VTCreateCGImageFromCVPixelBuffer(pixelBuffer, options: nil, imageOut: &cgImage)

        guard let cgImage = cgImage else {
            return nil
        }

        self.init(cgImage: cgImage, size: .zero)
    }
    
    func jpegData(compressionQuality: Double) -> Data {
        let cgImage = self.cgImage(forProposedRect: nil, context: nil, hints: nil)!
        let bitmapRep = NSBitmapImageRep(cgImage: cgImage)
        let jpegData = bitmapRep.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [:])!
        return jpegData
    }
    
    func ciImage() -> CIImage? {
            guard let data = self.tiffRepresentation,
                  let bitmap = NSBitmapImageRep(data: data) else {
                return nil
            }
            let ci = CIImage(bitmapImageRep: bitmap)
            return ci
        }
}
