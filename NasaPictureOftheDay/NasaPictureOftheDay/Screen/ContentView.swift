//
//  ContentView.swift
//  NasaPictureOftheDay
//
//  Created by Mukund vaghasiya  on 04/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var potheday:POTheDay?
    @Environment(\.verticalSizeClass) var verticalViewport
    @Environment(\.horizontalSizeClass) var HorizontalViewPort
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("Backgronds"),Color("Background")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            if verticalViewport == .compact{
                LandScapeMode(potheday: $potheday)
            }else{
                PotraitMode(potheday: $potheday)
            }
           
                    
            } .task {
                do{
                    try await getData()
                    print(potheday!)
                }catch(ApiError.invalidData){
                    print("InavlidData")
                }catch(ApiError.invalidResponse){
                    print("InavlidResponse")
                }catch(ApiError.invalidUrl){
                    print("InvalidUrl")
                }catch{
                    print("went wrong apiparshing")
                }
        }
    }
    
    func getData() async throws {
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=s7NSPFuufqcSoNMgeHhteRZeQyCnhKnxBT4OJ0ZR")
        guard let url = url else{ throw ApiError.invalidUrl }
        let (data,response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,response.statusCode == 200 else{ throw ApiError.invalidResponse }
        do{
            potheday = try JSONDecoder().decode(POTheDay.self, from: data)
        }
        catch{
            throw ApiError.invalidData
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        ContentView()
            .previewDevice("iPhone 11")
    }
}

