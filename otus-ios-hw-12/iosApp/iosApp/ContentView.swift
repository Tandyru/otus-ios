import SwiftUI
import shared

struct ContentView: View {
    let cities = Array(Set(Cities().cities().toSwiftArray()))

	var body: some View {
        List(cities, id: \.self) { city in
            Text(city)
        }
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
