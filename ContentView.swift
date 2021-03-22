import SwiftUI
import Combine

struct ContentView: View {
  
    //from TryOther.swift file
    @StateObject var plantThing = TryPlant()
    @StateObject var plantGroup = PlantGroup()
    
    var body: some View {
        NavigationView {
        Form{
        Section {
            TryView()
                .environmentObject(plantThing).environmentObject(plantGroup)
         
        }
        
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AtmosView()
    }
}
