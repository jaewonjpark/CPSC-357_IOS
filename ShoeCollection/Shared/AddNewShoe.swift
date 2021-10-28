//
//  AddNewShoe.swift
//  ShoeCollection
//
//  Created by Jaewon Park on 10/28/21.
//

// Designing the Add Shoe View
// The final view to be added to the project represents the screen to be displayed when the user is adding a new shoe to the "owned" list

import SwiftUI

struct AddNewShoe: View
{
    //Add state properties and declarations for storing a reference to the shoeStore binding (this reference will be passed to the view from the ContentView when the user taps an Add button)
    @StateObject var shoeStore : ShoeStore
    @State private var owned = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View
    {
        // With the subview added (below), declare the user interface layout for the main view
        Form
        {
            Section(header: Text("Shoe Details"))
            {
                Image(systemName: "shoe.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Item", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $owned)
                {
                    Text("Already Owned").font(.headline)
                }
                .padding()
            }
            //The Button view is configured to call an action method named addNewShoe when clicked.
            Button(action: addNewShoe)
            {
                Text("Add Shoe")
            }
        }
    }
    
    //The new car function creates a new Car instance using the Swift UUID() method to generate a unique identifier for the entry and the content entered by the user
    func addNewShoe()
    {
        //Using the Swift UUID() method to generate a unique identifier for the entry and the content entered by the user
        let newShoe = Shoe(id: UUID().uuidString, name: name, description: description, ownShoe: owned, imageName: "Jordan 1 Retro High x Travis Scott" )
    
        shoeStore.shoes.append(newShoe)
    }
}


struct DataInput: View
{
    //The property must be declared using the @Binding property wrapper if the view is being passed a state property
    var title: String
    @Binding var userInput: String
    
    var body: some View
    {
        VStack(alignment: HorizontalAlignment.leading)
        {
            Text(title)
                .font(.headline)
            
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}


struct AddNewShoe_Previews: PreviewProvider
{
    static var previews: some View
    {
        AddNewShoe(shoeStore: ShoeStore(shoes: shoeData))
    }
}
