//
//  ContentView.swift
//  ImagePicker
//
//  Created by Вячеслав Квашнин on 20.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSheet = false
    @State var isShown = false
    
    @State var image: Image?
    
    @State var sourceType: Int = 0
    
    var body: some View {
        ZStack {
            
            Image("pic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 200, height: 200)
            
            Button(action: {
                showSheet = true
            }, label: {
                Image(systemName: "camera.fill")
                    .font(.largeTitle)
            })
            .offset(x: 70, y: 80)
            .actionSheet(isPresented: $showSheet) {
                ActionSheet(title: Text("Выбор действий"), message: Text("Still Read"), buttons: [.default(Text("Camera")) {
                    sourceType = 0
                    isShown = true
                },
                .default(Text("Image")) {
                    sourceType = 1
                    isShown = true
                },
                .cancel()])
            }
            if isShown {
                ImagePicker(isVisible: $showSheet, image: $image, sourceType: sourceType)
        }
        }
        .onAppear(perform: {
            self.image = Image("pic")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
