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


import kotlinx.serialization.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

/**
 * Minimal country info
 *
 * @param code The ISO-3166 country code
 * @param currencyCodes A list of supported ISO-4217 currency codes
 * @param name The country name (varies by languageCode)
 * @param wikiDataId The country WikiData id
 */
@Serializable

data class CountrySummary (

    /* The ISO-3166 country code */
    @SerialName(value = "code") val code: kotlin.String? = null,

    /* A list of supported ISO-4217 currency codes */
    @SerialName(value = "currencyCodes") val currencyCodes: kotlin.collections.List<kotlin.String>? = null,

    /* The country name (varies by languageCode) */
    @SerialName(value = "name") val name: kotlin.String? = null,

    /* The country WikiData id */
    @SerialName(value = "wikiDataId") val wikiDataId: kotlin.String? = null

) {


}

