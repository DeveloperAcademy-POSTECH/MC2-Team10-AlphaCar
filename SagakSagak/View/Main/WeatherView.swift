//
//  WeatherView.swift
//  SagakSagak
//
//  Created by been on 2023/05/15.
//

import SwiftUI


struct WeatherView: View {
    
    @Binding var isWeatherPresented: Bool
    @Binding var selectedWeatherImageName: String
    @Binding var weathetImageName: String
    
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 10){
                    Spacer()
                    GLNavBarTitle(navBarTitle: "오늘의 날씨는 어땠어?", navBarBgColor: .system2, navBarFontColor: .system1)
                        .padding(.top, 10)
                    
                    Button(action: {
                        isWeatherPresented.toggle()
                    }) {
                        Image("blueXBtn")
                    }
                    .padding(.top, 10)
                    .padding(.trailing, 10)
                    
                    
                }

                HStack(spacing: 12){
                    
                    Spacer()
                    Text("오늘은").font(FontManager.shared.nanumsquare(.bold, 30))

                    Text(UserDefaultsManager.shared.weather ?? "i'm noel")
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
                        .cornerRadius(10)

                    Text("날이야.").font(FontManager.shared.nanumsquare(.bold, 30))
                    Spacer()
                    
                }
                .padding(.top, 44)
                .padding(.bottom, 44)
//
//
                WeatherButtonView()


    
            }
            .frame(width: 580, height: 320)
            .background(Color.bg1)
            .cornerRadius(30)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color.black.opacity(0.5))
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(isWeatherPresented: .constant(true), selectedWeatherImageName: .constant("sun"), weathetImageName: .constant(""))
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
