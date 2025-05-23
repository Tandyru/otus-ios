/**
 *
 * Please note:
 * This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * Do not edit this file manually.
 *
 */

@file:Suppress(
    "ArrayInDataClass",
    "EnumEntryName",
    "RemoveRedundantQualifierName",
    "UnusedImport"
)

package org.openapitools.client.models

import org.openapitools.client.models.PopulatedPlaceType

import kotlinx.serialization.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

/**
 * Minimal populated-place info
 *
 * @param city The city name (legacy)
 * @param country The country name (varies by languageCode)
 * @param countryCode The ISO-3166 country code
 * @param distance Included if this is the result of a distance query
 * @param id The place GeoDB native id
 * @param latitude The place latittude (-90.0 to 90.0)
 * @param longitude The place longitude (-180.0 to 180.0)
 * @param name The place name (varies by languageCode)
 * @param population The place population
 * @param region The region name (varies by languageCode)
 * @param regionCode The ISO or FIPS region code
 * @param regionWdId The region Wikidata id
 * @param type 
 * @param wikiDataId The place WikiData id
 */
@Serializable

data class PopulatedPlaceSummary (

    /* The city name (legacy) */
    @SerialName(value = "city") val city: kotlin.String? = null,

    /* The country name (varies by languageCode) */
    @SerialName(value = "country") val country: kotlin.String? = null,

    /* The ISO-3166 country code */
    @SerialName(value = "countryCode") val countryCode: kotlin.String? = null,

    /* Included if this is the result of a distance query */
    @SerialName(value = "distance") val distance: kotlin.Double? = null,

    /* The place GeoDB native id */
    @SerialName(value = "id") val id: kotlin.Int? = null,

    /* The place latittude (-90.0 to 90.0) */
    @SerialName(value = "latitude") val latitude: kotlin.Double? = null,

    /* The place longitude (-180.0 to 180.0) */
    @SerialName(value = "longitude") val longitude: kotlin.Double? = null,

    /* The place name (varies by languageCode) */
    @SerialName(value = "name") val name: kotlin.String? = null,

    /* The place population */
    @SerialName(value = "population") val population: kotlin.Int? = null,

    /* The region name (varies by languageCode) */
    @SerialName(value = "region") val region: kotlin.String? = null,

    /* The ISO or FIPS region code */
    @SerialName(value = "regionCode") val regionCode: kotlin.String? = null,

    /* The region Wikidata id */
    @SerialName(value = "regionWdId") val regionWdId: kotlin.String? = null,

    @SerialName(value = "type") val type: PopulatedPlaceType? = null,

    /* The place WikiData id */
    @SerialName(value = "wikiDataId") val wikiDataId: kotlin.String? = null

) {


}

