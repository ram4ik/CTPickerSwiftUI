//
//  ContentView.swift
//  CTPickerSwiftUI
//
//  Created by Ramill Ibragimov on 26.08.2020.
//

import SwiftUI
import CTPicker

struct ContentView: View, CTPicker {
    @State private var presentPicker = false
    @State private var tag = 1
    @State private var food: String = ""
    @State private var beverage: String = ""
    
    //@State private var foodArray = ["Milk", "Apples", "Sugar", "Eggs", "Oranges"]
    @StateObject private var groceriesVM = GroceriesViewModel()
    
    let ctpColors = CTPColors(headerBackgroundColor: .black, headerTintColor: .blue)
    
    let ctpStrings = CTPStrings(cancelBtnTitle: "Dismiss")
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    //TextField("Select a food item", text: $food)
                    CTPickerTextView(presentPicker: $presentPicker,
                                     fieldString: $food,
                                     placeholder: "Select a food item",
                                     tag: $tag,
                                     selectedTag: 1)
                    
                    CTPickerTextView(presentPicker: $presentPicker,
                                     fieldString: $beverage,
                                     placeholder: "Select a beverage",
                                     tag: $tag,
                                     selectedTag: 2)
                    Spacer()
                }
                .padding(.top)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)
                .navigationTitle("CTPicker")
            }
            
            if presentPicker {
                if tag == 1 {
                    CTPickerView(presentPicker: $presentPicker,
                                 pickerField: $food,
                                 //items: foodArray,
                                 items: groceriesVM.foodArray,
                                 saveUpdates: saveUpdates,
                                 noSort: true,
                                 ctpColors: ctpColors,
                                 ctpStrings: ctpStrings)
                        .zIndex(1.0)
                } else {
                    CTPickerView(presentPicker: $presentPicker,
                                 pickerField: $beverage,
                                 //items: foodArray,
                                 items: groceriesVM.beverageArray,
                                 saveUpdates: saveUpdates,
                                 //noSort: true,
                                 ctpColors: ctpColors,
                                 ctpStrings: ctpStrings)
                        .zIndex(1.0)
                }
            }
        }
    }
    
    func saveUpdates(_ newItem: String) {
        //foodArray.append(newItem)
        if tag == 1 {
            groceriesVM.newFoodItem(newItem)
        } else {
            groceriesVM.newBeverageItem(newItem)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
