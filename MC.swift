//
//  ContentView.swift
//  new_pr
//
//  Created by Mohmammad Sharıatı on 28.12.2023.
//

import SwiftUI
import AVFoundation
struct ContentView: View {
    public var i : Int = 0
    @State var yourname : String = ""
    @State var yournumber : String = ""
    @State var backcolor : Color = Color .white
    @State var myclients : [String] = []
    @State var myclientnumbers : [String] = []
    @State var myclientss : [String : String] = [:]
    @State var secondpage : Bool = false
    var body: some View {
        ZStack{
            
            backcolor
                
                
            NavigationView{
                VStack{
                    
                    VStack{
                        Image("LOGO")
                            .resizable()
                                  .aspectRatio(contentMode: .fit)
                                  .border(.black)
                                  .padding()
                                  .shadow(radius: 20)
                    }
                    
                    
                    VStack{
                        TextField("your name", text: $yourname)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .border(Color .black)
                            .padding()
                        TextField("your number", text: $yournumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .border(Color .black)
                            .padding()
                        
                        Button("Save") {
                            if errorcheck(){
                                savemydata()
                                vibrate()
                                
                            }
                            yournumber = ""
                            yourname = ""
                            
                        }
                        
                        .padding()
                        .border(Color.black)
                        .cornerRadius(10)
                        .disabled(!errorcheck())
                        
                        
                        NavigationLink("Cases", destination: luckyb(secondpage: $secondpage, myclientnumbers: $myclientnumbers, myclients: $myclients, myclientss: $myclientss))
                        
                            .bold()
                            .foregroundStyle(Color .green)
                            .padding()
                            .border(Color.black)
                            .cornerRadius(10)
                            .navigationBarBackButtonHidden(true)
                        
                    }
                    
                    
                    
                }
                    
            }
            
            
        }.ignoresSafeArea()
            
            
    }
        
    func errorcheck() -> Bool {
        if (yourname.count > 3 && yournumber .count == 11) {
            return true
        }
        return false
    }
     func savemydata(){
        myclients.append(yourname)
        myclientnumbers.append(yournumber)
         
        
    }
     func vibrate() {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
}
struct luckyb:View {
    @Binding var  secondpage : Bool
    @State var selection : String = ""
    @Binding var myclientnumbers : [String]
    @Binding var myclients : [String]
    @Binding var myclientss : [String:String]
    @State var bkh : String = ""
    @State var ms : Int = 0
    @State var statep : Bool = false
    @Environment(\.dismiss) var dismiss
    var body : some View
    {
        
        NavigationView{
            
            ScrollView{
                HStack {
                    VStack{
                        ForEach(myclients.indices ) { Identifiable in
                            Button(myclients[Identifiable]){
                                
                            }.fontWeight(.bold)
                                .font(.title2)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color .black)
                                .cornerRadius(10)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                        }
                    }.padding()
                    
                    VStack{
                        ForEach(myclientnumbers.indices ) { Identifiable in
                            Link(destination: URL(string: "tell:\(myclientnumbers[Identifiable]) ")!, label: {
                                Text(myclientnumbers[Identifiable])
                            }
                            ).fontWeight(.bold)
                                .font(.title3)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color .black)
                                .cornerRadius(10)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                        }
                    }.padding()
                }
            }
        }.navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement:.navigation) {
                    Button(action: {dismiss()}, label: {
                        Text("<")
                            .foregroundStyle(Color .white)
                            .font(.largeTitle)
                            .bold()
                            .background(Color .black)
                            .cornerRadius(15)
                            .shadow(radius: 15)
                    })
                }
            }
        }
          
           
    
}


#Preview {
    ContentView()
}

    
