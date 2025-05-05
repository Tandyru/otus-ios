package com.example.otusioshw12

import kotlinx.coroutines.runBlocking
import org.openapitools.client.apis.GeoApi
import org.openapitools.client.models.PopulatedPlacesResponse

class Cities {
    fun cities(): Array<String> = runBlocking {
        val geoApi = GeoApi()
        geoApi.setApiKey("94963b3682msh07639511c5fbd67p194a89jsncb95fadf69f6")
        try {
            val locationId = "+55.7558+037.6173" // Moscow
            val radius = 100
            val languageCode = "ru"
            val response: PopulatedPlacesResponse = geoApi.findCitiesNearLocationUsingGET(
                locationId = locationId,
                radius = radius,
                limit = 10,
                languageCode = languageCode
            ).body()

            val names = response.data
                ?.mapNotNull { it.name }
                ?.toTypedArray()
                ?: emptyArray()

            names
        } catch (e: Exception) {
            debugLog("Error fetching data: ${e}")
            arrayOf("Error fetching data: ${e}")
        }
    }
}