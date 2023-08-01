//
//  ProductRow.swift
//  RealityFromQR
//
//  Created by Denis Kutlubaev on 30/07/2023.
//

import SwiftUI

struct ProductRow: View {
    var product: Product

    var body: some View {
        HStack {
            AsyncImage(url: product.imageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)

            Text(product.name)

            Spacer()
        }
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: products[0])
    }
}
