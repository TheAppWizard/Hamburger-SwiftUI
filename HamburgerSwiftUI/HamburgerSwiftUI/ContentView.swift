//
//  ContentView.swift
//  HamburgerSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 29/01/21.
//  The App Wizard
//  Instagram : theappwizard2408

import SwiftUI

struct ContentView: View {

    var body: some View {
        HamBurger()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




























struct HamBurger: View {
    @State var rotobj = false
    @State private var showDetails = false
    @State private var showDetails2 = false

    var body: some View {
       ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            
        
        VStack{
            
            Spacer().frame(height: 250)
                
            
            Text("The App Wizard")
                .font(.title3)
                .fontWeight(.thin)
                .foregroundColor(Color.white)
            
            
        }
       
        Button(action: {
                self.showDetails.toggle()
            }) {
                VStack{
                RoundedRectangle(cornerRadius: 25.0)
                 .frame(width: 55, height: 10, alignment: .center)
                 .foregroundColor(.white)
                    
                RoundedRectangle(cornerRadius: 25.0)
                 .frame(width: 55, height: 10, alignment: .center)
                 .foregroundColor(.white)
                    
                RoundedRectangle(cornerRadius: 25.0)
                     .frame(width: 55, height: 10, alignment: .center)
                     .foregroundColor(.white)
                }
            }

            if showDetails {
                ButtonView()
                    .rotationEffect(.degrees(rotobj ? 90 : 0))
                    .animation(Animation.easeInOut(duration: 3).delay(0.8).repeatCount(1))
                                        .onAppear(){
                                         self.rotobj.toggle()
                            }
                 }
        }
    }
}


struct ButtonView: View {
    var body: some View {
        ZStack{
            
           // OffsetView()
           // OffsetView().offset( y: -15)
           
            CenterLine()
            LineToCircle()
            LineToCircle1()
            XView().offset(y: -15)
            XView2().offset(y: -15)
                .rotationEffect(.degrees(180))
            
        }
    }
}



struct XView: View {
    @State var line1 = false
    @State var line2 = false
    
    var body: some View {
        ZStack{
           RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 55, height: 10, alignment: .center)
            .foregroundColor(.white)
            .rotationEffect(.degrees(line1 ? 45 : 0))
            .offset(x: line1 ? -16: 0)
            .animation(Animation.easeInOut(duration: 3).delay(0.8).repeatCount(1))
                                .onAppear(){
                                 self.line1.toggle()
                                }
            
           
            RoundedRectangle(cornerRadius: 25.0)
             .frame(width: 55, height: 10, alignment: .center)
             .foregroundColor(.white)
            .rotationEffect(.degrees(line2 ? -45 : 0))
            .offset(x: line2 ? 16: 0)
            .animation(Animation.easeInOut(duration: 3).delay(0.8).repeatCount(1))
                                    .onAppear(){
                                     self.line2.toggle()
                                    }
            
        
        }
    }
}

struct XView2: View {
    @State var line1 = false
    @State var line2 = false
    
    var body: some View {
        ZStack{
           RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 55, height: 10, alignment: .center)
            .foregroundColor(.white)
            .rotationEffect(.degrees(line1 ? 45 : 0))
            .offset(x: line1 ? -16: 0)
            .animation(Animation.easeInOut(duration: 3).delay(0.8).repeatCount(1))
                                .onAppear(){
                                 self.line1.toggle()
                                }
            
           
            RoundedRectangle(cornerRadius: 25.0)
             .frame(width: 55, height: 10, alignment: .center)
             .foregroundColor(.white)
            .rotationEffect(.degrees(line2 ? -45 : 0))
            .offset(x: line2 ? 16: 0)
            .animation(Animation.easeInOut(duration: 3).delay(0.8).repeatCount(1))
                                    .onAppear(){
                                     self.line2.toggle()
                                    }
            
        
        }
    }
}


struct CenterLine: View {
    @State var line1 = false
    @State var line2 = false
    @State var ScaleCircle = false
    @State var CentOpac = false
    
    
    var body: some View {
        ZStack{
            
             
            
           RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 135, height: 10, alignment: .center)
            .foregroundColor(.white)
            .offset(x: line1 ? 16: 0)
            .scaleEffect(line1 ? 1: 0)
            .animation(Animation.easeInOut(duration: 1).delay(1).repeatCount(1))
                                .onAppear(){
                                 self.line1.toggle()
                                }
            
           
            RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 135, height: 10, alignment: .center)
            .foregroundColor(.white)
            .scaleEffect(line2 ? 1: 0)
            .offset(x: line2 ? -16: 0)
            .animation(Animation.easeInOut(duration: 1).delay(1).repeatCount(1))
                                    .onAppear(){
                                     self.line2.toggle()
                                    }
            
            
            Circle()
                .frame(width: 220, height: 220, alignment: .center)
                .offset( y: -5)
                .foregroundColor(Color("Background"))
               // .foregroundColor(Color.blue).opacity(0.8)
                .scaleEffect(ScaleCircle ? 1: 0)
                .animation(Animation.easeInOut(duration: 1.8).delay(1).repeatCount(1))
                                    .onAppear(){
                                     self.ScaleCircle.toggle()
          
                                    }
            
             RoundedRectangle(cornerRadius: 25.0)
             .frame(width: 55, height: 10, alignment: .center)
             .foregroundColor(.white)
             .scaleEffect(CentOpac ? 0: 1)
                .animation(Animation.easeInOut(duration: 0.5).delay(1).repeatCount(1))
                                    .onAppear(){
                                     self.CentOpac.toggle()
          
                                    }
             
            
            
        
        }
    }
}


struct LineToCircle: View {
    @State private var borderanim1: CGFloat = 0.0
    let timer1 = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
       
           
       var body: some View {
           ZStack{
               Circle()
                   .trim( from: 0, to: self.borderanim1)
                  .stroke(Color.white, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                 .frame(width: 160, height: 160, alignment: .center)
                   .rotationEffect(.degrees(0))
                                  .onReceive(timer1) { _ in
                                      withAnimation {
                                        guard self.borderanim1 < 0.5 else { return }
                                        self.borderanim1 += 0.5
                                      }
                                  }
            
        }
    }
}

struct LineToCircle1: View {
    @State private var borderanim1: CGFloat = 0.0
    let timer1 = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
       
           
       var body: some View {
           ZStack{
               Circle()
                   .trim( from: 0, to: self.borderanim1)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                   .frame(width: 160, height: 160, alignment: .center)
                   .rotationEffect(.degrees(180))
                                  .onReceive(timer1) { _ in
                                      withAnimation {
                                        guard self.borderanim1 < 0.5 else { return }
                                        self.borderanim1 += 0.5
                  }
              }

        }
    }
}

