//
//  AspectVGrid.swift
//  memorize
//
//  Created by Бекдаулет Касымов on 22.03.2022.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView
    
    init(items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width = widthThatFits(itemsCount: items.count, in: geometry.size, itemAspectRatio: aspectRatio)
            LazyVGrid(columns: [adaptiveGridItem(width: width)], spacing: 0) {
                ForEach(items) { item in
                    content(item).aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
            Spacer(minLength: 0)
        }
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    private func widthThatFits(itemsCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        var columnsCount = 1
        var rowCount = itemsCount
        repeat {
            let itemWidth = size.width / CGFloat(columnsCount)
            let itemHeight = itemWidth / itemAspectRatio
            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            columnsCount += 1
            rowCount = (itemsCount + (columnsCount - 1)) / columnsCount
        } while columnsCount < itemsCount
        if columnsCount > itemsCount {
            columnsCount = itemsCount
        }
        return floor(size.width / CGFloat(columnsCount))
    }
}

//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid()
//    }
//}
