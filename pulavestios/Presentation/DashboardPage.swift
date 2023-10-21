//
//  DashboardPage.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 22/08/2023.
//

import Foundation
import SwiftUI

struct DashboardPage : View {
    var body : some View {
        VStack(spacing: 50) {
            PhaseAnimator([0, 1, 3]) { value in
                Text("Hello, world!")
                    .font(.largeTitle)
                    .scaleEffect(value)
                    .opacity(value == 1 ? 1 : 0)
                
                Text("Goodbye, world!")
                    .font(.largeTitle)
                    .scaleEffect(3 - value)
                    .opacity(value == 1 ? 1 : 0)
            }
        }
    }
}

struct DashboardPagepreview: PreviewProvider{
    static var previews: some View {
        DashboardPage()
    }
}
