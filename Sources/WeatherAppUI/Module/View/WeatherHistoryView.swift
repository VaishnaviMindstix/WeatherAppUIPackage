import SwiftUI

@available(iOS 14.0, *)
public struct WeatherHistoryView: View {
    @ObservedObject var presenter: WeatherHistoryPresenter

    public var body: some View {
        NavigationView {
            ZStack{
                BackgroundView(topColor: presenter.items.first?.isNight ?? true ? Color("BlackColor") : Color("BlueColor"),
                               midColor: presenter.items.first?.isNight ?? true ? Color("GreyColor") : Color("LightBlueColor"),
                               bottommColor: presenter.items.first?.isNight ?? true ? Color("LightGreyColor") : Color("WhiteBlueColor"))
                List {
                    ForEach(presenter.items) { item in
                        NavigationLink {
                            ZStack
                            {
                                BackgroundView(topColor: item.isNight ? Color("BlackColor") : Color("BlueColor"),
                                               midColor: item.isNight ? Color("GreyColor") : Color("LightBlueColor"),
                                               bottommColor: item.isNight ? Color("LightGreyColor") : Color("WhiteBlueColor"))
                                HStack {
                                    if #available(iOS 15.0, *) {
                                        Image(systemName: item.symbolName)
                                            .symbolRenderingMode(.multicolor)
                                            .resizable()
                                        //                .foregroundStyle(isNight ? .pink : .yellow) //.hierarchical // .monochrome
                                        //                .foregroundStyle(isNight ? .white : .white, isNight ? .gray : .yellow, isNight ? .yellow : .blue)  //.pallete
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                    } else {
                                        Image(systemName: item.symbolName)
                                            .renderingMode(.original)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 40, height: 40)
                                    }
                                    Text("\(item.city) with Temperature \(item.currentTemp)")
                                        .foregroundColor(.white)
                                }
                            }
                            
                        } label: {
                            Text(item.city)
                                .foregroundColor(.black)
                        }
                        
                    }
                    .onDelete(perform: presenter.deleteItem)
                }
                .listRowBackground(Color.clear)
                .scrollBackgroundHiddenIfAvailable()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: presenter.addSampleItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading){
                        Text("Select an item")
                        
                    }
                    
                }
                .foregroundColor(.white)
                
            }
        }
        .foregroundColor(.white)
        .onAppear {
            presenter.loadItems()
        }
    }
}

@available(iOS 13.0, *)
extension View {
    @ViewBuilder
    func scrollBackgroundHiddenIfAvailable() -> some View {
        if #available(iOS 16.0, *) {
            self.scrollContentBackground(.hidden)
        } else {
            self
        }
    }
}
