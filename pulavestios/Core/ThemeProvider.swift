//
//  ThemeProvider.swift
//  pulavestios
//
//  Created by Qazeem Abiodun on 07/08/2023.
//

import Foundation
import SwiftUI

struct Typography{
    var h1:Font
    var h2:Font
    var h3:Font
    var h4:Font
    var h5:Font
    var h6:Font
    var body1:Font
    var body2:Font
}

struct Colors {
    var primary: Color
    var secondary: Color
    var primaryVariant: Color
    var backGround: Color
    var surface: Color
    var onPrimary: Color
    var onBackGround: Color
    var onSurface : Color
    var onError: Color
    var error: Color
    var warning: Color
    var success: Color
    var outline: Color
    var disabled: Color
    var severeWarning: Color
    var generalNotes: Color
    var successNotes: Color
}


struct Spacing{
    var largeSpacing:CGFloat
    var mediumSpacing:CGFloat
    var smallSpacing:CGFloat
    var extraLargeSpacing: CGFloat
}


struct Shapes{
    var largeCornerRadius:CGFloat
    var mediumCornerRadius:CGFloat
    var smallCornerRadius:CGFloat
}


class Theme : ObservableObject{
    let colors: Colors
    let shapes: Shapes
    let spacing: Spacing
    let typography: Typography

    init(colors: Colors, shapes: Shapes, spacing: Spacing, typography: Typography) {
        self.colors = colors
        self.shapes = shapes
        self.spacing = spacing
        self.typography = typography
    }
}


extension Theme {
    static let dark = Theme(
        colors: Colors(primary: Color(red: 0.31, green: 0.78, blue: 0.47), secondary: Color("Secondary"), primaryVariant: Color("PrimaryVariant"), backGround: Color("Background"), surface: Color("Surface"), onPrimary: Color("OnPrimary"), onBackGround: Color("OnBackGround"), onSurface: Color("OnSurface"), onError: Color("OnError"), error: Color("Error"), warning: Color("Warning"), success: Color("Success"), outline: Color("OutlineColor"), disabled: Color("DisabledColor"), severeWarning: Color("SevereWarning"), generalNotes: Color("GeneralNotes"), successNotes: Color("SuccessNotes")),
        
        shapes: Shapes(largeCornerRadius: 16, mediumCornerRadius: 12, smallCornerRadius: 8),
        
        spacing: Spacing(largeSpacing: 24, mediumSpacing: 16, smallSpacing: 8, extraLargeSpacing: 32),
        
        typography: Typography(h1: Font.custom("NunitoSans-Bold", size: 32), h2:Font.custom("NunitoSans-Bold", size: 24), h3: Font.custom("NunitoSans-Bold", size: 18), h4: Font.custom("NunitoSans-Bold", size: 14), h5: Font.custom("NunitoSans-Bold", size: 12), h6: Font.custom("NunitoSans-Bold", size: 10), body1: Font.custom("NunitoSans-Regular", size: 14), body2: Font.custom("NunitoSans-Regular", size: 14)))
   
 static let light = Theme(
        colors: Colors(primary: Color(red: 0.31, green: 0.78, blue: 0.47), secondary: Color("Secondary"), primaryVariant: Color("PrimaryVariant"), backGround: Color("Background"), surface: Color("Surface"), onPrimary: Color("OnPrimary"), onBackGround: Color("OnBackGround"), onSurface: Color("OnSurface"), onError: Color("OnError"), error: Color("Error"), warning: Color("Warning"), success: Color("Success"), outline: Color("OutlineColor"), disabled: Color("DisabledColor"), severeWarning: Color("SevereWarning"), generalNotes: Color("GeneralNotes"), successNotes: Color("SuccessNotes")),
        
        shapes: Shapes(largeCornerRadius: 16, mediumCornerRadius: 12, smallCornerRadius: 8),
        
        spacing: Spacing(largeSpacing: 24, mediumSpacing: 16, smallSpacing: 8, extraLargeSpacing: 32),
        
        typography: Typography(h1: Font.custom("NunitoSans-Bold", size: 32), h2:Font.custom("NunitoSans-Bold", size: 24), h3: Font.custom("NunitoSans-Bold", size: 18), h4: Font.custom("NunitoSans-Bold", size: 14), h5: Font.custom("NunitoSans-Bold", size: 12), h6: Font.custom("NunitoSans-Bold", size: 10), body1: Font.custom("NunitoSans-Regular", size: 14), body2: Font.custom("NunitoSans-Regular", size: 14))
    )
    
}


class ThemeManager: ObservableObject {
    @Published var current: Theme = .light
}
