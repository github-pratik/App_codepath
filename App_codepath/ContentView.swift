//
//  ContentView.swift
//  App_codepath
//
//  Created by Pratik Shashikant Patil on 15/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var originalPrice: String = ""  // User input for the original price
    @State private var discountPercentage: String = ""  // User input for the discount percentage
    @State private var finalPrice: String = ""  // Calculated final price

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // App Title
                Text("Discount Calculator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                // Input for Original Price
                TextField("Enter Original Price ($)", text: $originalPrice)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                // Input for Discount Percentage
                TextField("Enter Discount Percentage (%)", text: $discountPercentage)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                // Button to Calculate Discount
                Button(action: {
                    calculateDiscount()
                }) {
                    Text("Calculate")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                // Display Final Price
                if !finalPrice.isEmpty {
                    Text("Final Price: \(finalPrice) $")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                        .foregroundColor(.green)
                }

                Spacer()
            }
            .padding()
            .navigationBarTitle("Discount Calculator", displayMode: .inline)
        }
    }

    // Function to Calculate Discount
    private func calculateDiscount() {
        guard let price = Double(originalPrice), let discount = Double(discountPercentage) else {
            finalPrice = "Invalid input"
            return
        }
        let discountAmount = price * discount / 100
        let discountedPrice = price - discountAmount
        finalPrice = String(format: "%.2f", discountedPrice)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
