# LocaleAPI

All URIs are relative to *https://wft-geo-db.p.rapidapi.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCurrenciesUsingGET**](LocaleAPI.md#getcurrenciesusingget) | **GET** /locale/currencies | Find currencies
[**getLanguagesUsingGET**](LocaleAPI.md#getlanguagesusingget) | **GET** /locale/languages | Get languages
[**getLocalesUsingGET**](LocaleAPI.md#getlocalesusingget) | **GET** /locale/locales | Get locales
[**getTimeZoneDateTimeUsingGET**](LocaleAPI.md#gettimezonedatetimeusingget) | **GET** /locale/timezones/{zoneId}/dateTime | Get time-zone date-time
[**getTimeZoneTimeUsingGET**](LocaleAPI.md#gettimezonetimeusingget) | **GET** /locale/timezones/{zoneId}/time | Get time-zone time
[**getTimeZoneUsingGET**](LocaleAPI.md#gettimezoneusingget) | **GET** /locale/timezones/{zoneId} | Get time-zone
[**getTimezonesUsingGET**](LocaleAPI.md#gettimezonesusingget) | **GET** /locale/timezones | Get time-zones


# **getCurrenciesUsingGET**
```swift
    open class func getCurrenciesUsingGET(countryId: String, hateoasMode: Bool? = nil, limit: Int? = nil, offset: Int? = nil, completion: @escaping (_ data: CurrenciesResponse?, _ error: Error?) -> Void)
```

Find currencies

Find currencies, filtering by optional criteria. If no criteria are set, you will get back all known currencies.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let countryId = "countryId_example" // String | Currencies for this country id
let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)

// Find currencies
LocaleAPI.getCurrenciesUsingGET(countryId: countryId, hateoasMode: hateoasMode, limit: limit, offset: offset) { (response, error) in
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
 **countryId** | **String** | Currencies for this country id | 
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]

### Return type

[**CurrenciesResponse**](CurrenciesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLanguagesUsingGET**
```swift
    open class func getLanguagesUsingGET(hateoasMode: Bool? = nil, limit: Int? = nil, offset: Int? = nil, completion: @escaping (_ data: LanguagesResponse?, _ error: Error?) -> Void)
```

Get languages

Get all supported languages

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)

// Get languages
LocaleAPI.getLanguagesUsingGET(hateoasMode: hateoasMode, limit: limit, offset: offset) { (response, error) in
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
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]

### Return type

[**LanguagesResponse**](LanguagesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLocalesUsingGET**
```swift
    open class func getLocalesUsingGET(hateoasMode: Bool? = nil, limit: Int? = nil, offset: Int? = nil, completion: @escaping (_ data: LocalesResponse?, _ error: Error?) -> Void)
```

Get locales

Get all known locales

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)

// Get locales
LocaleAPI.getLocalesUsingGET(hateoasMode: hateoasMode, limit: limit, offset: offset) { (response, error) in
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
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]

### Return type

[**LocalesResponse**](LocalesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTimeZoneDateTimeUsingGET**
```swift
    open class func getTimeZoneDateTimeUsingGET(zoneId: String, completion: @escaping (_ data: DateTimeResponse?, _ error: Error?) -> Void)
```

Get time-zone date-time

Get time-zone date-time

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let zoneId = "zoneId_example" // String | A time-zone id

// Get time-zone date-time
LocaleAPI.getTimeZoneDateTimeUsingGET(zoneId: zoneId) { (response, error) in
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
 **zoneId** | **String** | A time-zone id | 

### Return type

[**DateTimeResponse**](DateTimeResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTimeZoneTimeUsingGET**
```swift
    open class func getTimeZoneTimeUsingGET(zoneId: String, completion: @escaping (_ data: TimeResponse?, _ error: Error?) -> Void)
```

Get time-zone time

Get time-zone time

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let zoneId = "zoneId_example" // String | A time-zone id

// Get time-zone time
LocaleAPI.getTimeZoneTimeUsingGET(zoneId: zoneId) { (response, error) in
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
 **zoneId** | **String** | A time-zone id | 

### Return type

[**TimeResponse**](TimeResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTimeZoneUsingGET**
```swift
    open class func getTimeZoneUsingGET(zoneId: String, completion: @escaping (_ data: TimeZoneResponse?, _ error: Error?) -> Void)
```

Get time-zone

Get time-zone

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let zoneId = "zoneId_example" // String | A time-zone id

// Get time-zone
LocaleAPI.getTimeZoneUsingGET(zoneId: zoneId) { (response, error) in
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
 **zoneId** | **String** | A time-zone id | 

### Return type

[**TimeZoneResponse**](TimeZoneResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTimezonesUsingGET**
```swift
    open class func getTimezonesUsingGET(hateoasMode: Bool? = nil, limit: Int? = nil, offset: Int? = nil, completion: @escaping (_ data: TimeZonesResponse?, _ error: Error?) -> Void)
```

Get time-zones

Get all known time-zones

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CitiesAPI

let hateoasMode = true // Bool | Include HATEOAS-style links in results (optional) (default to true)
let limit = 987 // Int | The maximum number of results to retrieve (optional) (default to 10)
let offset = 987 // Int | The zero-ary offset index into the results (optional) (default to 0)

// Get time-zones
LocaleAPI.getTimezonesUsingGET(hateoasMode: hateoasMode, limit: limit, offset: offset) { (response, error) in
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
 **hateoasMode** | **Bool** | Include HATEOAS-style links in results | [optional] [default to true]
 **limit** | **Int** | The maximum number of results to retrieve | [optional] [default to 10]
 **offset** | **Int** | The zero-ary offset index into the results | [optional] [default to 0]

### Return type

[**TimeZonesResponse**](TimeZonesResponse.md)

### Authorization

[UserSecurity](../README.md#UserSecurity)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

