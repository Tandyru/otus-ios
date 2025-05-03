package com.example.otusioshw12

import io.ktor.client.HttpClient
import io.ktor.client.plugins.HttpSend
import io.ktor.client.plugins.logging.*
import io.ktor.client.plugins.plugin
import kotlinx.coroutines.runBlocking
import org.openapitools.client.apis.GeoApi
import org.openapitools.client.models.PopulatedPlacesResponse
//import mu.KotlinLogging

//private val logger = KotlinLogging.logger {}


class Greeting {
    private val platform: Platform = getPlatform()

    fun greet(): String = runBlocking {
        val client = HttpClient() {
            install(Logging) {
                logger = Logger.SIMPLE
                level = LogLevel.ALL
            }
            expectSuccess = false
//            install(HttpSend) {
//                intercept { request ->
//                    val modifiedRequest = request.newBuilder()
//                        .header("x-rapidapi-key", "94963b3682msh07639511c5fbd67p194a89jsncb95fadf69f6")
//                        .build()
//                    proceed(modifiedRequest)
//                }
//            }
//            install(DefaultRequestHeaders) {
//                header("x-rapidapi-key", "94963b3682msh07639511c5fbd67p194a89jsncb95fadf69f6")
//            }
        }
        /*
        client.plugin(HttpSend).intercept { request ->
            val originalCall = execute(request)
            if (originalCall.response.status.value !in 100..399) {
                execute(request)
            } else {
                originalCall
            }
        }
         */
        val geoApi = GeoApi(/*ApiClient.BASE_URL, client*/) // httpClient = ApiClient().client
        //val geoApi = GeoApi("https://wft-geo-db.p.rapidapi.com/v1", client)
        geoApi.setApiKey("94963b3682msh07639511c5fbd67p194a89jsncb95fadf69f6")
        //GeoAPIAPI.customHeaders = ["x-rapidapi-key": "94963b3682msh07639511c5fbd67p194a89jsncb95fadf69f6"]
//        (geoApi.authentications["UserSecurity"] as ApiKeyAuth).apiKey = "94963b3682msh07639511c5fbd67p194a89jsncb95fadf69f6"
        try {
            // Пример вызова метода API для поиска мест рядом с координатами (Москва)
            val response: PopulatedPlacesResponse = geoApi.findAdminDivisionsUsingGET(
                location = "+55.7558+037.6173", // Координаты цели
                radius = 100, // Радиус поиска в км
                limit = 5 // Ограничение на количество результатов
            ).body()

//            logger.debug { "!!! Found ${response.data?.size ?: 0} admin divisions near Moscow" }
//            logger.debug { "Raw response: $response" }

            // Извлечение части данных (например, количество найденных мест)
            //"Hello! Found ${response.data?.size ?: 0} places near Moscow. 2"
            "${response.data ?: 0}"
        } catch (e: Exception) {
            "Error fetching data: ${e.message}"
        }
        // geoApiInstance.
        //return "Hello, GeoApi ${platform.name}!"
    }
}