//
//  ProductListView.swift
//  RealityFromQR
//
//  Created by Denis Kutlubaev on 30/07/2023.
//

import SwiftUI

struct ProductListView: View {
    @State var productId: Int?

    var body: some View {
        List(products) { product in
            NavigationLink(tag: product.id, selection: self.$productId) {
                ProductDetailView(product: product)
            } label: {
                ProductRowView(product: product)
            }
        }
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(productId: 0)
    }
}
