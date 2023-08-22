//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by Yohan on 2023-08-22.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update = updateData[0]
    
    var body: some View {
        List {
            Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            Text(update.text)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationBarTitle(update.title)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
