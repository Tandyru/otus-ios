# GeoAPI

All URIs are relative to *https://wft-geo-db.p.rapidapi.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**findAdminDivisionsUsingGET**](GeoAPI.md#findadmindivisionsusingget) | **GET** /geo/adminDivisions | Find admin divisions
[**findCitiesNearAdminDivisionUsingGET**](GeoAPI.md#findcitiesnearadmindivisionusingget) | **GET** /geo/adminDivisions/{divisionId}/nearbyCities | Find cities near division
[**findCitiesNearCityUsingGET**](GeoAPI.md#findcitiesnearcityusingget) | **GET** /geo/cities/{cityId}/nearbyCities | Find cities near city
[**findCitiesNearLocationUsingGET**](GeoAPI.md#findcitiesnearlocationusingget) | **GET** /geo/locations/{locationId}/nearbyCities | Find cities near location
[**findCitiesUsingGET**](GeoAPI.md#findcitiesusingget) | **GET** /geo/cities | Find cities
[**findCountryPlacesUsingGET**](GeoAPI.md#findcountryplacesusingget) | **GET** /geo/countries/{countryId}/places | Find country places
[**findDivisionsNearAdminDivisionUsingGET**](GeoAPI.md#finddivisionsnearadmindivisionusingget) | **GET** /geo/adminDivisions/{divisionId}/nearbyDivisions | Find admin divisions near division
[**findDivisionsNearCityUsingGET**](GeoAPI.md#finddivisionsnearcityusingget) | **GET** /geo/cities/{cityId}/nearbyDivisions | Find admin divisions near city
[**findDivisionsNearLocationUsingGET**](GeoAPI.md#finddivisionsnearlocationusingget) | **GET** /geo/locations/{locationId}/nearbyDivisions | Find admin divisions near location
[**findPlacesNearAdminDivisionUsingGET**](GeoAPI.md#findplacesnearadmindivisionusingget) | **GET** /geo/adminDivisions/{divisionId}/nearbyPlaces | Find places near division
[**findPlacesNearCityUsingGET**](GeoAPI.md#findplacesnearcityusingget) | **GET** /geo/cities/{cityId}/nearbyPlaces | Find places near city
[**findPlacesNearLocationUsingGET**](GeoAPI.md#findplacesnearlocationusingget) | **GET** /geo/locations/{locationId}/nearbyPlaces | Find places near location
[**findPlacesNearPlaceUsingGET**](GeoAPI.md#findplacesnearplaceusingget) | **GET** /geo/places/{placeId}/nearbyPlaces | Find places near place
[**findPlacesUsingGET**](GeoAPI.md#findplacesusingget) | **GET** /geo/places | Find places
[**findRegionCitiesUsingGET**](GeoAPI.md#findregioncitiesusingget) | **GET** /geo/countries/{countryId}/regions/{regionCode}/cities | Find country region cities
[**findRegionDivisionsUsingGET**](GeoAPI.md#findregiondivisionsusingget) | **GET** /geo/countries/{countryId}/regions/{regionCode}/adminDivisions | Find country region administrative divisions
[**findRegionPlacesUsingGET**](GeoAPI.md#findregionplacesusingget) | **GET** /geo/countries/{countryId}/regions/{regionCode}/places | Find country region places
[**getAdminDivisionUsingGET**](GeoAPI.md#getadmindivisionusingget) | **GET** /geo/adminDivisions/{divisionId} | Get admin division details
[**getCityDateTimeUsingGET**](GeoAPI.md#getcitydatetimeusingget) | **GET** /geo/cities/{cityId}/dateTime | Get city date-time
[**getCityDistanceUsingGET**](GeoAPI.md#getcitydistanceusingget) | **GET** /geo/cities/{cityId}/distance | Get city distance
[**getCityLocatedInUsingGET**](GeoAPI.md#getcitylocatedinusingget) | **GET** /geo/cities/{cityId}/locatedIn | Get city containing region
[**getCityTimeUsingGET**](GeoAPI.md#getcitytimeusingget) | **GET** /geo/cities/{cityId}/time | Get city time
[**getCityUsingGET**](GeoAPI.md#getcityusingget) | **GET** /geo/cities/{cityId} | Get city details
[**getCountriesUsingGET**](GeoAPI.md#getcountriesusingget) | **GET** /geo/countries | Find countries
[**getCountryUsingGET**](GeoAPI.md#getcountryusingget) | **GET** /geo/countries/{countryId} | Get country details
[**getPlaceDateTimeUsingGET**](GeoAPI.md#getplacedatetimeusingget) | **GET** /geo/places/{placeId}/dateTime | Get place date-time
[**getPlaceDistanceUsingGET**](GeoAPI.md#getplacedistanceusingget) | **GET** /geo/places/{placeId}/distance | Get place distance
[**getPlaceLocatedInUsingGET**](GeoAPI.md#getplacelocatedinusingget) | **GET** /geo/places/{placeId}/locatedIn | Get place containing region
[**getPlaceTimeUsingGET**](GeoAPI.md#getplacetimeusingget) | **GET** /geo/places/{placeId}/time | Get place time
[**getPlaceUsingGET**](GeoAPI.md#getplaceusingget) | **GET** /geo/places/{placeId} | Get place details
[**getRegionUsingGET**](GeoAPI.md#getregionusingget) | **GET** /geo/countries/{countryId}/regions/{regionCode} | Get region details
[**getRegionsUsingGET**](GeoAPI.md#getregionsusingget) | **GET** /geo/countries/{countryId}/regions | Find country regions


# **findAdminDivisionsUsingGET**
```swift
    open class func findAdminDivisionsUsingGET(location: String? = nil, radius: Int? = nil, distanceUnit: String? = nil, countryIds: String? = nil, excludedCountryIds: String? = nil, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find admin divisions

Find administrative divisions, filtering by optional criteria. If no criteria are set, you will get back all known divisions. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let location = "location_example" // String | Only places near this location. Latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD (optional)
let radius = 987 // Int | The location radius within which to find places (optional)
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")
let countryIds = "countryIds_example" // String | Only places in these countries (comma-delimited country codes or WikiData ids) (optional)
let excludedCountryIds = "excludedCountryIds_example" // String | Only places NOT in these countries (comma-delimited country codes or WikiData ids) (optional)
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find admin divisions
GeoAPI.findAdminDivisionsUsingGET(location: location, radius: radius, distanceUnit: distanceUnit, countryIds: countryIds, excludedCountryIds: excludedCountryIds, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **location** | **String** | Only places near this location. Latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD | [optional] 
 **radius** | **Int** | The location radius within which to find places | [optional] 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]
 **countryIds** | **String** | Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **excludedCountryIds** | **String** | Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findCitiesNearAdminDivisionUsingGET**
```swift
    open class func findCitiesNearAdminDivisionUsingGET(divisionId: String, radius: Int? = nil, distanceUnit: String? = nil, countryIds: String? = nil, excludedCountryIds: String? = nil, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, types: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find cities near division

Find cities near the given administrative division, filtering by optional criteria. If no criteria are set, you will get back all known cities. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let divisionId = "divisionId_example" // String | An admin-division id (either native 'id' or 'wikiDataId')
let radius = 987 // Int | The location radius within which to find places (optional)
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")
let countryIds = "countryIds_example" // String | Only places in these countries (comma-delimited country codes or WikiData ids) (optional)
let excludedCountryIds = "excludedCountryIds_example" // String | Only places NOT in these countries (comma-delimited country codes or WikiData ids) (optional)
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let types = "types_example" // String | Only cities for these types (comma-delimited): ADM2 | CITY (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find cities near division
GeoAPI.findCitiesNearAdminDivisionUsingGET(divisionId: divisionId, radius: radius, distanceUnit: distanceUnit, countryIds: countryIds, excludedCountryIds: excludedCountryIds, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, types: types, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **divisionId** | **String** | An admin-division id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **radius** | **Int** | The location radius within which to find places | [optional] 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]
 **countryIds** | **String** | Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **excludedCountryIds** | **String** | Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **types** | **String** | Only cities for these types (comma-delimited): ADM2 | CITY | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findCitiesNearCityUsingGET**
```swift
    open class func findCitiesNearCityUsingGET(cityId: String, radius: Int? = nil, distanceUnit: String? = nil, countryIds: String? = nil, excludedCountryIds: String? = nil, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, types: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find cities near city

Find cities near the given city, filtering by optional criteria. If no criteria are set, you will get back all cities within the default radius. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let cityId = "cityId_example" // String | A city id (either native 'id' or 'wikiDataId')
let radius = 987 // Int | The location radius within which to find places (optional)
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")
let countryIds = "countryIds_example" // String | Only places in these countries (comma-delimited country codes or WikiData ids) (optional)
let excludedCountryIds = "excludedCountryIds_example" // String | Only places NOT in these countries (comma-delimited country codes or WikiData ids) (optional)
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let types = "types_example" // String | Only cities for these types (comma-delimited): ADM2 | CITY (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find cities near city
GeoAPI.findCitiesNearCityUsingGET(cityId: cityId, radius: radius, distanceUnit: distanceUnit, countryIds: countryIds, excludedCountryIds: excludedCountryIds, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, types: types, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **String** | A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **radius** | **Int** | The location radius within which to find places | [optional] 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]
 **countryIds** | **String** | Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **excludedCountryIds** | **String** | Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **types** | **String** | Only cities for these types (comma-delimited): ADM2 | CITY | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findCitiesNearLocationUsingGET**
```swift
    open class func findCitiesNearLocationUsingGET(locationId: String, radius: Int? = nil, distanceUnit: String? = nil, countryIds: String? = nil, excludedCountryIds: String? = nil, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, types: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find cities near location

Find cities near the given location, filtering by optional criteria. If no criteria are set, you will get back all cities within the default radius. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let locationId = "locationId_example" // String | A latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD
let radius = 987 // Int | The location radius within which to find places (optional)
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")
let countryIds = "countryIds_example" // String | Only places in these countries (comma-delimited country codes or WikiData ids) (optional)
let excludedCountryIds = "excludedCountryIds_example" // String | Only places NOT in these countries (comma-delimited country codes or WikiData ids) (optional)
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let types = "types_example" // String | Only cities for these types (comma-delimited): ADM2 | CITY (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find cities near location
GeoAPI.findCitiesNearLocationUsingGET(locationId: locationId, radius: radius, distanceUnit: distanceUnit, countryIds: countryIds, excludedCountryIds: excludedCountryIds, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, types: types, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **locationId** | **String** | A latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD | 
 **radius** | **Int** | The location radius within which to find places | [optional] 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]
 **countryIds** | **String** | Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **excludedCountryIds** | **String** | Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **types** | **String** | Only cities for these types (comma-delimited): ADM2 | CITY | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findCitiesUsingGET**
```swift
    open class func findCitiesUsingGET(location: String? = nil, radius: Int? = nil, distanceUnit: String? = nil, countryIds: String? = nil, excludedCountryIds: String? = nil, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, types: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find cities

Find cities, filtering by optional criteria. If no criteria are set, you will get back all known cities. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let location = "location_example" // String | Only places near this location. Latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD (optional)
let radius = 987 // Int | The location radius within which to find places (optional)
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")
let countryIds = "countryIds_example" // String | Only places in these countries (comma-delimited country codes or WikiData ids) (optional)
let excludedCountryIds = "excludedCountryIds_example" // String | Only places NOT in these countries (comma-delimited country codes or WikiData ids) (optional)
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let types = "types_example" // String | Only cities for these types (comma-delimited): ADM2 | CITY (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find cities
GeoAPI.findCitiesUsingGET(location: location, radius: radius, distanceUnit: distanceUnit, countryIds: countryIds, excludedCountryIds: excludedCountryIds, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, types: types, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **location** | **String** | Only places near this location. Latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD | [optional] 
 **radius** | **Int** | The location radius within which to find places | [optional] 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]
 **countryIds** | **String** | Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **excludedCountryIds** | **String** | Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **types** | **String** | Only cities for these types (comma-delimited): ADM2 | CITY | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findCountryPlacesUsingGET**
```swift
    open class func findCountryPlacesUsingGET(countryId: String, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, types: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find country places

Get the country's places. The country is omitted in the response. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let countryId = "countryId_example" // String | An ISO-3166 country code or WikiData id
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let types = "types_example" // String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort place results.  'Format: ±SORT_FIELD,±SORT_FIELD'  where SORT_FIELD = elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find country places
GeoAPI.findCountryPlacesUsingGET(countryId: countryId, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, types: types, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **countryId** | **String** | An ISO-3166 country code or WikiData id | 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **types** | **String** | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort place results.  &#39;Format: ±SORT_FIELD,±SORT_FIELD&#39;  where SORT_FIELD &#x3D; elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findDivisionsNearAdminDivisionUsingGET**
```swift
    open class func findDivisionsNearAdminDivisionUsingGET(divisionId: String, radius: Int? = nil, distanceUnit: String? = nil, countryIds: String? = nil, excludedCountryIds: String? = nil, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find admin divisions near division

Find administrative divisions near the given division, filtering by optional criteria. If no criteria are set, you will get back all known divisions. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let divisionId = "divisionId_example" // String | An admin-division id (either native 'id' or 'wikiDataId')
let radius = 987 // Int | The location radius within which to find places (optional)
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")
let countryIds = "countryIds_example" // String | Only places in these countries (comma-delimited country codes or WikiData ids) (optional)
let excludedCountryIds = "excludedCountryIds_example" // String | Only places NOT in these countries (comma-delimited country codes or WikiData ids) (optional)
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find admin divisions near division
GeoAPI.findDivisionsNearAdminDivisionUsingGET(divisionId: divisionId, radius: radius, distanceUnit: distanceUnit, countryIds: countryIds, excludedCountryIds: excludedCountryIds, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **divisionId** | **String** | An admin-division id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **radius** | **Int** | The location radius within which to find places | [optional] 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]
 **countryIds** | **String** | Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **excludedCountryIds** | **String** | Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findDivisionsNearCityUsingGET**
```swift
    open class func findDivisionsNearCityUsingGET(cityId: String, radius: Int? = nil, distanceUnit: String? = nil, countryIds: String? = nil, excludedCountryIds: String? = nil, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find admin divisions near city

Find administrative divisions near the given city, filtering by optional criteria. If no criteria are set, you will get back all divisions within the default radius. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let cityId = "cityId_example" // String | A city id (either native 'id' or 'wikiDataId')
let radius = 987 // Int | The location radius within which to find places (optional)
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")
let countryIds = "countryIds_example" // String | Only places in these countries (comma-delimited country codes or WikiData ids) (optional)
let excludedCountryIds = "excludedCountryIds_example" // String | Only places NOT in these countries (comma-delimited country codes or WikiData ids) (optional)
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find admin divisions near city
GeoAPI.findDivisionsNearCityUsingGET(cityId: cityId, radius: radius, distanceUnit: distanceUnit, countryIds: countryIds, excludedCountryIds: excludedCountryIds, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **String** | A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **radius** | **Int** | The location radius within which to find places | [optional] 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]
 **countryIds** | **String** | Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **excludedCountryIds** | **String** | Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findDivisionsNearLocationUsingGET**
```swift
    open class func findDivisionsNearLocationUsingGET(locationId: String, radius: Int? = nil, distanceUnit: String? = nil, countryIds: String? = nil, excludedCountryIds: String? = nil, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find admin divisions near location

Find administrative divisions near the given location, filtering by optional criteria. If no criteria are set, you will get back all divisions within the default radius. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let locationId = "locationId_example" // String | A latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD
let radius = 987 // Int | The location radius within which to find places (optional)
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")
let countryIds = "countryIds_example" // String | Only places in these countries (comma-delimited country codes or WikiData ids) (optional)
let excludedCountryIds = "excludedCountryIds_example" // String | Only places NOT in these countries (comma-delimited country codes or WikiData ids) (optional)
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find admin divisions near location
GeoAPI.findDivisionsNearLocationUsingGET(locationId: locationId, radius: radius, distanceUnit: distanceUnit, countryIds: countryIds, excludedCountryIds: excludedCountryIds, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **locationId** | **String** | A latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD | 
 **radius** | **Int** | The location radius within which to find places | [optional] 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]
 **countryIds** | **String** | Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **excludedCountryIds** | **String** | Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findPlacesNearAdminDivisionUsingGET**
```swift
    open class func findPlacesNearAdminDivisionUsingGET(divisionId: String, radius: Int? = nil, distanceUnit: String? = nil, countryIds: String? = nil, excludedCountryIds: String? = nil, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, types: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find places near division

Find places near the given administrative division, filtering by optional criteria. If no criteria are set, you will get back all known places. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let divisionId = "divisionId_example" // String | An admin-division id (either native 'id' or 'wikiDataId')
let radius = 987 // Int | The location radius within which to find places (optional)
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")
let countryIds = "countryIds_example" // String | Only places in these countries (comma-delimited country codes or WikiData ids) (optional)
let excludedCountryIds = "excludedCountryIds_example" // String | Only places NOT in these countries (comma-delimited country codes or WikiData ids) (optional)
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let types = "types_example" // String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find places near division
GeoAPI.findPlacesNearAdminDivisionUsingGET(divisionId: divisionId, radius: radius, distanceUnit: distanceUnit, countryIds: countryIds, excludedCountryIds: excludedCountryIds, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, types: types, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **divisionId** | **String** | An admin-division id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **radius** | **Int** | The location radius within which to find places | [optional] 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]
 **countryIds** | **String** | Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **excludedCountryIds** | **String** | Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **types** | **String** | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findPlacesNearCityUsingGET**
```swift
    open class func findPlacesNearCityUsingGET(cityId: String, radius: Int? = nil, distanceUnit: String? = nil, countryIds: String? = nil, excludedCountryIds: String? = nil, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, types: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find places near city

Find places near the given city, filtering by optional criteria. If no criteria are set, you will get back all places within the default radius. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let cityId = "cityId_example" // String | A city id (either native 'id' or 'wikiDataId')
let radius = 987 // Int | The location radius within which to find places (optional)
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")
let countryIds = "countryIds_example" // String | Only places in these countries (comma-delimited country codes or WikiData ids) (optional)
let excludedCountryIds = "excludedCountryIds_example" // String | Only places NOT in these countries (comma-delimited country codes or WikiData ids) (optional)
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let types = "types_example" // String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find places near city
GeoAPI.findPlacesNearCityUsingGET(cityId: cityId, radius: radius, distanceUnit: distanceUnit, countryIds: countryIds, excludedCountryIds: excludedCountryIds, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, types: types, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **String** | A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **radius** | **Int** | The location radius within which to find places | [optional] 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]
 **countryIds** | **String** | Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **excludedCountryIds** | **String** | Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **types** | **String** | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findPlacesNearLocationUsingGET**
```swift
    open class func findPlacesNearLocationUsingGET(locationId: String, radius: Int? = nil, distanceUnit: String? = nil, countryIds: String? = nil, excludedCountryIds: String? = nil, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, types: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find places near location

Find places near the given location, filtering by optional criteria. If no criteria are set, you will get back all places within the default radius. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let locationId = "locationId_example" // String | A latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD
let radius = 987 // Int | The location radius within which to find places (optional)
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")
let countryIds = "countryIds_example" // String | Only places in these countries (comma-delimited country codes or WikiData ids) (optional)
let excludedCountryIds = "excludedCountryIds_example" // String | Only places NOT in these countries (comma-delimited country codes or WikiData ids) (optional)
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let types = "types_example" // String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find places near location
GeoAPI.findPlacesNearLocationUsingGET(locationId: locationId, radius: radius, distanceUnit: distanceUnit, countryIds: countryIds, excludedCountryIds: excludedCountryIds, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, types: types, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **locationId** | **String** | A latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD | 
 **radius** | **Int** | The location radius within which to find places | [optional] 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]
 **countryIds** | **String** | Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **excludedCountryIds** | **String** | Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **types** | **String** | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findPlacesNearPlaceUsingGET**
```swift
    open class func findPlacesNearPlaceUsingGET(placeId: String, radius: Int? = nil, distanceUnit: String? = nil, countryIds: String? = nil, excludedCountryIds: String? = nil, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, types: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find places near place

Find places near the given place, filtering by optional criteria. If no criteria are set, you will get back all places within the default radius. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let placeId = "placeId_example" // String | A place id (either native 'id' or 'wikiDataId')
let radius = 987 // Int | The location radius within which to find places (optional)
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")
let countryIds = "countryIds_example" // String | Only places in these countries (comma-delimited country codes or WikiData ids) (optional)
let excludedCountryIds = "excludedCountryIds_example" // String | Only places NOT in these countries (comma-delimited country codes or WikiData ids) (optional)
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let types = "types_example" // String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find places near place
GeoAPI.findPlacesNearPlaceUsingGET(placeId: placeId, radius: radius, distanceUnit: distanceUnit, countryIds: countryIds, excludedCountryIds: excludedCountryIds, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, types: types, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **String** | A place id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **radius** | **Int** | The location radius within which to find places | [optional] 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]
 **countryIds** | **String** | Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **excludedCountryIds** | **String** | Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **types** | **String** | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findPlacesUsingGET**
```swift
    open class func findPlacesUsingGET(location: String? = nil, radius: Int? = nil, distanceUnit: String? = nil, countryIds: String? = nil, excludedCountryIds: String? = nil, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, types: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find places

Find places, filtering by optional criteria. If no criteria are set, you will get back all known places. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let location = "location_example" // String | Only places near this location. Latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD (optional)
let radius = 987 // Int | The location radius within which to find places (optional)
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")
let countryIds = "countryIds_example" // String | Only places in these countries (comma-delimited country codes or WikiData ids) (optional)
let excludedCountryIds = "excludedCountryIds_example" // String | Only places NOT in these countries (comma-delimited country codes or WikiData ids) (optional)
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let types = "types_example" // String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find places
GeoAPI.findPlacesUsingGET(location: location, radius: radius, distanceUnit: distanceUnit, countryIds: countryIds, excludedCountryIds: excludedCountryIds, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, types: types, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **location** | **String** | Only places near this location. Latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD | [optional] 
 **radius** | **Int** | The location radius within which to find places | [optional] 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]
 **countryIds** | **String** | Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **excludedCountryIds** | **String** | Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **types** | **String** | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findRegionCitiesUsingGET**
```swift
    open class func findRegionCitiesUsingGET(countryId: String, regionCode: String, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, types: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find country region cities

Get country region cities. The country and region info is omitted in the response. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let countryId = "countryId_example" // String | An ISO-3166 country code or WikiData id
let regionCode = "regionCode_example" // String | An ISO-3166 or FIPS region code
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let types = "types_example" // String | Only cities for these types (comma-delimited): ADM2 | CITY (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort place results.  'Format: ±SORT_FIELD,±SORT_FIELD'  where SORT_FIELD = elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find country region cities
GeoAPI.findRegionCitiesUsingGET(countryId: countryId, regionCode: regionCode, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, types: types, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **countryId** | **String** | An ISO-3166 country code or WikiData id | 
 **regionCode** | **String** | An ISO-3166 or FIPS region code | 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **types** | **String** | Only cities for these types (comma-delimited): ADM2 | CITY | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort place results.  &#39;Format: ±SORT_FIELD,±SORT_FIELD&#39;  where SORT_FIELD &#x3D; elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findRegionDivisionsUsingGET**
```swift
    open class func findRegionDivisionsUsingGET(countryId: String, regionCode: String, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find country region administrative divisions

Get country region administrative divisions. The country and region info is omitted in the response. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let countryId = "countryId_example" // String | An ISO-3166 country code or WikiData id
let regionCode = "regionCode_example" // String | An ISO-3166 or FIPS region code
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort place results.  'Format: ±SORT_FIELD,±SORT_FIELD'  where SORT_FIELD = elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find country region administrative divisions
GeoAPI.findRegionDivisionsUsingGET(countryId: countryId, regionCode: regionCode, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **countryId** | **String** | An ISO-3166 country code or WikiData id | 
 **regionCode** | **String** | An ISO-3166 or FIPS region code | 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort place results.  &#39;Format: ±SORT_FIELD,±SORT_FIELD&#39;  where SORT_FIELD &#x3D; elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findRegionPlacesUsingGET**
```swift
    open class func findRegionPlacesUsingGET(countryId: String, regionCode: String, minPopulation: Int? = nil, maxPopulation: Int? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, timeZoneIds: String? = nil, types: String? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, includeDeleted: String? = nil, completion: @escaping (_ data: PopulatedPlacesResponse?, _ error: Error?) -> Void)
```

Find country region places

Get country region places. The country and region info is omitted in the response. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let countryId = "countryId_example" // String | An ISO-3166 country code or WikiData id
let regionCode = "regionCode_example" // String | An ISO-3166 or FIPS region code
let minPopulation = 987 // Int | Only places having at least this population (optional)
let maxPopulation = 987 // Int | Only places having no more than this population (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let timeZoneIds = "timeZoneIds_example" // String | Only places in these time-zones (comma-delimited) (optional)
let types = "types_example" // String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND (optional)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort place results.  'Format: ±SORT_FIELD,±SORT_FIELD'  where SORT_FIELD = elevation | name | population  (optional)
let includeDeleted = "includeDeleted_example" // String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE (optional) (default to "NONE")

// Find country region places
GeoAPI.findRegionPlacesUsingGET(countryId: countryId, regionCode: regionCode, minPopulation: minPopulation, maxPopulation: maxPopulation, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, timeZoneIds: timeZoneIds, types: types, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort, includeDeleted: includeDeleted) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **countryId** | **String** | An ISO-3166 country code or WikiData id | 
 **regionCode** | **String** | An ISO-3166 or FIPS region code | 
 **minPopulation** | **Int** | Only places having at least this population | [optional] 
 **maxPopulation** | **Int** | Only places having no more than this population | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **timeZoneIds** | **String** | Only places in these time-zones (comma-delimited) | [optional] 
 **types** | **String** | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort place results.  &#39;Format: ±SORT_FIELD,±SORT_FIELD&#39;  where SORT_FIELD &#x3D; elevation | name | population  | [optional] 
 **includeDeleted** | **String** | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;]

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAdminDivisionUsingGET**
```swift
    open class func getAdminDivisionUsingGET(divisionId: String, asciiMode: Bool? = nil, languageCode: String? = nil, completion: @escaping (_ data: PopulatedPlaceResponse?, _ error: Error?) -> Void)
```

Get admin division details

Get administrative division details such as location coordinates, population, and elevation above sea-level (if available). 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let divisionId = "divisionId_example" // String | An admin-division id (either native 'id' or 'wikiDataId')
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let languageCode = "languageCode_example" // String | Display results in this language (optional)

// Get admin division details
GeoAPI.getAdminDivisionUsingGET(divisionId: divisionId, asciiMode: asciiMode, languageCode: languageCode) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **divisionId** | **String** | An admin-division id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **languageCode** | **String** | Display results in this language | [optional] 

### Return type

[**PopulatedPlaceResponse**](PopulatedPlaceResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCityDateTimeUsingGET**
```swift
    open class func getCityDateTimeUsingGET(cityId: String, completion: @escaping (_ data: DateTimeResponse?, _ error: Error?) -> Void)
```

Get city date-time

Get city date-time

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let cityId = "cityId_example" // String | A city id (either native 'id' or 'wikiDataId')

// Get city date-time
GeoAPI.getCityDateTimeUsingGET(cityId: cityId) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **String** | A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 

### Return type

[**DateTimeResponse**](DateTimeResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCityDistanceUsingGET**
```swift
    open class func getCityDistanceUsingGET(cityId: String, toCityId: String, distanceUnit: String? = nil, completion: @escaping (_ data: DistanceResponse?, _ error: Error?) -> Void)
```

Get city distance

Get distance from the given city

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let cityId = "cityId_example" // String | A city id (either native 'id' or 'wikiDataId')
let toCityId = "toCityId_example" // String | Distance to this city
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")

// Get city distance
GeoAPI.getCityDistanceUsingGET(cityId: cityId, toCityId: toCityId, distanceUnit: distanceUnit) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **String** | A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **toCityId** | **String** | Distance to this city | 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]

### Return type

[**DistanceResponse**](DistanceResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCityLocatedInUsingGET**
```swift
    open class func getCityLocatedInUsingGET(cityId: String, asciiMode: Bool? = nil, languageCode: String? = nil, completion: @escaping (_ data: PopulatedPlaceResponse?, _ error: Error?) -> Void)
```

Get city containing region

Get the details for the containing populated place (e.g., its county or other administrative division), including location coordinates, population, and elevation above sea-level (if available). 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let cityId = "cityId_example" // String | A city id (either native 'id' or 'wikiDataId')
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let languageCode = "languageCode_example" // String | Display results in this language (optional)

// Get city containing region
GeoAPI.getCityLocatedInUsingGET(cityId: cityId, asciiMode: asciiMode, languageCode: languageCode) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **String** | A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **languageCode** | **String** | Display results in this language | [optional] 

### Return type

[**PopulatedPlaceResponse**](PopulatedPlaceResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCityTimeUsingGET**
```swift
    open class func getCityTimeUsingGET(cityId: String, completion: @escaping (_ data: TimeResponse?, _ error: Error?) -> Void)
```

Get city time

Get city time

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let cityId = "cityId_example" // String | A city id (either native 'id' or 'wikiDataId')

// Get city time
GeoAPI.getCityTimeUsingGET(cityId: cityId) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **String** | A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 

### Return type

[**TimeResponse**](TimeResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCityUsingGET**
```swift
    open class func getCityUsingGET(cityId: String, asciiMode: Bool? = nil, languageCode: String? = nil, completion: @escaping (_ data: PopulatedPlaceResponse?, _ error: Error?) -> Void)
```

Get city details

Get city details such as location coordinates, population, and elevation above sea-level (if available). 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let cityId = "cityId_example" // String | A city id (either native 'id' or 'wikiDataId')
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let languageCode = "languageCode_example" // String | Display results in this language (optional)

// Get city details
GeoAPI.getCityUsingGET(cityId: cityId, asciiMode: asciiMode, languageCode: languageCode) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **String** | A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **languageCode** | **String** | Display results in this language | [optional] 

### Return type

[**PopulatedPlaceResponse**](PopulatedPlaceResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCountriesUsingGET**
```swift
    open class func getCountriesUsingGET(currencyCode: String? = nil, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, completion: @escaping (_ data: CountriesResponse?, _ error: Error?) -> Void)
```

Find countries

Find countries, filtering by optional criteria. If no criteria are set, you will get back all known countries. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let currencyCode = "currencyCode_example" // String | Only countries supporting this currency (optional)
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort countries.  Format: ±SORT_FIELD  where SORT_FIELD = code | name (optional)

// Find countries
GeoAPI.getCountriesUsingGET(currencyCode: currencyCode, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currencyCode** | **String** | Only countries supporting this currency | [optional] 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort countries.  Format: ±SORT_FIELD  where SORT_FIELD &#x3D; code | name | [optional] 

### Return type

[**CountriesResponse**](CountriesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCountryUsingGET**
```swift
    open class func getCountryUsingGET(countryId: String, asciiMode: Bool? = nil, languageCode: String? = nil, completion: @escaping (_ data: CountryResponse?, _ error: Error?) -> Void)
```

Get country details

Get country details such as number of regions.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let countryId = "countryId_example" // String | An ISO-3166 country code or WikiData id
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let languageCode = "languageCode_example" // String | Display results in this language (optional)

// Get country details
GeoAPI.getCountryUsingGET(countryId: countryId, asciiMode: asciiMode, languageCode: languageCode) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **countryId** | **String** | An ISO-3166 country code or WikiData id | 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **languageCode** | **String** | Display results in this language | [optional] 

### Return type

[**CountryResponse**](CountryResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlaceDateTimeUsingGET**
```swift
    open class func getPlaceDateTimeUsingGET(placeId: String, completion: @escaping (_ data: DateTimeResponse?, _ error: Error?) -> Void)
```

Get place date-time

Get place date-time

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let placeId = "placeId_example" // String | A place id (either native 'id' or 'wikiDataId')

// Get place date-time
GeoAPI.getPlaceDateTimeUsingGET(placeId: placeId) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **String** | A place id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 

### Return type

[**DateTimeResponse**](DateTimeResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlaceDistanceUsingGET**
```swift
    open class func getPlaceDistanceUsingGET(placeId: String, toPlaceId: String, distanceUnit: String? = nil, completion: @escaping (_ data: DistanceResponse?, _ error: Error?) -> Void)
```

Get place distance

Get distance from the given place

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let placeId = "placeId_example" // String | A place id (either native 'id' or 'wikiDataId')
let toPlaceId = "toPlaceId_example" // String | Distance to this place
let distanceUnit = "distanceUnit_example" // String | The unit of distance: MI | KM (optional) (default to "MI")

// Get place distance
GeoAPI.getPlaceDistanceUsingGET(placeId: placeId, toPlaceId: toPlaceId, distanceUnit: distanceUnit) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **String** | A place id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **toPlaceId** | **String** | Distance to this place | 
 **distanceUnit** | **String** | The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;]

### Return type

[**DistanceResponse**](DistanceResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlaceLocatedInUsingGET**
```swift
    open class func getPlaceLocatedInUsingGET(placeId: String, asciiMode: Bool? = nil, languageCode: String? = nil, completion: @escaping (_ data: PopulatedPlaceResponse?, _ error: Error?) -> Void)
```

Get place containing region

Get the details for the containing populated place (e.g., its county or other administrative division), including location coordinates, population, and elevation above sea-level (if available). 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let placeId = "placeId_example" // String | A place id (either native 'id' or 'wikiDataId')
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let languageCode = "languageCode_example" // String | Display results in this language (optional)

// Get place containing region
GeoAPI.getPlaceLocatedInUsingGET(placeId: placeId, asciiMode: asciiMode, languageCode: languageCode) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **String** | A place id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **languageCode** | **String** | Display results in this language | [optional] 

### Return type

[**PopulatedPlaceResponse**](PopulatedPlaceResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlaceTimeUsingGET**
```swift
    open class func getPlaceTimeUsingGET(placeId: String, completion: @escaping (_ data: TimeResponse?, _ error: Error?) -> Void)
```

Get place time

Get place time

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let placeId = "placeId_example" // String | A place id (either native 'id' or 'wikiDataId')

// Get place time
GeoAPI.getPlaceTimeUsingGET(placeId: placeId) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **String** | A place id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 

### Return type

[**TimeResponse**](TimeResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPlaceUsingGET**
```swift
    open class func getPlaceUsingGET(placeId: String, asciiMode: Bool? = nil, languageCode: String? = nil, completion: @escaping (_ data: PopulatedPlaceResponse?, _ error: Error?) -> Void)
```

Get place details

Get place details such as location coordinates, population, and elevation above sea-level (if available). 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let placeId = "placeId_example" // String | A place id (either native 'id' or 'wikiDataId')
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let languageCode = "languageCode_example" // String | Display results in this language (optional)

// Get place details
GeoAPI.getPlaceUsingGET(placeId: placeId, asciiMode: asciiMode, languageCode: languageCode) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **String** | A place id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **languageCode** | **String** | Display results in this language | [optional] 

### Return type

[**PopulatedPlaceResponse**](PopulatedPlaceResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRegionUsingGET**
```swift
    open class func getRegionUsingGET(countryId: String, regionCode: String, asciiMode: Bool? = nil, languageCode: String? = nil, completion: @escaping (_ data: RegionResponse?, _ error: Error?) -> Void)
```

Get region details

Get country region details such as number of cities.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let countryId = "countryId_example" // String | An ISO-3166 country code or WikiData id
let regionCode = "regionCode_example" // String | An ISO-3166 or FIPS region code
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let languageCode = "languageCode_example" // String | Display results in this language (optional)

// Get region details
GeoAPI.getRegionUsingGET(countryId: countryId, regionCode: regionCode, asciiMode: asciiMode, languageCode: languageCode) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **countryId** | **String** | An ISO-3166 country code or WikiData id | 
 **regionCode** | **String** | An ISO-3166 or FIPS region code | 
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **languageCode** | **String** | Display results in this language | [optional] 

### Return type

[**RegionResponse**](RegionResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRegionsUsingGET**
```swift
    open class func getRegionsUsingGET(countryId: String, namePrefix: String? = nil, namePrefixDefaultLangResults: Bool? = nil, asciiMode: Bool? = nil, hateoasMode: Bool? = nil, languageCode: String? = nil, limit: Int? = nil, offset: Int? = nil, sort: String? = nil, completion: @escaping (_ data: RegionsResponse?, _ error: Error?) -> Void)
```

Find country regions

Get the country's regions. These could be states, provinces, districts, or otherwise major political divisions. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let countryId = "countryId_example" // String | An ISO-3166 country code or WikiData id
let namePrefix = "namePrefix_example" // String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  (optional)
let namePrefixDefaultLangResults = true // Bool | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  (optional) (default to true)
let asciiMode = true // Bool | Display results using ASCII characters (optional) (default to false)
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let languageCode = "languageCode_example" // String | Display results in this language (optional)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)
let sort = "sort_example" // String | How to sort regions.  Format: ±SORT_FIELD  where SORT_FIELD = fipsCode | isoCode | name (optional)

// Find country regions
GeoAPI.getRegionsUsingGET(countryId: countryId, namePrefix: namePrefix, namePrefixDefaultLangResults: namePrefixDefaultLangResults, asciiMode: asciiMode, hateoasMode: hateoasMode, languageCode: languageCode, limit: limit, offset: offset, sort: sort) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **countryId** | **String** | An ISO-3166 country code or WikiData id | 
 **namePrefix** | **String** | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] 
 **namePrefixDefaultLangResults** | **Bool** | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true]
 **asciiMode** | **Bool** | Display results using ASCII characters | [optional] [default to false]
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **languageCode** | **String** | Display results in this language | [optional] 
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]
 **sort** | **String** | How to sort regions.  Format: ±SORT_FIELD  where SORT_FIELD &#x3D; fipsCode | isoCode | name | [optional] 

### Return type

[**RegionsResponse**](RegionsResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

