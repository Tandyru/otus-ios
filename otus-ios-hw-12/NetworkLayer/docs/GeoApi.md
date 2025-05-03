# GeoApi

All URIs are relative to *https://wft-geo-db.p.rapidapi.com/v1*

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**findAdminDivisionsUsingGET**](GeoApi.md#findAdminDivisionsUsingGET) | **GET** /geo/adminDivisions | Find admin divisions |
| [**findCitiesNearAdminDivisionUsingGET**](GeoApi.md#findCitiesNearAdminDivisionUsingGET) | **GET** /geo/adminDivisions/{divisionId}/nearbyCities | Find cities near division |
| [**findCitiesNearCityUsingGET**](GeoApi.md#findCitiesNearCityUsingGET) | **GET** /geo/cities/{cityId}/nearbyCities | Find cities near city |
| [**findCitiesNearLocationUsingGET**](GeoApi.md#findCitiesNearLocationUsingGET) | **GET** /geo/locations/{locationId}/nearbyCities | Find cities near location |
| [**findCitiesUsingGET**](GeoApi.md#findCitiesUsingGET) | **GET** /geo/cities | Find cities |
| [**findCountryPlacesUsingGET**](GeoApi.md#findCountryPlacesUsingGET) | **GET** /geo/countries/{countryId}/places | Find country places |
| [**findDivisionsNearAdminDivisionUsingGET**](GeoApi.md#findDivisionsNearAdminDivisionUsingGET) | **GET** /geo/adminDivisions/{divisionId}/nearbyDivisions | Find admin divisions near division |
| [**findDivisionsNearCityUsingGET**](GeoApi.md#findDivisionsNearCityUsingGET) | **GET** /geo/cities/{cityId}/nearbyDivisions | Find admin divisions near city |
| [**findDivisionsNearLocationUsingGET**](GeoApi.md#findDivisionsNearLocationUsingGET) | **GET** /geo/locations/{locationId}/nearbyDivisions | Find admin divisions near location |
| [**findPlacesNearAdminDivisionUsingGET**](GeoApi.md#findPlacesNearAdminDivisionUsingGET) | **GET** /geo/adminDivisions/{divisionId}/nearbyPlaces | Find places near division |
| [**findPlacesNearCityUsingGET**](GeoApi.md#findPlacesNearCityUsingGET) | **GET** /geo/cities/{cityId}/nearbyPlaces | Find places near city |
| [**findPlacesNearLocationUsingGET**](GeoApi.md#findPlacesNearLocationUsingGET) | **GET** /geo/locations/{locationId}/nearbyPlaces | Find places near location |
| [**findPlacesNearPlaceUsingGET**](GeoApi.md#findPlacesNearPlaceUsingGET) | **GET** /geo/places/{placeId}/nearbyPlaces | Find places near place |
| [**findPlacesUsingGET**](GeoApi.md#findPlacesUsingGET) | **GET** /geo/places | Find places |
| [**findRegionCitiesUsingGET**](GeoApi.md#findRegionCitiesUsingGET) | **GET** /geo/countries/{countryId}/regions/{regionCode}/cities | Find country region cities |
| [**findRegionDivisionsUsingGET**](GeoApi.md#findRegionDivisionsUsingGET) | **GET** /geo/countries/{countryId}/regions/{regionCode}/adminDivisions | Find country region administrative divisions |
| [**findRegionPlacesUsingGET**](GeoApi.md#findRegionPlacesUsingGET) | **GET** /geo/countries/{countryId}/regions/{regionCode}/places | Find country region places |
| [**getAdminDivisionUsingGET**](GeoApi.md#getAdminDivisionUsingGET) | **GET** /geo/adminDivisions/{divisionId} | Get admin division details |
| [**getCityDateTimeUsingGET**](GeoApi.md#getCityDateTimeUsingGET) | **GET** /geo/cities/{cityId}/dateTime | Get city date-time |
| [**getCityDistanceUsingGET**](GeoApi.md#getCityDistanceUsingGET) | **GET** /geo/cities/{cityId}/distance | Get city distance |
| [**getCityLocatedInUsingGET**](GeoApi.md#getCityLocatedInUsingGET) | **GET** /geo/cities/{cityId}/locatedIn | Get city containing region |
| [**getCityTimeUsingGET**](GeoApi.md#getCityTimeUsingGET) | **GET** /geo/cities/{cityId}/time | Get city time |
| [**getCityUsingGET**](GeoApi.md#getCityUsingGET) | **GET** /geo/cities/{cityId} | Get city details |
| [**getCountriesUsingGET**](GeoApi.md#getCountriesUsingGET) | **GET** /geo/countries | Find countries |
| [**getCountryUsingGET**](GeoApi.md#getCountryUsingGET) | **GET** /geo/countries/{countryId} | Get country details |
| [**getPlaceDateTimeUsingGET**](GeoApi.md#getPlaceDateTimeUsingGET) | **GET** /geo/places/{placeId}/dateTime | Get place date-time |
| [**getPlaceDistanceUsingGET**](GeoApi.md#getPlaceDistanceUsingGET) | **GET** /geo/places/{placeId}/distance | Get place distance |
| [**getPlaceLocatedInUsingGET**](GeoApi.md#getPlaceLocatedInUsingGET) | **GET** /geo/places/{placeId}/locatedIn | Get place containing region |
| [**getPlaceTimeUsingGET**](GeoApi.md#getPlaceTimeUsingGET) | **GET** /geo/places/{placeId}/time | Get place time |
| [**getPlaceUsingGET**](GeoApi.md#getPlaceUsingGET) | **GET** /geo/places/{placeId} | Get place details |
| [**getRegionUsingGET**](GeoApi.md#getRegionUsingGET) | **GET** /geo/countries/{countryId}/regions/{regionCode} | Get region details |
| [**getRegionsUsingGET**](GeoApi.md#getRegionsUsingGET) | **GET** /geo/countries/{countryId}/regions | Find country regions |


<a id="findAdminDivisionsUsingGET"></a>
# **findAdminDivisionsUsingGET**
> PopulatedPlacesResponse findAdminDivisionsUsingGET(location, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find admin divisions

Find administrative divisions, filtering by optional criteria. If no criteria are set, you will get back all known divisions. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val location : kotlin.String = location_example // kotlin.String | Only places near this location. Latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD
val radius : kotlin.Int = 56 // kotlin.Int | The location radius within which to find places
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
val countryIds : kotlin.String = countryIds_example // kotlin.String | Only places in these countries (comma-delimited country codes or WikiData ids)
val excludedCountryIds : kotlin.String = excludedCountryIds_example // kotlin.String | Only places NOT in these countries (comma-delimited country codes or WikiData ids)
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findAdminDivisionsUsingGET(location, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findAdminDivisionsUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findAdminDivisionsUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **location** | **kotlin.String**| Only places near this location. Latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD | [optional] |
| **radius** | **kotlin.Int**| The location radius within which to find places | [optional] |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |
| **countryIds** | **kotlin.String**| Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **excludedCountryIds** | **kotlin.String**| Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findCitiesNearAdminDivisionUsingGET"></a>
# **findCitiesNearAdminDivisionUsingGET**
> PopulatedPlacesResponse findCitiesNearAdminDivisionUsingGET(divisionId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find cities near division

Find cities near the given administrative division, filtering by optional criteria. If no criteria are set, you will get back all known cities. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val divisionId : kotlin.String = divisionId_example // kotlin.String | An admin-division id (either native 'id' or 'wikiDataId')
val radius : kotlin.Int = 56 // kotlin.Int | The location radius within which to find places
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
val countryIds : kotlin.String = countryIds_example // kotlin.String | Only places in these countries (comma-delimited country codes or WikiData ids)
val excludedCountryIds : kotlin.String = excludedCountryIds_example // kotlin.String | Only places NOT in these countries (comma-delimited country codes or WikiData ids)
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val types : kotlin.String = types_example // kotlin.String | Only cities for these types (comma-delimited): ADM2 | CITY
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findCitiesNearAdminDivisionUsingGET(divisionId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findCitiesNearAdminDivisionUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findCitiesNearAdminDivisionUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **divisionId** | **kotlin.String**| An admin-division id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **radius** | **kotlin.Int**| The location radius within which to find places | [optional] |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |
| **countryIds** | **kotlin.String**| Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **excludedCountryIds** | **kotlin.String**| Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **types** | **kotlin.String**| Only cities for these types (comma-delimited): ADM2 | CITY | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findCitiesNearCityUsingGET"></a>
# **findCitiesNearCityUsingGET**
> PopulatedPlacesResponse findCitiesNearCityUsingGET(cityId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find cities near city

Find cities near the given city, filtering by optional criteria. If no criteria are set, you will get back all cities within the default radius. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val cityId : kotlin.String = cityId_example // kotlin.String | A city id (either native 'id' or 'wikiDataId')
val radius : kotlin.Int = 56 // kotlin.Int | The location radius within which to find places
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
val countryIds : kotlin.String = countryIds_example // kotlin.String | Only places in these countries (comma-delimited country codes or WikiData ids)
val excludedCountryIds : kotlin.String = excludedCountryIds_example // kotlin.String | Only places NOT in these countries (comma-delimited country codes or WikiData ids)
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val types : kotlin.String = types_example // kotlin.String | Only cities for these types (comma-delimited): ADM2 | CITY
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findCitiesNearCityUsingGET(cityId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findCitiesNearCityUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findCitiesNearCityUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **cityId** | **kotlin.String**| A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **radius** | **kotlin.Int**| The location radius within which to find places | [optional] |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |
| **countryIds** | **kotlin.String**| Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **excludedCountryIds** | **kotlin.String**| Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **types** | **kotlin.String**| Only cities for these types (comma-delimited): ADM2 | CITY | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findCitiesNearLocationUsingGET"></a>
# **findCitiesNearLocationUsingGET**
> PopulatedPlacesResponse findCitiesNearLocationUsingGET(locationId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find cities near location

Find cities near the given location, filtering by optional criteria. If no criteria are set, you will get back all cities within the default radius. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val locationId : kotlin.String = locationId_example // kotlin.String | A latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD
val radius : kotlin.Int = 56 // kotlin.Int | The location radius within which to find places
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
val countryIds : kotlin.String = countryIds_example // kotlin.String | Only places in these countries (comma-delimited country codes or WikiData ids)
val excludedCountryIds : kotlin.String = excludedCountryIds_example // kotlin.String | Only places NOT in these countries (comma-delimited country codes or WikiData ids)
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val types : kotlin.String = types_example // kotlin.String | Only cities for these types (comma-delimited): ADM2 | CITY
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findCitiesNearLocationUsingGET(locationId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findCitiesNearLocationUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findCitiesNearLocationUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **locationId** | **kotlin.String**| A latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD | |
| **radius** | **kotlin.Int**| The location radius within which to find places | [optional] |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |
| **countryIds** | **kotlin.String**| Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **excludedCountryIds** | **kotlin.String**| Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **types** | **kotlin.String**| Only cities for these types (comma-delimited): ADM2 | CITY | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findCitiesUsingGET"></a>
# **findCitiesUsingGET**
> PopulatedPlacesResponse findCitiesUsingGET(location, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find cities

Find cities, filtering by optional criteria. If no criteria are set, you will get back all known cities. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val location : kotlin.String = location_example // kotlin.String | Only places near this location. Latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD
val radius : kotlin.Int = 56 // kotlin.Int | The location radius within which to find places
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
val countryIds : kotlin.String = countryIds_example // kotlin.String | Only places in these countries (comma-delimited country codes or WikiData ids)
val excludedCountryIds : kotlin.String = excludedCountryIds_example // kotlin.String | Only places NOT in these countries (comma-delimited country codes or WikiData ids)
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val types : kotlin.String = types_example // kotlin.String | Only cities for these types (comma-delimited): ADM2 | CITY
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findCitiesUsingGET(location, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findCitiesUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findCitiesUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **location** | **kotlin.String**| Only places near this location. Latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD | [optional] |
| **radius** | **kotlin.Int**| The location radius within which to find places | [optional] |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |
| **countryIds** | **kotlin.String**| Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **excludedCountryIds** | **kotlin.String**| Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **types** | **kotlin.String**| Only cities for these types (comma-delimited): ADM2 | CITY | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findCountryPlacesUsingGET"></a>
# **findCountryPlacesUsingGET**
> PopulatedPlacesResponse findCountryPlacesUsingGET(countryId, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find country places

Get the country&#39;s places. The country is omitted in the response. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val countryId : kotlin.String = countryId_example // kotlin.String | An ISO-3166 country code or WikiData id
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val types : kotlin.String = types_example // kotlin.String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort place results.  'Format: ±SORT_FIELD,±SORT_FIELD'  where SORT_FIELD = elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findCountryPlacesUsingGET(countryId, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findCountryPlacesUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findCountryPlacesUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **countryId** | **kotlin.String**| An ISO-3166 country code or WikiData id | |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **types** | **kotlin.String**| Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort place results.  &#39;Format: ±SORT_FIELD,±SORT_FIELD&#39;  where SORT_FIELD &#x3D; elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findDivisionsNearAdminDivisionUsingGET"></a>
# **findDivisionsNearAdminDivisionUsingGET**
> PopulatedPlacesResponse findDivisionsNearAdminDivisionUsingGET(divisionId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find admin divisions near division

Find administrative divisions near the given division, filtering by optional criteria. If no criteria are set, you will get back all known divisions. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val divisionId : kotlin.String = divisionId_example // kotlin.String | An admin-division id (either native 'id' or 'wikiDataId')
val radius : kotlin.Int = 56 // kotlin.Int | The location radius within which to find places
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
val countryIds : kotlin.String = countryIds_example // kotlin.String | Only places in these countries (comma-delimited country codes or WikiData ids)
val excludedCountryIds : kotlin.String = excludedCountryIds_example // kotlin.String | Only places NOT in these countries (comma-delimited country codes or WikiData ids)
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findDivisionsNearAdminDivisionUsingGET(divisionId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findDivisionsNearAdminDivisionUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findDivisionsNearAdminDivisionUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **divisionId** | **kotlin.String**| An admin-division id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **radius** | **kotlin.Int**| The location radius within which to find places | [optional] |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |
| **countryIds** | **kotlin.String**| Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **excludedCountryIds** | **kotlin.String**| Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findDivisionsNearCityUsingGET"></a>
# **findDivisionsNearCityUsingGET**
> PopulatedPlacesResponse findDivisionsNearCityUsingGET(cityId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find admin divisions near city

Find administrative divisions near the given city, filtering by optional criteria. If no criteria are set, you will get back all divisions within the default radius. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val cityId : kotlin.String = cityId_example // kotlin.String | A city id (either native 'id' or 'wikiDataId')
val radius : kotlin.Int = 56 // kotlin.Int | The location radius within which to find places
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
val countryIds : kotlin.String = countryIds_example // kotlin.String | Only places in these countries (comma-delimited country codes or WikiData ids)
val excludedCountryIds : kotlin.String = excludedCountryIds_example // kotlin.String | Only places NOT in these countries (comma-delimited country codes or WikiData ids)
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findDivisionsNearCityUsingGET(cityId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findDivisionsNearCityUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findDivisionsNearCityUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **cityId** | **kotlin.String**| A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **radius** | **kotlin.Int**| The location radius within which to find places | [optional] |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |
| **countryIds** | **kotlin.String**| Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **excludedCountryIds** | **kotlin.String**| Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findDivisionsNearLocationUsingGET"></a>
# **findDivisionsNearLocationUsingGET**
> PopulatedPlacesResponse findDivisionsNearLocationUsingGET(locationId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find admin divisions near location

Find administrative divisions near the given location, filtering by optional criteria. If no criteria are set, you will get back all divisions within the default radius. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val locationId : kotlin.String = locationId_example // kotlin.String | A latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD
val radius : kotlin.Int = 56 // kotlin.Int | The location radius within which to find places
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
val countryIds : kotlin.String = countryIds_example // kotlin.String | Only places in these countries (comma-delimited country codes or WikiData ids)
val excludedCountryIds : kotlin.String = excludedCountryIds_example // kotlin.String | Only places NOT in these countries (comma-delimited country codes or WikiData ids)
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findDivisionsNearLocationUsingGET(locationId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findDivisionsNearLocationUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findDivisionsNearLocationUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **locationId** | **kotlin.String**| A latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD | |
| **radius** | **kotlin.Int**| The location radius within which to find places | [optional] |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |
| **countryIds** | **kotlin.String**| Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **excludedCountryIds** | **kotlin.String**| Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findPlacesNearAdminDivisionUsingGET"></a>
# **findPlacesNearAdminDivisionUsingGET**
> PopulatedPlacesResponse findPlacesNearAdminDivisionUsingGET(divisionId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find places near division

Find places near the given administrative division, filtering by optional criteria. If no criteria are set, you will get back all known places. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val divisionId : kotlin.String = divisionId_example // kotlin.String | An admin-division id (either native 'id' or 'wikiDataId')
val radius : kotlin.Int = 56 // kotlin.Int | The location radius within which to find places
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
val countryIds : kotlin.String = countryIds_example // kotlin.String | Only places in these countries (comma-delimited country codes or WikiData ids)
val excludedCountryIds : kotlin.String = excludedCountryIds_example // kotlin.String | Only places NOT in these countries (comma-delimited country codes or WikiData ids)
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val types : kotlin.String = types_example // kotlin.String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findPlacesNearAdminDivisionUsingGET(divisionId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findPlacesNearAdminDivisionUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findPlacesNearAdminDivisionUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **divisionId** | **kotlin.String**| An admin-division id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **radius** | **kotlin.Int**| The location radius within which to find places | [optional] |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |
| **countryIds** | **kotlin.String**| Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **excludedCountryIds** | **kotlin.String**| Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **types** | **kotlin.String**| Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findPlacesNearCityUsingGET"></a>
# **findPlacesNearCityUsingGET**
> PopulatedPlacesResponse findPlacesNearCityUsingGET(cityId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find places near city

Find places near the given city, filtering by optional criteria. If no criteria are set, you will get back all places within the default radius. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val cityId : kotlin.String = cityId_example // kotlin.String | A city id (either native 'id' or 'wikiDataId')
val radius : kotlin.Int = 56 // kotlin.Int | The location radius within which to find places
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
val countryIds : kotlin.String = countryIds_example // kotlin.String | Only places in these countries (comma-delimited country codes or WikiData ids)
val excludedCountryIds : kotlin.String = excludedCountryIds_example // kotlin.String | Only places NOT in these countries (comma-delimited country codes or WikiData ids)
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val types : kotlin.String = types_example // kotlin.String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findPlacesNearCityUsingGET(cityId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findPlacesNearCityUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findPlacesNearCityUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **cityId** | **kotlin.String**| A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **radius** | **kotlin.Int**| The location radius within which to find places | [optional] |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |
| **countryIds** | **kotlin.String**| Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **excludedCountryIds** | **kotlin.String**| Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **types** | **kotlin.String**| Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findPlacesNearLocationUsingGET"></a>
# **findPlacesNearLocationUsingGET**
> PopulatedPlacesResponse findPlacesNearLocationUsingGET(locationId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find places near location

Find places near the given location, filtering by optional criteria. If no criteria are set, you will get back all places within the default radius. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val locationId : kotlin.String = locationId_example // kotlin.String | A latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD
val radius : kotlin.Int = 56 // kotlin.Int | The location radius within which to find places
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
val countryIds : kotlin.String = countryIds_example // kotlin.String | Only places in these countries (comma-delimited country codes or WikiData ids)
val excludedCountryIds : kotlin.String = excludedCountryIds_example // kotlin.String | Only places NOT in these countries (comma-delimited country codes or WikiData ids)
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val types : kotlin.String = types_example // kotlin.String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findPlacesNearLocationUsingGET(locationId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findPlacesNearLocationUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findPlacesNearLocationUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **locationId** | **kotlin.String**| A latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD | |
| **radius** | **kotlin.Int**| The location radius within which to find places | [optional] |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |
| **countryIds** | **kotlin.String**| Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **excludedCountryIds** | **kotlin.String**| Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **types** | **kotlin.String**| Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findPlacesNearPlaceUsingGET"></a>
# **findPlacesNearPlaceUsingGET**
> PopulatedPlacesResponse findPlacesNearPlaceUsingGET(placeId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find places near place

Find places near the given place, filtering by optional criteria. If no criteria are set, you will get back all places within the default radius. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val placeId : kotlin.String = placeId_example // kotlin.String | A place id (either native 'id' or 'wikiDataId')
val radius : kotlin.Int = 56 // kotlin.Int | The location radius within which to find places
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
val countryIds : kotlin.String = countryIds_example // kotlin.String | Only places in these countries (comma-delimited country codes or WikiData ids)
val excludedCountryIds : kotlin.String = excludedCountryIds_example // kotlin.String | Only places NOT in these countries (comma-delimited country codes or WikiData ids)
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val types : kotlin.String = types_example // kotlin.String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findPlacesNearPlaceUsingGET(placeId, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findPlacesNearPlaceUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findPlacesNearPlaceUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **placeId** | **kotlin.String**| A place id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **radius** | **kotlin.Int**| The location radius within which to find places | [optional] |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |
| **countryIds** | **kotlin.String**| Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **excludedCountryIds** | **kotlin.String**| Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **types** | **kotlin.String**| Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findPlacesUsingGET"></a>
# **findPlacesUsingGET**
> PopulatedPlacesResponse findPlacesUsingGET(location, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find places

Find places, filtering by optional criteria. If no criteria are set, you will get back all known places. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val location : kotlin.String = location_example // kotlin.String | Only places near this location. Latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD
val radius : kotlin.Int = 56 // kotlin.Int | The location radius within which to find places
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
val countryIds : kotlin.String = countryIds_example // kotlin.String | Only places in these countries (comma-delimited country codes or WikiData ids)
val excludedCountryIds : kotlin.String = excludedCountryIds_example // kotlin.String | Only places NOT in these countries (comma-delimited country codes or WikiData ids)
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val types : kotlin.String = types_example // kotlin.String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD = countryCode | elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findPlacesUsingGET(location, radius, distanceUnit, countryIds, excludedCountryIds, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findPlacesUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findPlacesUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **location** | **kotlin.String**| Only places near this location. Latitude/longitude in ISO-6709 format: ±DD.DDDD±DDD.DDDD | [optional] |
| **radius** | **kotlin.Int**| The location radius within which to find places | [optional] |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |
| **countryIds** | **kotlin.String**| Only places in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **excludedCountryIds** | **kotlin.String**| Only places NOT in these countries (comma-delimited country codes or WikiData ids) | [optional] |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **types** | **kotlin.String**| Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort places.  Format: ±SORT_FIELD,±SORT_FIELD  where SORT_FIELD &#x3D; countryCode | elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findRegionCitiesUsingGET"></a>
# **findRegionCitiesUsingGET**
> PopulatedPlacesResponse findRegionCitiesUsingGET(countryId, regionCode, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find country region cities

Get country region cities. The country and region info is omitted in the response. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val countryId : kotlin.String = countryId_example // kotlin.String | An ISO-3166 country code or WikiData id
val regionCode : kotlin.String = regionCode_example // kotlin.String | An ISO-3166 or FIPS region code
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val types : kotlin.String = types_example // kotlin.String | Only cities for these types (comma-delimited): ADM2 | CITY
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort place results.  'Format: ±SORT_FIELD,±SORT_FIELD'  where SORT_FIELD = elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findRegionCitiesUsingGET(countryId, regionCode, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findRegionCitiesUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findRegionCitiesUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **countryId** | **kotlin.String**| An ISO-3166 country code or WikiData id | |
| **regionCode** | **kotlin.String**| An ISO-3166 or FIPS region code | |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **types** | **kotlin.String**| Only cities for these types (comma-delimited): ADM2 | CITY | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort place results.  &#39;Format: ±SORT_FIELD,±SORT_FIELD&#39;  where SORT_FIELD &#x3D; elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findRegionDivisionsUsingGET"></a>
# **findRegionDivisionsUsingGET**
> PopulatedPlacesResponse findRegionDivisionsUsingGET(countryId, regionCode, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find country region administrative divisions

Get country region administrative divisions. The country and region info is omitted in the response. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val countryId : kotlin.String = countryId_example // kotlin.String | An ISO-3166 country code or WikiData id
val regionCode : kotlin.String = regionCode_example // kotlin.String | An ISO-3166 or FIPS region code
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort place results.  'Format: ±SORT_FIELD,±SORT_FIELD'  where SORT_FIELD = elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findRegionDivisionsUsingGET(countryId, regionCode, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findRegionDivisionsUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findRegionDivisionsUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **countryId** | **kotlin.String**| An ISO-3166 country code or WikiData id | |
| **regionCode** | **kotlin.String**| An ISO-3166 or FIPS region code | |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort place results.  &#39;Format: ±SORT_FIELD,±SORT_FIELD&#39;  where SORT_FIELD &#x3D; elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="findRegionPlacesUsingGET"></a>
# **findRegionPlacesUsingGET**
> PopulatedPlacesResponse findRegionPlacesUsingGET(countryId, regionCode, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)

Find country region places

Get country region places. The country and region info is omitted in the response. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val countryId : kotlin.String = countryId_example // kotlin.String | An ISO-3166 country code or WikiData id
val regionCode : kotlin.String = regionCode_example // kotlin.String | An ISO-3166 or FIPS region code
val minPopulation : kotlin.Int = 56 // kotlin.Int | Only places having at least this population
val maxPopulation : kotlin.Int = 56 // kotlin.Int | Only places having no more than this population
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val timeZoneIds : kotlin.String = timeZoneIds_example // kotlin.String | Only places in these time-zones (comma-delimited)
val types : kotlin.String = types_example // kotlin.String | Only places for these types (comma-delimited): ADM2 | CITY | ISLAND
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort place results.  'Format: ±SORT_FIELD,±SORT_FIELD'  where SORT_FIELD = elevation | name | population 
val includeDeleted : kotlin.String = includeDeleted_example // kotlin.String | Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE
try {
    val result : PopulatedPlacesResponse = apiInstance.findRegionPlacesUsingGET(countryId, regionCode, minPopulation, maxPopulation, namePrefix, namePrefixDefaultLangResults, timeZoneIds, types, asciiMode, hateoasMode, languageCode, limit, offset, sort, includeDeleted)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#findRegionPlacesUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#findRegionPlacesUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **countryId** | **kotlin.String**| An ISO-3166 country code or WikiData id | |
| **regionCode** | **kotlin.String**| An ISO-3166 or FIPS region code | |
| **minPopulation** | **kotlin.Int**| Only places having at least this population | [optional] |
| **maxPopulation** | **kotlin.Int**| Only places having no more than this population | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **timeZoneIds** | **kotlin.String**| Only places in these time-zones (comma-delimited) | [optional] |
| **types** | **kotlin.String**| Only places for these types (comma-delimited): ADM2 | CITY | ISLAND | [optional] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| **sort** | **kotlin.String**| How to sort place results.  &#39;Format: ±SORT_FIELD,±SORT_FIELD&#39;  where SORT_FIELD &#x3D; elevation | name | population  | [optional] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **includeDeleted** | **kotlin.String**| Whether to include any divisions marked deleted: ALL | SINCE_YESTERDAY | SINCE_LAST_WEEK | NONE | [optional] [default to &quot;NONE&quot;] |

### Return type

[**PopulatedPlacesResponse**](PopulatedPlacesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getAdminDivisionUsingGET"></a>
# **getAdminDivisionUsingGET**
> PopulatedPlaceResponse getAdminDivisionUsingGET(divisionId, asciiMode, languageCode)

Get admin division details

Get administrative division details such as location coordinates, population, and elevation above sea-level (if available). 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val divisionId : kotlin.String = divisionId_example // kotlin.String | An admin-division id (either native 'id' or 'wikiDataId')
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
try {
    val result : PopulatedPlaceResponse = apiInstance.getAdminDivisionUsingGET(divisionId, asciiMode, languageCode)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getAdminDivisionUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getAdminDivisionUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **divisionId** | **kotlin.String**| An admin-division id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |

### Return type

[**PopulatedPlaceResponse**](PopulatedPlaceResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getCityDateTimeUsingGET"></a>
# **getCityDateTimeUsingGET**
> DateTimeResponse getCityDateTimeUsingGET(cityId)

Get city date-time

Get city date-time

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val cityId : kotlin.String = cityId_example // kotlin.String | A city id (either native 'id' or 'wikiDataId')
try {
    val result : DateTimeResponse = apiInstance.getCityDateTimeUsingGET(cityId)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getCityDateTimeUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getCityDateTimeUsingGET")
    e.printStackTrace()
}
```

### Parameters
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **cityId** | **kotlin.String**| A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |

### Return type

[**DateTimeResponse**](DateTimeResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getCityDistanceUsingGET"></a>
# **getCityDistanceUsingGET**
> DistanceResponse getCityDistanceUsingGET(cityId, toCityId, distanceUnit)

Get city distance

Get distance from the given city

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val cityId : kotlin.String = cityId_example // kotlin.String | A city id (either native 'id' or 'wikiDataId')
val toCityId : kotlin.String = toCityId_example // kotlin.String | Distance to this city
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
try {
    val result : DistanceResponse = apiInstance.getCityDistanceUsingGET(cityId, toCityId, distanceUnit)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getCityDistanceUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getCityDistanceUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **cityId** | **kotlin.String**| A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **toCityId** | **kotlin.String**| Distance to this city | |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |

### Return type

[**DistanceResponse**](DistanceResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getCityLocatedInUsingGET"></a>
# **getCityLocatedInUsingGET**
> PopulatedPlaceResponse getCityLocatedInUsingGET(cityId, asciiMode, languageCode)

Get city containing region

Get the details for the containing populated place (e.g., its county or other administrative division), including location coordinates, population, and elevation above sea-level (if available). 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val cityId : kotlin.String = cityId_example // kotlin.String | A city id (either native 'id' or 'wikiDataId')
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
try {
    val result : PopulatedPlaceResponse = apiInstance.getCityLocatedInUsingGET(cityId, asciiMode, languageCode)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getCityLocatedInUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getCityLocatedInUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **cityId** | **kotlin.String**| A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |

### Return type

[**PopulatedPlaceResponse**](PopulatedPlaceResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getCityTimeUsingGET"></a>
# **getCityTimeUsingGET**
> TimeResponse getCityTimeUsingGET(cityId)

Get city time

Get city time

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val cityId : kotlin.String = cityId_example // kotlin.String | A city id (either native 'id' or 'wikiDataId')
try {
    val result : TimeResponse = apiInstance.getCityTimeUsingGET(cityId)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getCityTimeUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getCityTimeUsingGET")
    e.printStackTrace()
}
```

### Parameters
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **cityId** | **kotlin.String**| A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |

### Return type

[**TimeResponse**](TimeResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getCityUsingGET"></a>
# **getCityUsingGET**
> PopulatedPlaceResponse getCityUsingGET(cityId, asciiMode, languageCode)

Get city details

Get city details such as location coordinates, population, and elevation above sea-level (if available). 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val cityId : kotlin.String = cityId_example // kotlin.String | A city id (either native 'id' or 'wikiDataId')
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
try {
    val result : PopulatedPlaceResponse = apiInstance.getCityUsingGET(cityId, asciiMode, languageCode)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getCityUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getCityUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **cityId** | **kotlin.String**| A city id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |

### Return type

[**PopulatedPlaceResponse**](PopulatedPlaceResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getCountriesUsingGET"></a>
# **getCountriesUsingGET**
> CountriesResponse getCountriesUsingGET(currencyCode, namePrefix, namePrefixDefaultLangResults, asciiMode, hateoasMode, languageCode, limit, offset, sort)

Find countries

Find countries, filtering by optional criteria. If no criteria are set, you will get back all known countries. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val currencyCode : kotlin.String = currencyCode_example // kotlin.String | Only countries supporting this currency
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort countries.  Format: ±SORT_FIELD  where SORT_FIELD = code | name
try {
    val result : CountriesResponse = apiInstance.getCountriesUsingGET(currencyCode, namePrefix, namePrefixDefaultLangResults, asciiMode, hateoasMode, languageCode, limit, offset, sort)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getCountriesUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getCountriesUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **currencyCode** | **kotlin.String**| Only countries supporting this currency | [optional] |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **sort** | **kotlin.String**| How to sort countries.  Format: ±SORT_FIELD  where SORT_FIELD &#x3D; code | name | [optional] |

### Return type

[**CountriesResponse**](CountriesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getCountryUsingGET"></a>
# **getCountryUsingGET**
> CountryResponse getCountryUsingGET(countryId, asciiMode, languageCode)

Get country details

Get country details such as number of regions.

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val countryId : kotlin.String = countryId_example // kotlin.String | An ISO-3166 country code or WikiData id
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
try {
    val result : CountryResponse = apiInstance.getCountryUsingGET(countryId, asciiMode, languageCode)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getCountryUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getCountryUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **countryId** | **kotlin.String**| An ISO-3166 country code or WikiData id | |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |

### Return type

[**CountryResponse**](CountryResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getPlaceDateTimeUsingGET"></a>
# **getPlaceDateTimeUsingGET**
> DateTimeResponse getPlaceDateTimeUsingGET(placeId)

Get place date-time

Get place date-time

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val placeId : kotlin.String = placeId_example // kotlin.String | A place id (either native 'id' or 'wikiDataId')
try {
    val result : DateTimeResponse = apiInstance.getPlaceDateTimeUsingGET(placeId)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getPlaceDateTimeUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getPlaceDateTimeUsingGET")
    e.printStackTrace()
}
```

### Parameters
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **placeId** | **kotlin.String**| A place id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |

### Return type

[**DateTimeResponse**](DateTimeResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getPlaceDistanceUsingGET"></a>
# **getPlaceDistanceUsingGET**
> DistanceResponse getPlaceDistanceUsingGET(placeId, toPlaceId, distanceUnit)

Get place distance

Get distance from the given place

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val placeId : kotlin.String = placeId_example // kotlin.String | A place id (either native 'id' or 'wikiDataId')
val toPlaceId : kotlin.String = toPlaceId_example // kotlin.String | Distance to this place
val distanceUnit : kotlin.String = distanceUnit_example // kotlin.String | The unit of distance: MI | KM
try {
    val result : DistanceResponse = apiInstance.getPlaceDistanceUsingGET(placeId, toPlaceId, distanceUnit)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getPlaceDistanceUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getPlaceDistanceUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **placeId** | **kotlin.String**| A place id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **toPlaceId** | **kotlin.String**| Distance to this place | |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **distanceUnit** | **kotlin.String**| The unit of distance: MI | KM | [optional] [default to &quot;MI&quot;] |

### Return type

[**DistanceResponse**](DistanceResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getPlaceLocatedInUsingGET"></a>
# **getPlaceLocatedInUsingGET**
> PopulatedPlaceResponse getPlaceLocatedInUsingGET(placeId, asciiMode, languageCode)

Get place containing region

Get the details for the containing populated place (e.g., its county or other administrative division), including location coordinates, population, and elevation above sea-level (if available). 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val placeId : kotlin.String = placeId_example // kotlin.String | A place id (either native 'id' or 'wikiDataId')
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
try {
    val result : PopulatedPlaceResponse = apiInstance.getPlaceLocatedInUsingGET(placeId, asciiMode, languageCode)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getPlaceLocatedInUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getPlaceLocatedInUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **placeId** | **kotlin.String**| A place id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |

### Return type

[**PopulatedPlaceResponse**](PopulatedPlaceResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getPlaceTimeUsingGET"></a>
# **getPlaceTimeUsingGET**
> TimeResponse getPlaceTimeUsingGET(placeId)

Get place time

Get place time

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val placeId : kotlin.String = placeId_example // kotlin.String | A place id (either native 'id' or 'wikiDataId')
try {
    val result : TimeResponse = apiInstance.getPlaceTimeUsingGET(placeId)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getPlaceTimeUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getPlaceTimeUsingGET")
    e.printStackTrace()
}
```

### Parameters
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **placeId** | **kotlin.String**| A place id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |

### Return type

[**TimeResponse**](TimeResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getPlaceUsingGET"></a>
# **getPlaceUsingGET**
> PopulatedPlaceResponse getPlaceUsingGET(placeId, asciiMode, languageCode)

Get place details

Get place details such as location coordinates, population, and elevation above sea-level (if available). 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val placeId : kotlin.String = placeId_example // kotlin.String | A place id (either native 'id' or 'wikiDataId')
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
try {
    val result : PopulatedPlaceResponse = apiInstance.getPlaceUsingGET(placeId, asciiMode, languageCode)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getPlaceUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getPlaceUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **placeId** | **kotlin.String**| A place id (either native &#39;id&#39; or &#39;wikiDataId&#39;) | |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |

### Return type

[**PopulatedPlaceResponse**](PopulatedPlaceResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getRegionUsingGET"></a>
# **getRegionUsingGET**
> RegionResponse getRegionUsingGET(countryId, regionCode, asciiMode, languageCode)

Get region details

Get country region details such as number of cities.

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val countryId : kotlin.String = countryId_example // kotlin.String | An ISO-3166 country code or WikiData id
val regionCode : kotlin.String = regionCode_example // kotlin.String | An ISO-3166 or FIPS region code
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
try {
    val result : RegionResponse = apiInstance.getRegionUsingGET(countryId, regionCode, asciiMode, languageCode)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getRegionUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getRegionUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **countryId** | **kotlin.String**| An ISO-3166 country code or WikiData id | |
| **regionCode** | **kotlin.String**| An ISO-3166 or FIPS region code | |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |

### Return type

[**RegionResponse**](RegionResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getRegionsUsingGET"></a>
# **getRegionsUsingGET**
> RegionsResponse getRegionsUsingGET(countryId, namePrefix, namePrefixDefaultLangResults, asciiMode, hateoasMode, languageCode, limit, offset, sort)

Find country regions

Get the country&#39;s regions. These could be states, provinces, districts, or otherwise major political divisions. 

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = GeoApi()
val countryId : kotlin.String = countryId_example // kotlin.String | An ISO-3166 country code or WikiData id
val namePrefix : kotlin.String = namePrefix_example // kotlin.String | Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language. 
val namePrefixDefaultLangResults : kotlin.Boolean = true // kotlin.Boolean | When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set. 
val asciiMode : kotlin.Boolean = true // kotlin.Boolean | Display results using ASCII characters
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val languageCode : kotlin.String = languageCode_example // kotlin.String | Display results in this language
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
val sort : kotlin.String = sort_example // kotlin.String | How to sort regions.  Format: ±SORT_FIELD  where SORT_FIELD = fipsCode | isoCode | name
try {
    val result : RegionsResponse = apiInstance.getRegionsUsingGET(countryId, namePrefix, namePrefixDefaultLangResults, asciiMode, hateoasMode, languageCode, limit, offset, sort)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling GeoApi#getRegionsUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling GeoApi#getRegionsUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **countryId** | **kotlin.String**| An ISO-3166 country code or WikiData id | |
| **namePrefix** | **kotlin.String**| Only entities whose names start with this prefix. If languageCode is set, the prefix will be matched on the name as it appears in that language.  | [optional] |
| **namePrefixDefaultLangResults** | **kotlin.Boolean**| When name-prefix matching, whether or not to match on names in the default language if a non-default languageCode is set.  | [optional] [default to true] |
| **asciiMode** | **kotlin.Boolean**| Display results using ASCII characters | [optional] [default to false] |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **languageCode** | **kotlin.String**| Display results in this language | [optional] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **sort** | **kotlin.String**| How to sort regions.  Format: ±SORT_FIELD  where SORT_FIELD &#x3D; fipsCode | isoCode | name | [optional] |

### Return type

[**RegionsResponse**](RegionsResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

