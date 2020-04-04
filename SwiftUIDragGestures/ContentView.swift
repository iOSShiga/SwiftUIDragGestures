//
//  ContentView.swift
//  SwiftUIDragGestures
//
//  Created by shiga on 04/04/20.
//  Copyright © 2020 shiga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    
    
    var body: some View {
       
        // onChangedGesture
       // onChangedGesture()
        
        // onUpdatingGesture
       // upDatingGesture()
        
        //onEndedGesture
       // onEndedGesture()
        
        onLimitHorizontalScrollingGesture()
    }
}

// .onChanged

struct onChangedGesture: View {
    
    @State  private var rectPosition = CGPoint(x: 50, y: 50)

    var body: some View {
        
        VStack {
            
            RoundedRectangle(cornerRadius: 4.0)
                .fill(Color.green)
                .frame(width: 100, height: 100)
                .position(rectPosition)
                
                // .onChanged
                
                .gesture(DragGesture().onChanged({ (value ) in
                    self.rectPosition = value.location
                }))
        }
    }
}

// .upDating

struct upDatingGesture: View {

    @GestureState private var isDragging:Bool = false
    @State  private var rectPosition = CGPoint(x: 50, y: 50)

    
    var body: some View {
        
        VStack {
            
            
            Text(isDragging == true ? "isDraggingtrue" : "isDraggingfalse")

            
            RoundedRectangle(cornerRadius: 4.0)
                .fill(Color.green)
                .frame(width: 100, height: 100)
                .position(rectPosition)
                
              
            
            // .upDating
                .gesture(DragGesture().onChanged({ (value) in
                    self.rectPosition = value.location
                }).updating($isDragging, body: { (value, state, trans) in
                    state = true
                }))
        }
    }
}

// onEnded

struct onEndedGesture: View {
    
    @State  private var rectPosition = CGPoint(x: 50, y: 50)
    @State private var isEnded:Bool = false
    
    var body: some View {
        
        VStack {
            
            RoundedRectangle(cornerRadius: 4.0)
                .fill(isEnded ? Color.red : Color.green)
                .frame(width: 100, height: 100)
                .position(rectPosition)
                
                // .onChanged
                
                .gesture(DragGesture().onChanged({ (value ) in
                    self.rectPosition = value.location
                }).onEnded({ (value) in
                    self.isEnded = value.location.x < 120
                }))
        }
    }
}

// Limit Horizontal Scrolling

struct onLimitHorizontalScrollingGesture: View {
    
    @State  private var rectPosition = CGPoint(x: 50, y: 50)

    var body: some View {
        
        VStack {
            
            RoundedRectangle(cornerRadius: 4.0)
                .fill(Color.green)
                .frame(width: 100, height: 100)
                .position(rectPosition)
                
                // .onChanged
                
                .gesture(DragGesture().onChanged({ (value ) in
                    self.rectPosition = CGPoint(x: value.location.x, y: 50)
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
