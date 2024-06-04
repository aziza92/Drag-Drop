//
//  ContentView.swift
//  DragDrop
//
//  Created by KARMANI Aziza on 18/09/2023.
//

import SwiftUI
import CoreData
import Algorithms

struct ContentView: View {

    @EnvironmentObject  var cityVM : CitiesViewModel
    
   
    @State private var droppedItems: [Cities] = []
    
    
    var body: some View {
        VStack(spacing: 10){
            
            ScrollView(.horizontal, showsIndicators: false) {
                RowView(cities: cityVM.city)
            }
            
            Spacer()
            
            Text("Drop it  ↓")
                .font(.body)
                .italic()
                .foregroundColor(.blue)
                .frame(alignment: .top)
            
            ScrollView(.horizontal, showsIndicators: false) {
             DroppedView(cities: droppedItems)
            }
            .frame(height: 150)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .dropDestination(for: Cities.self) { droppedTasks, location in
           
                let totalTasks = droppedItems + droppedTasks
                droppedItems = Array(totalTasks.uniqued())
                return true
            }
            .padding()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CitiesViewModel())
    }
}

struct RowView: View {
    
    var cities: [Cities]
    
    var body: some View {
        HStack( alignment: .top, spacing: 20) {
            
            
            ForEach(cities, id: \.id) { item in
                VStack {
                    Text(item.name)
                        .font(.footnote.bold())
                        .draggable(item.name)
                    
                    AsyncImage(url: URL(string: item.image)) { image in
                        image
                            .resizable()
                            .frame(width: 90, height: 80)
                            .padding()
                            .aspectRatio(contentMode: .fill)
                        
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .center)
                            .foregroundColor(.white.opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(height: 100)
                    
                }
                .draggable(item)
  
            }
        }
    }
}

struct DroppedView : View {
    
    var cities: [Cities]
    
    var body: some View {
        
        HStack(spacing: 20) {
            
            ForEach(cities, id: \.id) { item in
                
                VStack {
                    
                    Text(item.name)
                        .font(.footnote.bold())
                    
                    AsyncImage(url: URL(string: item.image)) { image in
                        image
                            .resizable()
                            .frame(width: 90, height: 80)
                            .padding()
                            .aspectRatio(contentMode: .fill)
                        
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .center)
                            .foregroundColor(.white.opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(height: 100)
                }
            }
        }
    }
}
