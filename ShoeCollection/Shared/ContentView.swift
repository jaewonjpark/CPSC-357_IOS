//
//  ContentView.swift
//  Shared
//
//  Created by Jaewon Park on 10/27/21.
//

import SwiftUI

struct ContentView: View
{
    //Add a state object binding to an instance of ShoeStore, passing through to its initializer the shoeData array created in the ShoeData.swift file
    @StateObject private var shoeStore : ShoeStore = ShoeStore(shoes: shoeData)
    
    var body: some View
    {
        //For this navigation link to function, the List view must also be embedded in a NavigationView
        NavigationView
        {
            List
            {
                //We have access to the array of shoes via the shoeStore property, so, we can use a ForEach loop to display a row for each shoe model
        
                ForEach (shoeStore.shoes)
                {
                    //The cell for each row will be implemented as an HStack containing an Image and a Text view, the content of which will be extracted from the shoeData array elements.
                    shoe in ListCell(shoe: shoe)
                }
                //Add some action methods to be used by the EditButton view
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            //Implementing Add and Edit Buttons
            .navigationBarTitle(Text("Shoes"))
            .navigationBarItems(leading: NavigationLink(destination: AddNewShoe(shoeStore: self.shoeStore))
                                {
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    func deleteItems(at offsets: IndexSet)
    {
        shoeStore.shoes.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int)
    {
        shoeStore.shoes.move(fromOffsets: source, toOffset: destination)
    }
}


struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

struct ListCell: View
{
    var shoe: Shoe
    
    var body: some View
    {
        //Implement navigation so that selecting a row displays the detail screen populated with the corresponding shoe details
        NavigationLink(destination: ShoeDetail(selectedShoe: shoe))
        {
            HStack
            {
                Image(shoe.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
            Text(shoe.name)
            }
        }
    }
}
