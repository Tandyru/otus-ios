package com.example.otusioshw12

import io.ktor.client.HttpClient
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.plugins.logging.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.coroutines.runBlocking
import kotlinx.serialization.json.Json
import org.openapitools.client.apis.GeoApi
import org.openapitools.client.models.PopulatedPlacesResponse
import io.ktor.client.plugins.*
import io.ktor.client.request.*
import io.ktor.http.*
import io.ktor.util.*

class Greeting {
    private val platform: Platform = getPlatform()

    fun greet(): String = runBlocking {
        val client = HttpClient() {
            install(Logging) {
                logger = Logger.SIMPLE
                level = LogLevel.ALL
            }
            install(ContentNegotiation) {
                json( Json {
                    ignoreUnknownKeys = true
                    prettyPrint = true
                    isLenient = true
                })
            }
            expectSuccess = false
        }
        val geoApi = GeoApi(/*ApiClient.BASE_URL, client*/) // httpClient = ApiClient().client
        //val geoApi = GeoApi("https://wft-geo-db.p.rapidapi.com/v1", client)
        geoApi.setApiKey("94963b3682msh07639511c5fbd67p194a89jsncb95fadf69f6")
        debugLog("GeoApi created")
        try {
            val response: PopulatedPlacesResponse = geoApi.findAdminDivisionsUsingGET(
                location = "+55.7558+037.6173",
                radius = 100, // км
                limit = 5
            ).body()

//            logger.debug { "!!! Found ${response.data?.size ?: 0} admin divisions near Moscow" }
//            logger.debug { "Raw response: $response" }

            //"Hello! Found ${response.data?.size ?: 0} places near Moscow. 2"
            "${response.data ?: 0}"
        } catch (e: Exception) {
//            "Error fetching data: ${e}"
            "Error fetching data: ${e}"
        }
    }
}
