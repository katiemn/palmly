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
    @State private var getReadingButtonDisabled = true
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        self.getReadingButtonDisabled = false
        
        guard let buffer = CVImageBuffer.buffer(from: self.inputImage!) else {
          return
        }
        
        self.viewRouter.imageBuffer = buffer
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                Color.black
                .edgesIgnoringSafeArea(.top)
                .edgesIgnoringSafeArea(.bottom)
                
                self.image?.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                
                if (self.image == nil) {
                    VStack {
                        Text("Get Your Palm Reading")
                            .padding(.bottom)
                            .padding(.bottom)

                        .font(.custom("ZillaSlab-SemiBold", size: 35))

                        Text("Take a picture of your left palm or upload an image from your camera roll")
                        .font(.custom("DMSans-Regular", size: 25))

                    }
                    
                    .font(.custom("DMSans-Regular", size: 30))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .padding()
                    .multilineTextAlignment(.center)
                }
                        
                HStack(spacing: 85) {
                    Button(action: {
                        self.showingImagePicker = true
                    }) {
                        Image("upload image")
                    }
                    .foregroundColor(Color.white)
                    
                    Button(action: { self.viewRouter.currentPage += 1}) {
                        Image("temp get reading")
                    }
                    .disabled(self.getReadingButtonDisabled)
                    .foregroundColor(self.getReadingButtonDisabled ? Color.gray : Color.white)
       
                    Button(action: {
                        self.pickerSourceIsCamera = true
                        self.showingImagePicker = true
                    }) {
                        Image("temp camera button")
                    }
                    .foregroundColor(Color.white)
                }
                .padding(.bottom)
                }
                .sheet(isPresented: self.$showingImagePicker, onDismiss: self.loadImage) {
                    ImagePicker(image: self.$inputImage, pickerSourceIsCamera: self.$pickerSourceIsCamera)
                }
                .onAppear {
                    self.viewRouter.reinitialize();
                }
            }
        }
}

struct TakePhoto_Previews: PreviewProvider {
    static var previews: some View {
        TakePhoto(viewRouter: ViewRouter())
    }
}
