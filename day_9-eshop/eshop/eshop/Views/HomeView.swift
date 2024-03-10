//
//  HomeView.swift
//  eshop
//
//  Created by trivo on 03/03/2024.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""

    var body: some View {
        mainContent
    }

    private var mainContent: some View {
        VStack(alignment: .leading, spacing: 14) {
            // navigation bar
            navigationBarContent
            // search & filter
            searchAndFilterContent
            // scroll view
            ScrollView {
                // recommendation carousel
                recommendationCarousel
                // categories
                HomeSectionHeaderComponent(sectionTitle: "Popular Items", viewAllHandler: {
                    // tap view all
                })
                popularItems
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private var navigationBarContent: some View {
        HStack(alignment: .top) {
            Button(action: {

            }, label: {
                Image(systemName: "menucard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.black)

            })
            .padding(.init(top: 0, leading: 24, bottom: 0, trailing: 0))
            Spacer()
            Button(action: {

            }, label: {
                Image(systemName: "cart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.black)

            })
            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 24))
        }
        .frame(maxWidth: .infinity, maxHeight: 80, alignment: .center)
    }
    
    private var searchAndFilterContent: some View {
        HStack(spacing: 10) {
            // text field
            HStack {
                // icon
                Image(systemName: "magnifyingglass.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                // text field
                TextField(text: $searchText) {

                }
            }
            .padding(.init(top: 14, leading: 14 ,bottom: 14, trailing: 14))
            .background(.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .layoutPriority(1)
            // filter button
            Button(action: {}, label: {
                Image(systemName: "gear")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.black)
                    .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))

            })
        }.padding(.init(top: 0, leading: 14, bottom: 0, trailing: 14))
    }
    
    private var recommendationCarousel: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack  {
                CarouselItemComponent().frame(width: UIScreen.main.bounds.width - 30, height: 200)
                CarouselItemComponent().frame(width: UIScreen.main.bounds.width - 30, height: 200)
                CarouselItemComponent().frame(width: UIScreen.main.bounds.width - 30, height: 200)
                CarouselItemComponent().frame(width: UIScreen.main.bounds.width - 30, height: 200)
                CarouselItemComponent().frame(width: UIScreen.main.bounds.width - 30, height: 200)
            }
        }.padding(.init(top: 0, leading: 12, bottom: 0, trailing: 12)).scrollTargetBehavior(.paging)


    }

    private var popularItems: some View {
        Grid {
            GridRow {
                ItemComponent()
                ItemComponent()
            }
            GridRow {
                ItemComponent()
                ItemComponent()
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
