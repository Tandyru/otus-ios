# LocaleApi

All URIs are relative to *https://wft-geo-db.p.rapidapi.com/v1*

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**getCurrenciesUsingGET**](LocaleApi.md#getCurrenciesUsingGET) | **GET** /locale/currencies | Find currencies |
| [**getLanguagesUsingGET**](LocaleApi.md#getLanguagesUsingGET) | **GET** /locale/languages | Get languages |
| [**getLocalesUsingGET**](LocaleApi.md#getLocalesUsingGET) | **GET** /locale/locales | Get locales |
| [**getTimeZoneDateTimeUsingGET**](LocaleApi.md#getTimeZoneDateTimeUsingGET) | **GET** /locale/timezones/{zoneId}/dateTime | Get time-zone date-time |
| [**getTimeZoneTimeUsingGET**](LocaleApi.md#getTimeZoneTimeUsingGET) | **GET** /locale/timezones/{zoneId}/time | Get time-zone time |
| [**getTimeZoneUsingGET**](LocaleApi.md#getTimeZoneUsingGET) | **GET** /locale/timezones/{zoneId} | Get time-zone |
| [**getTimezonesUsingGET**](LocaleApi.md#getTimezonesUsingGET) | **GET** /locale/timezones | Get time-zones |


<a id="getCurrenciesUsingGET"></a>
# **getCurrenciesUsingGET**
> CurrenciesResponse getCurrenciesUsingGET(countryId, hateoasMode, limit, offset)

Find currencies

Find currencies, filtering by optional criteria. If no criteria are set, you will get back all known currencies.

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = LocaleApi()
val countryId : kotlin.String = countryId_example // kotlin.String | Currencies for this country id
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
try {
    val result : CurrenciesResponse = apiInstance.getCurrenciesUsingGET(countryId, hateoasMode, limit, offset)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling LocaleApi#getCurrenciesUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling LocaleApi#getCurrenciesUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **countryId** | **kotlin.String**| Currencies for this country id | |
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |

### Return type

[**CurrenciesResponse**](CurrenciesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getLanguagesUsingGET"></a>
# **getLanguagesUsingGET**
> LanguagesResponse getLanguagesUsingGET(hateoasMode, limit, offset)

Get languages

Get all supported languages

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = LocaleApi()
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
try {
    val result : LanguagesResponse = apiInstance.getLanguagesUsingGET(hateoasMode, limit, offset)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling LocaleApi#getLanguagesUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling LocaleApi#getLanguagesUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |

### Return type

[**LanguagesResponse**](LanguagesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getLocalesUsingGET"></a>
# **getLocalesUsingGET**
> LocalesResponse getLocalesUsingGET(hateoasMode, limit, offset)

Get locales

Get all known locales

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = LocaleApi()
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
try {
    val result : LocalesResponse = apiInstance.getLocalesUsingGET(hateoasMode, limit, offset)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling LocaleApi#getLocalesUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling LocaleApi#getLocalesUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |

### Return type

[**LocalesResponse**](LocalesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getTimeZoneDateTimeUsingGET"></a>
# **getTimeZoneDateTimeUsingGET**
> DateTimeResponse getTimeZoneDateTimeUsingGET(zoneId)

Get time-zone date-time

Get time-zone date-time

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = LocaleApi()
val zoneId : kotlin.String = zoneId_example // kotlin.String | A time-zone id
try {
    val result : DateTimeResponse = apiInstance.getTimeZoneDateTimeUsingGET(zoneId)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling LocaleApi#getTimeZoneDateTimeUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling LocaleApi#getTimeZoneDateTimeUsingGET")
    e.printStackTrace()
}
```

### Parameters
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **zoneId** | **kotlin.String**| A time-zone id | |

### Return type

[**DateTimeResponse**](DateTimeResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getTimeZoneTimeUsingGET"></a>
# **getTimeZoneTimeUsingGET**
> TimeResponse getTimeZoneTimeUsingGET(zoneId)

Get time-zone time

Get time-zone time

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = LocaleApi()
val zoneId : kotlin.String = zoneId_example // kotlin.String | A time-zone id
try {
    val result : TimeResponse = apiInstance.getTimeZoneTimeUsingGET(zoneId)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling LocaleApi#getTimeZoneTimeUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling LocaleApi#getTimeZoneTimeUsingGET")
    e.printStackTrace()
}
```

### Parameters
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **zoneId** | **kotlin.String**| A time-zone id | |

### Return type

[**TimeResponse**](TimeResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getTimeZoneUsingGET"></a>
# **getTimeZoneUsingGET**
> TimeZoneResponse getTimeZoneUsingGET(zoneId)

Get time-zone

Get time-zone

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = LocaleApi()
val zoneId : kotlin.String = zoneId_example // kotlin.String | A time-zone id
try {
    val result : TimeZoneResponse = apiInstance.getTimeZoneUsingGET(zoneId)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling LocaleApi#getTimeZoneUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling LocaleApi#getTimeZoneUsingGET")
    e.printStackTrace()
}
```

### Parameters
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **zoneId** | **kotlin.String**| A time-zone id | |

### Return type

[**TimeZoneResponse**](TimeZoneResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getTimezonesUsingGET"></a>
# **getTimezonesUsingGET**
> TimeZonesResponse getTimezonesUsingGET(hateoasMode, limit, offset)

Get time-zones

Get all known time-zones

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = LocaleApi()
val hateoasMode : kotlin.Boolean = true // kotlin.Boolean | Include HATEOAS-style links in results
val limit : kotlin.Int = 56 // kotlin.Int | The maximum number of results to retrieve
val offset : kotlin.Int = 56 // kotlin.Int | The zero-ary offset index into the results
try {
    val result : TimeZonesResponse = apiInstance.getTimezonesUsingGET(hateoasMode, limit, offset)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling LocaleApi#getTimezonesUsingGET")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling LocaleApi#getTimezonesUsingGET")
    e.printStackTrace()
}
```

### Parameters
| **hateoasMode** | **kotlin.Boolean**| Include HATEOAS-style links in results | [optional] [default to true] |
| **limit** | **kotlin.Int**| The maximum number of results to retrieve | [optional] [default to 10] |
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **offset** | **kotlin.Int**| The zero-ary offset index into the results | [optional] [default to 0] |

### Return type

[**TimeZonesResponse**](TimeZonesResponse.md)

### Authorization


Configure UserSecurity:
    ApiClient.apiKey["X-RapidAPI-Key"] = ""
    ApiClient.apiKeyPrefix["X-RapidAPI-Key"] = ""

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

