//
//  TotalStatView.swift
//  TimerForStudy
//
//  Created by 김동욱 on 2023/01/02.
//

import SwiftUI

/// DescriptionView, ChartsView assembling View
struct TotalStatView: View {
    let stat: Statistics
    
    var body: some View {
        VStack {
            DescriptionView(total: stat.total)
                .padding(LayoutConstants.offset)
            ChartsView(subjects: stat.subjects)
        }
    }
}

private enum LayoutConstants {
    static let offset: CGFloat = 20
}

struct TotalStatView_Previews: PreviewProvider {
    static var previews: some View {
        TotalStatView(stat: StatisticsViewController.createMockObject())
    }
}
