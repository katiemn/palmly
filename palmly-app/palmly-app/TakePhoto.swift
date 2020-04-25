//
//  TakePhoto.swift
//  palmly-app
//
//  Created by Vincent Fitzgerald Tolliver on 3/30/20.
//  Copyright © 2020 Katie Nguyen. All rights reserved.
//

import SwiftUI

struct TakePhoto: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    @State private var showingImagePicker = false
    @State private var pickerSourceIsCamera = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    var body: some View {
        ZStack {
            Color.black
            .edgesIgnoringSafeArea(.top)
            .edgesIgnoringSafeArea(.bottom)
            
            image?.resizable()
            .frame(maxWidth: .infinity, maxHeight:
                .infinity, alignment: .center)
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
                        
            HStack(spacing: 85) {
                Button(action: {
                    self.showingImagePicker = true
                }) {
                    Image("upload image")
                }
                
                Button(action: { self.viewRouter.currentPage += 1}) {
                    Image("temp get reading")
                }
   
                Button(action: {
                    self.pickerSourceIsCamera = true
                    self.showingImagePicker = true
                }) {
                    Image("temp camera button")
                }
            }
            .foregroundColor(Color.white)
            .offset(y: 320)
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage, pickerSourceIsCamera: self.$pickerSourceIsCamera)
        }
    }
}

struct TakePhoto_Previews: PreviewProvider {
    static var previews: some View {
        TakePhoto(viewRouter: ViewRouter())
    }
}
