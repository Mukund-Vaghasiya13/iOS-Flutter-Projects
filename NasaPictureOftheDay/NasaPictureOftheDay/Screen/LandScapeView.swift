//
//  LandScapeView.swift
//  NasaPictureOftheDay
//
//  Created by Mukund vaghasiya  on 04/07/23.
//

import SwiftUI

struct LandScapeMode:View{
    @Binding var potheday:POTheDay?
    var body: some View{
        HStack{
            SubviewOne(date: potheday?.date ?? " ",image: potheday?.hdurl ?? "")
            Spacer()
            SubViewSecond(Copyrights: potheday?.copyright ?? "",Explanation: potheday?.explanation ?? "")
        }
    }
}


struct SubviewOne:View{
    var date:String?
    var image:String?
    var body: some View{
        VStack{
            ComponentsOfViews().Header
            AsyncImage(url: URL(string: image ?? "")) { image in
                image
                    .resizable()
                    .frame(width:220,height: 210)
                    .cornerRadius(20)
                    .shadow(color: Color.black, radius: 10)
            } placeholder: {
                ProgressView()
                    .tint(Color.white)
                    .scaleEffect(3.5)
                    .frame(width:210,height: 210)
            }

            Text(date ?? "0")
                .foregroundColor(.white)
                .font(.system(size: 25))
                .bold()
            Spacer()
        }
    }
}


struct SubViewSecond:View{
    var Copyrights:String?
    var Explanation:String?
    var body: some View{
        VStack{
            ScrollView(showsIndicators: false) {
                Text(Explanation ?? "nil")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }.frame(height: 210)
            
            HStack {
                Spacer()
                Text("Ⓒ" + (Copyrights!.replacingOccurrences(of: "\n", with: " ")))
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .padding(.leading)
            }.padding(.top)
        }
    }
}

