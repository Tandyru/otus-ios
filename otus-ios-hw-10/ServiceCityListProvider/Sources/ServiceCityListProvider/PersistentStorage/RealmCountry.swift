//
//  RealmCountry.swift
//  ServiceCityListProvider
//
//  Created by Andrey Tanakov on 23.03.2025.
//

import RealmSwift

class RealmCountry: Object {
    @Persisted(primaryKey: true) var countryId: String = ""
    @Persisted var cities: List<RealmCity>
}
