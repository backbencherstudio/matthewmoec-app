# Google ML Kit
-keep class com.google.mlkit.** { *; }
-dontwarn com.google.mlkit.**
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }

# Flutter internals
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.embedding.** { *; }

# Firebase (optional)
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**