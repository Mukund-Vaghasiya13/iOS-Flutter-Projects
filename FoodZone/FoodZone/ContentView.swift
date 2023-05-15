//
//  ContentView.swift
//  FoodZone
//
//  Created by Mukund vaghasiya  on 14/05/23.
//


// It's Like Templet
import SwiftUI


struct ContentView: View {
    
    // TODO: list Of Modle
    @State var ORList:[Modle] = []
    
    @State var present = false
    var item = Item()
    @State var Selected = "Fast Food"
    var arr = ["Fast Food" ,"Cold Drinks"]
    var body: some View {
        NavigationStack{
            ZStack {
                VStack{
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.yellow)
                        .ignoresSafeArea()
                        .frame(height: 300)
                        .overlay {
                            DetailsOfRest()
                        }
                    HStack {
                        Text("Menu")
                            .font(.system(size: 50))
                            .fontWeight(.heavy)
                            .padding()
                        Spacer()
                        Picker("", selection: $Selected) {
                            ForEach(arr ,id: \.self) { i in
                                Text(i)
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                            }
                            
                        } .font(.largeTitle)
                            .fontWeight(.heavy)
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                        
                    }
                    List(Selected == "Fast Food" ? item.FastFood : item.Drinks, id:\.id) { i in
                        
                        HStack{
                          Image(i.img)
                                .resizable()
                                .frame(width: 100,height: 100)
                                .cornerRadius(10)
                            VStack(alignment:.leading) {
                                Text(i.name)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .padding(.leading)
                                Spacer()
                                HStack{
                                    Text("$"+i.price)
                                        .font(.system(size: 20))
                                        .fontWeight(.black)
                                        .padding(.leading)
                                    Spacer()
                                }
                                Spacer()
                            }
                            Spacer()
                            NavigationLink("") {
                                AddToOrder(arr: $ORList, item: i)
                            }
                        }
                        
                    }
                    .listStyle(.plain)
                    Spacer()
                }
                
                VStack {
                    Spacer()
                        HStack {
                            Spacer()
                            Button {
                                present = true
                            } label: {
                                Image(systemName: "bag.circle.fill")
                                    .resizable()
                                    .frame(width: 60,height: 60)
                                    .foregroundColor(Color.black)
                                    .padding(.trailing)
                            }
                            .sheet(isPresented: $present) {
                                ExtractedView(arr: $ORList, present: $present)

                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DetailsOfRest: View {
   
    @State var Selected = 0
    var body: some View {
        VStack{
            HStack{
                HeaderButtons(Icon: "person")
                Spacer()
                HeaderButtons(Icon: "magnifyingglass")
            
            }
            HStack{
                VStack(spacing: 3){
                    Text("Restaurant")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.leading)
                    Text("Adderess of Restruent")
                        .font(.headline)
                    Text("\" Any Slogan \"")
                        .font(.title2)
                    
                }
                Spacer()
                VStack{
                    Image("Pizza")
                        .resizable()
                        .frame(width: 100,height:90)
                        .cornerRadius(10)
                        .padding()
                    HStack{
                        Image(systemName: "star.fill")
                        Text("7.9")
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                    }
                }
                
            }
            Spacer()
            
        }
    }
}

struct HeaderButtons: View {
    var Icon:String?
    
    var body: some View {
        Circle()
            .fill(Color.white)
            .frame(width: 50)
            .shadow(radius: 3)
            .overlay {
                Image(systemName: Icon!)
                    .font(.system(size: 30))
                    .contextMenu {
                        Text("Soon..!")
                    }
            }
            .padding()
    }
}

struct AddToOrder: View {
    @Environment(\.dismiss) var dismiss
    @State var Counter = 0
    @Binding var arr:[Modle]
    var item:Modle
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing:20){
                VStack(spacing: -220){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.yellow)
                        .frame(height: 300)
                        .ignoresSafeArea()
                        .overlay {
                            VStack {
                                HStack {
                                    Text(item.name)
                                        .font(.system(size: 60))
                                        .fontWeight(.heavy)
                                        .padding(.leading)
                                    Spacer()
                                }
                                    
                                Spacer()
                            }
                        }
                        
                    Image(item.img)
                        .resizable()
                        .frame(width: 200,height: 200)
                        .cornerRadius(100)
                        .shadow(radius: 20)
                }
                
                Stepper("Quintity") {
                    arr.append(item)
                    Counter += 1
                } onDecrement: {
                    arr.removeLast()
                    Counter -= 1
                }
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .padding()
                
               
                Rectangle()
                    .fill(Color.white)
                    .overlay {
                        
                        VStack(alignment: .leading){
                            Text("Info:")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ")
                            
                                .padding()
                        }
                        .padding()
                    }
                
                
                

                
                Spacer()
            }
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button {
                      dismiss()
                    } label: {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.yellow)
                            .frame(width: 100,height: 50)
                            .padding(.trailing)
                            .shadow(radius: 20)
                            .overlay {
                                HStack{
                                    Text("\(Counter)")
                                        .font(.system(size: 30))
                                        .foregroundColor(Color.black)
                                    Image(systemName: "bag.circle.fill")
                                        .resizable()
                                        .frame(width: 56,height: 50)
                                        .foregroundColor(Color.black)
                                }
                            }
                    }
                }
            }
        }
    }
}

struct ExtractedView: View {
    @Binding var arr:[Modle]
    @Binding var present:Bool
    @State var ok = false
    var body: some View {
        VStack{
            HStack{
                Button {
                    present = false
                } label: {
                    Text("X")
                        .font(.system(size: 30))
                        .foregroundColor(Color.red)
                        .padding()
                    
                    
                }
                Text("Orderd List")
                    .font(.system(size: 30))
                    .bold()
                Spacer()
            }
            Spacer()
            List{
                ForEach(arr,id: \.id) { item in
                    HStack{
                        Text(item.name)
                        Spacer()
                        Text("$"+item.price)
                    }
                }
                .onDelete { indexSet in
                    arr.remove(atOffsets: indexSet)
                }
            }
            Spacer()
            HStack {
                Text("$\(Total())")
                    .font(.system(size: 30))
                    .bold()
                Spacer()
                Button {
                    ok = true
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black)
                        .frame(width: 100,height: 50)
                        .overlay {
                            Text("Order")
                                .font(.system(size: 20))
                                .foregroundColor(Color.white)
                        }
                }.alert("Soon...!", isPresented: $ok) {
                    
                }


            }
            .padding()
            
        }
    }
    func Total() ->Int
    {
        var sum = 0
        for i in arr{
            sum = sum + Int(i.price)!
        }
        return sum
    }
}
