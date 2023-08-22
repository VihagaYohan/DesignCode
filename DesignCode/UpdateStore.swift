//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Yohan on 2023-08-22.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
