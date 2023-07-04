//
//  PotraitView.swift
//  NasaPictureOftheDay
//
//  Created by Mukund vaghasiya  on 04/07/23.
//

import SwiftUI

struct PotraitMode: View {
    
    @Binding var potheday:POTheDay?
   
    var body: some View {
        VStack(spacing: 10) {
            ComponentsOfViews().Header
            AsyncImage(url: URL(string:potheday?.hdurl ?? "nil")) { image in
                VStack(spacing: 10) {
                    image
                        .resizable()
                        .frame(width:350,height: 350)
                        .cornerRadius(20)
                        .shadow(color: Color.black, radius: 10)
                    
                    
                    Text(potheday?.date ?? "nil")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .bold()
                    
                    ScrollView(showsIndicators: false) {
                        Text(potheday?.explanation ?? "nil")
                            .foregroundColor(.white)
                            .frame(width: 360)
                            .font(.system(size: 20))
                    }.frame(height: 210)
                    
                    HStack {
                        Text("Ⓒ" + (potheday?.copyright?.replacingOccurrences(of: "\n", with: " "))!)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .padding(.leading)
                        Spacer()
                    }.padding(.top)
                }
                
            } placeholder: {
                ProgressView()
                    .tint(Color.white)
                    .scaleEffect(3.5)
                    .frame(width:350,height: 400)
                
            }
            
            Spacer()
        }
    }
}
