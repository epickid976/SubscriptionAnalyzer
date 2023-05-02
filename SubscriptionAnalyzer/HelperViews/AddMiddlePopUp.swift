//
//  MiddlePopUp.swift
//  SubscriptionAnalyzer
//
//  Created by Jose Blanco on 4/26/23.
//

import SwiftUI
import AdvancedList
import PopupView
import UIKit
import Introspect


struct AddMiddlePopUp: CentrePopup {
    let id: String = "add_subscription"
    
    var db = DataBaseManager.shared
    @State var title = String()
    @State var description = String()
    @State private var date = Date()
    @State private var recurrenceDate = Date()
    @Environment(\.colorScheme) var colorScheme
    
    var selection  = Category.allCases.map {$0.rawValue}
    @State var selected = Category.entertainment.rawValue
    
    var selectionRecurrence = Recurrence.allCases.map {$0.rawValue}
    @State var selectedRecurrence = Recurrence.monthly.rawValue
    
    @State private var isSubtitleHidden = false
    @State private var price = 10
    private var numberFormatter: NumberFormatterProtocol
       
       init(numberFormatter: NumberFormatterProtocol = NumberFormatter()) {
           self.numberFormatter = numberFormatter
           self.numberFormatter.numberStyle = .currency
           self.numberFormatter.maximumFractionDigits = 2
       }
    
    func createContent() -> some View {
        VStack(spacing: 0) {
            titleAndDescription()
            priceView()
            dateView()
            buttons()
        }
        .padding(.vertical, 24)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        
        // .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    func titleAndDescription() -> some View {
        VStack {
            Text("Add Subscription")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 10)
            
            
            
            Spacer()
                .frame(height: 10)
            Text("Title")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            TextField("Title", text: $title)
                .textFieldStyle(OvalTextFieldStyle(color: determineColor(cases: Category(rawValue: selected) ?? .donation)))
                .introspectTextField { (textField) in
                           let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
                           let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
                           let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
                           doneButton.tintColor = UIColor(determineColor(cases: Category(rawValue: selected) ?? .donation))
                           toolBar.items = [flexButton, doneButton]
                           toolBar.setItems([flexButton, doneButton], animated: true)
                           textField.inputAccessoryView = toolBar
                        }
            Spacer()
                .frame(height: 10)
            Text("Description")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
           
        }
    }
    
    func priceView() -> some View {
        VStack {
            Spacer()
                .frame(height: 10)
            TextField("Description", text: $description)
                .textFieldStyle(OvalTextFieldStyle(color: determineColor(cases: Category(rawValue: selected) ?? .donation)))
                .introspectTextField { (textField) in
                           let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
                           let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
                           let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
                           doneButton.tintColor = UIColor(determineColor(cases: Category(rawValue: selected) ?? .donation))
                           toolBar.items = [flexButton, doneButton]
                           toolBar.setItems([flexButton, doneButton], animated: true)
                           textField.inputAccessoryView = toolBar
                        }
            Spacer()
                .frame(height: 10)
            Text("Price")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 10)
            CurrencyTextField(numberFormatter: numberFormatter, value: $price)
                .keyboardType(.decimalPad)
                .introspectTextField { (textField) in
                           let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
                           let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
                           let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
                           doneButton.tintColor = UIColor(determineColor(cases: Category(rawValue: selected) ?? .donation))
                           toolBar.items = [flexButton, doneButton]
                           toolBar.setItems([flexButton, doneButton], animated: true)
                           textField.inputAccessoryView = toolBar
                        }
                .frame(height: 40)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(LinearGradient(colors: [determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.7), determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
                .frame(width: 100, height: 40)
                
            
            
            
            
           
        }
    }
    
    func dateView() -> some View {
        VStack {
            Spacer()
                .frame(height: 10)
            Divider()
                .overlay(LinearGradient(colors: [determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.7), determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            DatePicker(
                    "Start Date:",
                    selection: $date,
                    displayedComponents: [.date]
                )
            .tint(determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.7))
            .fontWeight(.bold)
            Spacer()
                .frame(height: 10)
           
            
            
            DatePicker(
                "Recurrence Date:",
                    selection: $recurrenceDate,
                    displayedComponents: [.date]
                )
            .tint(determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.7))
            .fontWeight(.bold)
            Spacer()
                .frame(height: 10)
            
            Divider()
                .overlay(LinearGradient(colors: [determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.7), determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Spacer()
                .frame(height: 10)
            
            HStack {
                Text("Category: ")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(5)
                Picker("Category", selection: $selected) {
                    ForEach(selection, id: \.self) {
                        Text($0)
                    }
                    
                }
                .pickerStyle(.menu)
                .accentColor(determineColor(cases: Category(rawValue: selected)!))
                .padding(5)
            }.overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(LinearGradient(colors: [determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.7), determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
            
            .padding(10)
//            .background(.thinMaterial)
//            .cornerRadius(50)
            HStack {
                Text("Reccurence: ")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(5)
                Picker("Reccurence", selection: $selectedRecurrence) {
                    ForEach(selectionRecurrence, id: \.self) {
                        Text($0)
                    }
                    
                }
                .pickerStyle(.menu)
                .accentColor(determineColor(cases: Category(rawValue: selected)!))
                .padding(5)
            }
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(LinearGradient(colors: [determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.7), determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
            
        }
    }
    func buttons() -> some View {
        VStack {
            Spacer()
                .frame(height: 10)
            
            HStack {
                
                Button {
                    AddMiddlePopUp().dismiss()
                } label: {
                    Text("Cancel")
                        .font(.title2)
                        .bold()
                        .padding(10)
                }
                .contentShape(Rectangle())
                
                //.buttonStyle(.borderedProminent)
                .background(LinearGradient(colors: [determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(1.0), determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .foregroundColor(.white)
                
                .cornerRadius(50)
                Button {
                    AddMiddlePopUp().dismiss()
                    let newSubscription = Subscription(id: UUID(), name: title, description: description, price: Double(price), recurrence: Recurrence(rawValue: selectedRecurrence) ?? .yearly, recurrenceDate: recurrenceDate, startDate: date, category: Category(rawValue: selected) ?? .donation)
                    DispatchQueue.main.async {
                        db.addSubscription(subscription: newSubscription)
                    }
                } label: {
                    Text("Add")
                        .font(.title2)
                        .bold()
                        .padding(10)
                }
                .contentShape(Rectangle())
                .background(LinearGradient(colors: [determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(1.0), determineColor(cases: Category(rawValue: selected) ?? .donation).opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(50)
                .foregroundColor(.white)
            }
            Spacer()
                .frame(height: 10)
        }
    }
    
    func configurePopup(popup: CentrePopupConfig) -> CentrePopupConfig {
        popup
            .horizontalPadding(20)
            .backgroundColour(Color(.systemGray6).opacity(1.5))
            .tapOutsideToDismiss(false)
    }
    
    
}
