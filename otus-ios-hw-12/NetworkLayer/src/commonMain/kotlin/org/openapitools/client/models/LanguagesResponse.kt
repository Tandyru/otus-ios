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

import org.openapitools.client.models.Error
import org.openapitools.client.models.LanguageDescriptor
import org.openapitools.client.models.Link
import org.openapitools.client.models.Metadata

import kotlinx.serialization.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

/**
 * A list of languages supported by the system
 *
 * @param errors 
 * @param links 
 * @param metadata 
 * @param `data` 
 */
@Serializable

data class LanguagesResponse (

    @SerialName(value = "errors") val errors: kotlin.collections.List<Error>? = null,

    @SerialName(value = "links") val links: kotlin.collections.List<Link>? = null,

    @SerialName(value = "metadata") val metadata: Metadata? = null,

    @SerialName(value = "data") val `data`: kotlin.collections.List<LanguageDescriptor>? = null

) {


}

