//
//  RealmCity.swift
//  ServiceCityListProvider
//
//  Created by Andrey Tanakov on 23.03.2025.
//

import RealmSwift

class RealmCity: Object {
    @Persisted var name: String = ""
    @Persisted(originProperty: "cities") var country: LinkingObjects<RealmCountry>
}
