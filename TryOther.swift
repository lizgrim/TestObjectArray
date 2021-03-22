//
//  TryOther.swift
//  Ecosystem
//
//  Created by Liz on 9/3/21.
//
import SwiftUI
import Combine

class TryPlant: ObservableObject  {

    @Published var plantType:String = ""
    let type = ["vine", "tree", "shrub", "herb"]
    
    func setType() {
        plantType = type.randomElement()  ?? "vine"
    }
    
}

class PlantGroup: ObservableObject {
    @Published var plantThing:TryPlant = TryPlant()
    @Published var plantArray:[TryPlant] = []
    
    func addPlant(plant: TryPlant) {
        plantArray.append(plant)
    }
    
}

struct TryView: View {
    @EnvironmentObject var plantThing:TryPlant
    @EnvironmentObject var plantGroup:PlantGroup
    
    var plantCount = 4
    @State var count = 0
    

    var body: some View {
        
        Text("Plant")
        Button(action: {
            plantGroup.plantArray = []
            count = 0
            while plantCount > count {
                plantThing.setType()
                let newPlant = plantThing
                //plantGroup.plantArray.append(plant)
                plantGroup.addPlant(plant:newPlant)
                print ("plant:\(plantGroup.plantArray[count].plantType)")
                count+=1
            }
            print("0: \(plantGroup.plantArray[0].plantType)")
            print("3: \(plantGroup.plantArray[3].plantType)")
        } ,label: {
          Text("Create ecosystem")
        })
        
    }
}

struct TryView_Previews: PreviewProvider {
    static var previews: some View {
        TryView()
    }
}
