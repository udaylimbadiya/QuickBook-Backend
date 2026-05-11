plugins {

    id("com.android.application")

    id("org.jetbrains.kotlin.android")

    id("dev.flutter.flutter-gradle-plugin")

}

android {

    namespace = "com.example.quickbook"

    compileSdk = 36

    ndkVersion = flutter.ndkVersion

    defaultConfig {

        applicationId = "com.example.quickbook"

        minSdk = flutter.minSdkVersion

        targetSdk = 36

        versionCode = flutter.versionCode

        versionName = flutter.versionName
    }

    buildTypes {

        release {

            signingConfig =
                signingConfigs.getByName(
                    "debug"
                )
        }
    }

    compileOptions {

        sourceCompatibility =
            JavaVersion.VERSION_17

        targetCompatibility =
            JavaVersion.VERSION_17

        isCoreLibraryDesugaringEnabled = true
    }
    kotlin {

    compilerOptions {

        jvmTarget.set(
            org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
        )
    }
}
}

flutter {

    source = "../.."
}
dependencies {

    coreLibraryDesugaring(
        "com.android.tools:desugar_jdk_libs:2.1.5"
    )
}
