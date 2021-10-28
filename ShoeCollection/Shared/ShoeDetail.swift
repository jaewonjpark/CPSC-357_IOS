//
//  ShoeDetail.swift
//  ShoeCollection
//
//  Created by Jaewon Park on 10/28/21.
//

//When a user taps a row in the list, a detail screen will appear showing additional information about the selected car.
//The layout for this screen will be declared in a separate SwiftUI View file which now needs to be added to the project.

import SwiftUI

struct ShoeDetail: View
{
    let selectedShoe: Shoe
    
    var body: some View
    {
        //Use a Form container to organize the views
        //Form containers allows views to be grouped together and divided into different sections
        //The Form also places a line divider between each child view
        Form
        {
            Section(header: Text("Shoes Details"))
            {
                Image(selectedShoe.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text(selectedShoe.name)
                    .font(.headline)
                
                Text(selectedShoe.description)
                    .font(.body)
                
                HStack
                {
                    Text("Own").font(.headline)
                    Spacer()
                    Image(systemName: selectedShoe.ownShoe ?
                          "checkmark.circle" : "xmark.circle")
                }
            }
        }
    }
}

struct ShoeDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        ShoeDetail(selectedShoe: shoeData[0])
    }
}
