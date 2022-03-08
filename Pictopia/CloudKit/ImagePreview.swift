//
//  ImagePreview.swift
//  Pictopia
//
//  Created by Antonio Braccolino on 08/03/22.
//

import Foundation
import SwiftUI

struct ImagePreview : View {
    let img : String = "rthirds"
    
    var body: some View {
        ZStack {
            Image(img)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(radius: 5)
    }
}

struct ImagePreview_Previews: PreviewProvider {
    static var previews: some View {
        ImagePreview()
            .preferredColorScheme(ColorScheme .dark)
    }
}
