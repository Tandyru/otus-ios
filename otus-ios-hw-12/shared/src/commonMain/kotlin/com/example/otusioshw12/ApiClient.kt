package com.example.otusioshw12
/*
import io.ktor.client.HttpClient
import io.ktor.client.HttpClientConfig
import io.ktor.client.engine.HttpClientEngine
import io.ktor.client.plugins.logging.*

class ApiClient(
    httpClientEngine: HttpClientEngine? = null,
    httpClientConfig: ((HttpClientConfig<*>) -> Unit)? = null,
) {
    val client: HttpClient = HttpClient(httpClientEngine) {
        install(Logging) {
            logger = Logger.SIMPLE // Или Logger.SIMPLE для общего логгера
            level = LogLevel.ALL     // Логировать все этапы запроса
        }

        // Примените пользовательскую конфигурацию
        httpClientConfig?.invoke(this)

        // Другие настройки (ContentNegotiation, Auth и т.д.)
    }
}*/