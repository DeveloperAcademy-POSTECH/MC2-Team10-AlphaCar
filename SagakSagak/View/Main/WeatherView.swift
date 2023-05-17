//
//  WeatherView.swift
//  SagakSagak
//
//  Created by been on 2023/05/15.
//

import SwiftUI


struct WeatherView: View {
    
    @Binding var isWeatherPresented: Bool
    
    var weathetImageName: String = ""
    
    @Binding var selectedWeatherImageName: String
    @Binding var snowSelected: Bool
    @Binding var windSelected: Bool
    @Binding var sunSelected: Bool
    @Binding var cloudSelected: Bool
    @Binding var rainSelected: Bool
    @Binding var thunderSelected: Bool
    
    @Binding var weather: String
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
            ZStack {
                
                VStack {
                    HStack(spacing: 10){
                        Spacer()
                        GLNavBarTitle(navBarTitle: "오늘의 날씨는 어땠어?", navBarBgColor: .system2, navBarFontColor: .system1)
                            .padding(.top, 10)
                        
                        Button(action: {
                            isWeatherPresented = false
                        }) {
                            Image("blueXBtn")
                        }
                        .padding(.top, 10)
                        .padding(.trailing, 10)
                        
                        
                    }
                    
                    HStack(spacing: 12){
                        
                        Spacer()
                        Text("오늘은").font(FontManager.shared.nanumsquare(.bold, 30))
                        
                        if(snowSelected == true){
                            VStack{
                                Text("눈 오는")
                            }
                            .font(FontManager.shared.nanumsquare(.bold, 24))
                            .foregroundColor(Color(.white))
                            .frame(height: 60)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(.horizontal, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                                    .shadow(color: Color(hex: "006AFF"), radius: 7, x: 0, y: -6)
                                    .padding(-6)
                                    .background(Color.system1)
                            )
                            .cornerRadius(10)}
                        else if(windSelected == true){
                            VStack{
                                Text("바람 부는")
                            }
                            .font(FontManager.shared.nanumsquare(.bold, 24))
                            .foregroundColor(Color(.white))
                            .frame(height: 60)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(.horizontal, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                                    .shadow(color: Color(hex: "006AFF"), radius: 7, x: 0, y: -6)
                                    .padding(-6)
                                    .background(Color.system1)
                            )
                            .cornerRadius(10)}
                        else if(sunSelected == true){
                            VStack{
                                Text("맑은")
                            }
                            .font(FontManager.shared.nanumsquare(.bold, 24))
                            .foregroundColor(Color(.white))
                            .frame(height: 60)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(.horizontal, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                                    .shadow(color: Color(hex: "006AFF"), radius: 7, x: 0, y: -6)
                                    .padding(-6)
                                    .background(Color.system1)
                            )
                            .cornerRadius(10)}
                        else if(cloudSelected == true){
                            VStack{
                                Text("구름 낀")
                            }
                            .font(FontManager.shared.nanumsquare(.bold, 24))
                            .foregroundColor(Color(.white))
                            .frame(height: 60)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(.horizontal, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                                    .shadow(color: Color(hex: "006AFF"), radius: 7, x: 0, y: -6)
                                    .padding(-6)
                                    .background(Color.system1)
                            )
                            .cornerRadius(10)}
                        else if(rainSelected == true){
                            VStack{
                                Text("비 오는")
                            }
                            .font(FontManager.shared.nanumsquare(.bold, 24))
                            .foregroundColor(Color(.white))
                            .frame(height: 60)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(.horizontal, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                                    .shadow(color: Color(hex: "006AFF"), radius: 7, x: 0, y: -6)
                                    .padding(-6)
                                    .background(Color.system1)
                            )
                            .cornerRadius(10)}
                        else if(thunderSelected == true){
                            VStack{
                                Text("천둥번개 치는")
                            }
                            .font(FontManager.shared.nanumsquare(.bold, 24))
                            .foregroundColor(Color(.white))
                            .frame(height: 60)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(.horizontal, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                                    .shadow(color: Color(hex: "006AFF"), radius: 7, x: 0, y: -6)
                                    .padding(-6)
                                    .background(Color.system1)
                            )
                            .cornerRadius(10)}
                        
                        else {
                            VStack{
                                Text("           ")
                            }
                            .font(FontManager.shared.nanumsquare(.bold, 24))
                            .foregroundColor(Color(.white))
                            .frame(height: 60)
                            .fixedSize(horizontal: true, vertical: false)
                            .padding(.horizontal, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                                    .shadow(color: Color(hex: "006AFF"), radius: 7, x: 0, y: 3)
                                    .padding(-10)
                                    .background(Color.system2)
                            )
                            .cornerRadius(10)
                            
                        }
                        
                        
                        Text("날이야.").font(FontManager.shared.nanumsquare(.bold, 30))
                        Spacer()
                        
                    }
                    .padding(.top, 44)
                    .padding(.bottom, 44)
                    //
                    //
                    ZStack {
                        Rectangle()
                            .frame(width: 580, height: 100)
                            .foregroundColor(.white)
                        HStack {
                            //눈
                            Spacer()
                            HStack(spacing: 16) {
                                Button(action: {
                                    selectedWeatherImageName = "snow"
                                    snowSelected = true
                                    windSelected = false
                                    sunSelected = false
                                    cloudSelected = false
                                    rainSelected = false
                                    thunderSelected = false
                                    weather = "snowy"
                                }) {VStack{
                                    Image("snow")
                                        .frame(width: 60, height: 60)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                                                .shadow(color: snowSelected ? Color(hex: "579DFF").opacity(0.3) : Color(hex: "579DFF").opacity(0.3), radius: 5, y: snowSelected ? 5.5 : -5.5)
                                                .padding(-6))
                                }
                                .background(snowSelected ? Color(hex: "F2F7FF") : Color(hex: "D6E7FF"))
                                .cornerRadius(10)
                                }
                                //바람
                                Button(action: {
                                    selectedWeatherImageName = "wind"
                                    snowSelected = false
                                    windSelected = true
                                    sunSelected = false
                                    cloudSelected = false
                                    rainSelected = false
                                    thunderSelected = false
                                    weather = "windy"
                                }) {VStack{
                                    Image("wind")
                                        .frame(width: 60, height: 60)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                                                .shadow(color: windSelected ? Color(hex: "579DFF").opacity(0.3) : Color(hex: "579DFF").opacity(0.3), radius: 5, y: windSelected ? 5.5 : -5.5)
                                                .padding(-6))
                                }
                                .background(windSelected ? Color(hex: "F2F7FF") : Color(hex: "D6E7FF"))
                                .cornerRadius(10)
                                }
                                //태양
                                Button(action: {
                                    selectedWeatherImageName = "sun"
                                    snowSelected = false
                                    windSelected = false
                                    sunSelected = true
                                    cloudSelected = false
                                    rainSelected = false
                                    thunderSelected = false
                                    weather = "sunny"
                                }) {VStack{
                                    Image("sun")
                                        .frame(width: 60, height: 60)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                                                .shadow(color: sunSelected ? Color(hex: "579DFF").opacity(0.3) : Color(hex: "579DFF").opacity(0.3), radius: 5, y: sunSelected ? 5.5 : -5.5)
                                                .padding(-6))
                                }
                                .background(sunSelected ? Color(hex: "F2F7FF") : Color(hex: "D6E7FF"))
                                .cornerRadius(10)
                                }
                                //구름
                                Button(action: {
                                    selectedWeatherImageName = "cloud"
                                    snowSelected = false
                                    windSelected = false
                                    sunSelected = false
                                    cloudSelected = true
                                    rainSelected = false
                                    thunderSelected = false
                                    weather = "cloudy"
                                }) {VStack{
                                    Image("cloud")
                                        .frame(width: 60, height: 60)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                                                .shadow(color: cloudSelected ? Color(hex: "579DFF").opacity(0.3) : Color(hex: "579DFF").opacity(0.3), radius: 5, y: cloudSelected ? 5.5 : -5.5)
                                                .padding(-6))
                                }
                                .background(cloudSelected ? Color(hex: "F2F7FF") : Color(hex: "D6E7FF"))
                                .cornerRadius(10)
                                }
                                //비
                                Button(action: {
                                    selectedWeatherImageName = "rain"
                                    snowSelected = false
                                    windSelected = false
                                    sunSelected = false
                                    cloudSelected = false
                                    rainSelected = true
                                    thunderSelected = false
                                    weather = "rainy"
                                }) {VStack{
                                    Image("rain")
                                        .frame(width: 60, height: 60)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                                                .shadow(color: rainSelected ? Color(hex: "579DFF").opacity(0.3) : Color(hex: "579DFF").opacity(0.3), radius: 5, y: rainSelected ? 5.5 : -5.5)
                                                .padding(-6))
                                }
                                .background(rainSelected ? Color(hex: "F2F7FF") : Color(hex: "D6E7FF"))
                                .cornerRadius(10)
                                }
                                //번개
                                Button(action: {
                                    selectedWeatherImageName = "thunder"
                                    snowSelected = false
                                    windSelected = false
                                    sunSelected = false
                                    cloudSelected = false
                                    rainSelected = false
                                    thunderSelected = true
                                    weather = "stormy"
                                }) {VStack{
                                    Image("thunder")
                                        .frame(width: 60, height: 60)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color(.white).opacity(0.1), lineWidth: 5)
                                                .shadow(color: thunderSelected ? Color(hex: "579DFF").opacity(0.3) : Color(hex: "579DFF").opacity(0.3), radius: 5, y: thunderSelected ? 5.5 : -5.5)
                                                .padding(-6))
                                }
                                .background(thunderSelected ? Color(hex: "F2F7FF") : Color(hex: "D6E7FF"))
                                .cornerRadius(10)
                                }
                                
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: 580, alignment: .center)
                            Spacer()
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .background(Color.black.opacity(0.5))
                }
                
            }
            .frame(width: 580, height: 320)
            .background(Color.bg1)
            .cornerRadius(30)
            
            
            
            //
            //
            
            
            
        }
        //        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //        .ignoresSafeArea()
        //        .background(Color.black.opacity(0.5))
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(isWeatherPresented: .constant(false), selectedWeatherImageName: .constant(""), snowSelected: .constant(false), windSelected: .constant(false), sunSelected: .constant(false), cloudSelected: .constant(false), rainSelected: .constant(false), thunderSelected: .constant(false), weather: .constant(""))
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
