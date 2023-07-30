//
//  MenuViewModel.swift
//  RealityFromQR
//
//  Created by Denis Kutlubaev on 28/06/2023.
//

import ARKit
import Combine
import Foundation
import RealityKit

/// MVVM ViewModel Template
@MainActor
final class MenuViewModel: ObservableObject {
    @Published var isShowingCameraView = false
    @Published var isShowingProductList = false
    @Published var isShowingFileImporter = false
    @Published var isShowingStatistics = false
    @Published var isRenderOptionsEnabled = true

    func selectFileTapped() {
        isShowingFileImporter = true
    }

    func useDefaultModelTapped() {
        isShowingCameraView = true
    }

    func productListTapped() {
        isShowingProductList = true
    }

    func handlePickedFile(_ url: URL) {
        print("Did select file: \(url)")

        do {
            var url = url
            // Load usdz files directly
            // For reality files append a scene name
            if url.pathExtension == "reality" {
                url = url.appendingPathComponent(Constants.sceneName, isDirectory: false)
            }

            model.entity = try Entity.load(contentsOf: url)
            print("Model loaded")

            // Show CameraView, it will setup ARView with a scene / entity in Model
            isShowingCameraView = true
        } catch {
            print("Failed to load entity. Error: \(error)")
        }
    }

    private let model = Model.shared
}

// MARK: - Private

private extension MenuViewModel {
    enum Constants {
        static let sceneName = "Scene"
    }
}
