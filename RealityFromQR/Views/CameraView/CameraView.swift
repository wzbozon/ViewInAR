//
//  CameraView.swift
//  RealityFromQR
//
//  Created by Denis Kutlubaev on 28/06/2023.
//

import SwiftUI
import RealityKit
import ARKit

struct CameraView: View {
    let isShowingStatistics: Bool
    let isRenderOptionsEnabled: Bool

    var body: some View {
        ZStack {
            ARViewContainer(
                isShowingStatistics: isShowingStatistics,
                isRenderOptionsEnabled: isRenderOptionsEnabled
            ).edgesIgnoringSafeArea(.all)
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(isShowingStatistics: false, isRenderOptionsEnabled: false)
    }
}
