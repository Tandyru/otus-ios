package com.example.otusioshw12

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform

expect fun debugLog(message: String)
