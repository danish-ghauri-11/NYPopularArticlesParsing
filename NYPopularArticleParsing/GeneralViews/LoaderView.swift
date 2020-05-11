//
//  LoaderView.swift
//
//  Created by Danish Ghauri on 24/01/2020.
//  Copyright © 2020 Danish Ghauri. All rights reserved.
//

import SwiftUI

struct LoaderView: View {
    
    var loadingText:String = "Loading"
    @State private var aquaBounce = false
    @State private var blueberryBounce = false
    @State private var grapeBounce = false
    @State private var magentaBounce = false
    @State private var strawberryBounce = false
    private let gradColor = LinearGradient(gradient: Gradient(colors: [Color(red: 113.0/255.0, green: 103.0/255.0, blue: 252.0/255.0),Color(red: 54.0/255.0, green: 47.0/255.0, blue: 187.0/255.0)]), startPoint: .leading, endPoint: .trailing)

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
                    .offset(y: aquaBounce ? 0 : -200)
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.aquaBounce.toggle()
                }
                
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)))
                    .offset(y: blueberryBounce ? 0 : -300)
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).delay(0.01).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.blueberryBounce.toggle()
                }
                
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)))
                    .offset(y: grapeBounce ? 0 : -300)
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).delay(0.02).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.grapeBounce.toggle()
                }
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)))
                    .offset(y: magentaBounce ? 0 : -300)
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).delay(0.03).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.magentaBounce.toggle()
                }
                
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)))
                    .offset(y: strawberryBounce ? 0 : -300)
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 5).delay(0.04).repeatForever(autoreverses: false))
                    .onAppear() {
                        self.strawberryBounce.toggle()
                }
                
               
            }
            Text(loadingText)
                .font(Font.system(size: 30.0))
                .foregroundColor(Color.black)
            
        }

    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
