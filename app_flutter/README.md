# app_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# flutter_native_splash

flutter_native_splash.yaml 수정 후  
flutter pub run flutter_native_splash:create 실행

# flutter_staggered_grid_view

Enable AndriodX를 위해 gradle.properties 파일 수정  
org.gradle.jvmargs=-Xmx1536M  
android.enableR8=true  
android.useAndroidX=true  
android.enableJetifier=true

# http접근을 허용

1. AndroidManifest.xml의 application에 android:usesCleartextTraffic="true"를 추가해주면 된다.  
   <application
           android:label="app_flutter"
           android:name="${applicationName}"
           android:usesCleartextTraffic="true"
           android:icon="@mipmap/ic_launcher">

2. flutter run --web-hostname=localhost --web-port=3000  
   1- Go to flutter\bin\cache and remove a file named: flutter_tools.stamp  
   2- Go to flutter\packages\flutter_tools\lib\src\web and open the file chrome.dart.  
   3- Find '--disable-extensions'  
   4- Add '--disable-web-security'
