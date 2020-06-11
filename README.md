
# My Mood Day

My Mood Day is an improving application from [Thai's mood application](https://github.com/nonproud/thaismood-android). This application offering an easy way for tracking mood for thai people with a cute emoticons.

## Screenshots

![image](https://www.img.in.th/images/4801a6f65217103d66033b88ee0a6e06.png) ![image](https://www.img.in.th/images/ae5579da5abc336a37990e8e645be8c7.png) ![image](https://www.img.in.th/images/d8c0983ce41439e1958555f61b0fe900.png)

## Requirement

* [Flutter](https://flutter.dev/)
* [Firebase](https://firebase.google.com/)
* [Android Studio](https://developer.android.com/studio)
* [VScode](https://code.visualstudio.com/) or other editor you like
* Emulator (I choose Pixel 2 XL API 28)
* Everything on [Server-side requirements](https://github.com/scenaire/mymood-server)

## Installation

Flutter is provide full native performance on both iOS and Android but I developing android application so this is an installation instructor for android dev.

1. Install Flutter, Android Studio.
2. Clone this repository on your device.
3. Clone [server-side repository](https://github.com/scenaire/mymood-server) on your device.
4. You can developing this project.

In case I already deleted my firebase project

1. Create your own firebase project
2. Add new android app to your project
3. Copy ```google-services.json``` to Folder ```android > app```  
![image](https://www.img.in.th/images/da2d09e6d08c4f171f7f8a54a13ebca7.png)  
4. You can developing this project now.

## Contacts

if you are computer science student who wanted to improving this application and you have a problem while developing, feel free to reach me via Facebook

Facebook : [Jiratchaya Yeeto](https://www.facebook.com/jiratchaya.yeeto)

## Project Tree

```├─ .gitignore
├─ .metadata
├─ android
│  ├─ .gitignore
│  ├─ .gradle
│  │  ├─ 5.6.2
│  │  │  ├─ executionHistory
│  │  │  │  ├─ executionHistory.bin
│  │  │  │  └─ executionHistory.lock
│  │  │  ├─ fileChanges
│  │  │  │  └─ last-build.bin
│  │  │  ├─ fileContent
│  │  │  │  └─ fileContent.lock
│  │  │  ├─ fileHashes
│  │  │  │  ├─ fileHashes.bin
│  │  │  │  ├─ fileHashes.lock
│  │  │  │  └─ resourceHashesCache.bin
│  │  │  ├─ gc.properties
│  │  │  ├─ javaCompile
│  │  │  │  ├─ classAnalysis.bin
│  │  │  │  ├─ jarAnalysis.bin
│  │  │  │  ├─ javaCompile.lock
│  │  │  │  └─ taskHistory.bin
│  │  │  └─ vcsMetadata-1
│  │  ├─ 6.3
│  │  │  ├─ executionHistory
│  │  │  │  └─ executionHistory.lock
│  │  │  ├─ fileChanges
│  │  │  │  └─ last-build.bin
│  │  │  ├─ fileHashes
│  │  │  │  └─ fileHashes.lock
│  │  │  ├─ gc.properties
│  │  │  └─ vcsMetadata-1
│  │  ├─ buildOutputCleanup
│  │  │  ├─ buildOutputCleanup.lock
│  │  │  ├─ cache.properties
│  │  │  └─ outputFiles.bin
│  │  ├─ checksums
│  │  │  ├─ checksums.lock
│  │  │  ├─ md5-checksums.bin
│  │  │  └─ sha1-checksums.bin
│  │  └─ vcs-1
│  │     └─ gc.properties
│  ├─ .project
│  ├─ .settings
│  │  └─ org.eclipse.buildship.core.prefs
│  ├─ app
│  │  ├─ .project
│  │  ├─ .settings
│  │  │  └─ org.eclipse.buildship.core.prefs
│  │  ├─ build.gradle
│  │  ├─ google-services.json
│  │  └─ src
│  │     ├─ debug
│  │     │  ├─ AndroidManifest.xml
│  │     │  └─ gen
│  │     │     └─ com
│  │     │        └─ scenaire
│  │     │           └─ andriod
│  │     │              └─ mymood
│  │     │                 ├─ BuildConfig.java
│  │     │                 ├─ Manifest.java
│  │     │                 └─ R.java
│  │     ├─ main
│  │     │  ├─ AndroidManifest.xml
│  │     │  ├─ gen
│  │     │  │  └─ com
│  │     │  │     └─ scenaire
│  │     │  │        └─ andriod
│  │     │  │           └─ mymood
│  │     │  │              ├─ BuildConfig.java
│  │     │  │              ├─ Manifest.java
│  │     │  │              └─ R.java
│  │     │  ├─ java
│  │     │  │  └─ io
│  │     │  │     └─ flutter
│  │     │  │        └─ plugins
│  │     │  │           └─ GeneratedPluginRegistrant.java
│  │     │  ├─ kotlin
│  │     │  │  └─ com
│  │     │  │     └─ scenaire
│  │     │  │        └─ andriod
│  │     │  │           └─ mymood
│  │     │  │              └─ MainActivity.kt
│  │     │  └─ res
│  │     │     ├─ drawable
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ mipmap-hdpi
│  │     │     │  ├─ ic_launcher.png
│  │     │     │  ├─ ic_moodicon.png
│  │     │     │  └─ ic_moodicon2.png
│  │     │     ├─ mipmap-mdpi
│  │     │     │  ├─ ic_launcher.png
│  │     │     │  ├─ ic_moodicon.png
│  │     │     │  └─ ic_moodicon2.png
│  │     │     ├─ mipmap-xhdpi
│  │     │     │  ├─ ic_launcher.png
│  │     │     │  ├─ ic_moodicon.png
│  │     │     │  └─ ic_moodicon2.png
│  │     │     ├─ mipmap-xxhdpi
│  │     │     │  ├─ ic_launcher.png
│  │     │     │  ├─ ic_moodicon.png
│  │     │     │  └─ ic_moodicon2.png
│  │     │     ├─ mipmap-xxxhdpi
│  │     │     │  ├─ ic_launcher.png
│  │     │     │  ├─ ic_moodicon.png
│  │     │     │  └─ ic_moodicon2.png
│  │     │     └─ values
│  │     │        └─ styles.xml
│  │     └─ profile
│  │        ├─ AndroidManifest.xml
│  │        └─ gen
│  │           └─ com
│  │              └─ scenaire
│  │                 └─ andriod
│  │                    └─ mymood
│  │                       ├─ BuildConfig.java
│  │                       ├─ Manifest.java
│  │                       └─ R.java
│  ├─ build.gradle
│  ├─ gradle
│  │  └─ wrapper
│  │     ├─ gradle-wrapper.jar
│  │     └─ gradle-wrapper.properties
│  ├─ gradle.properties
│  ├─ gradlew
│  ├─ gradlew.bat
│  ├─ local.properties
│  └─ settings.gradle
├─ assets
│  └─ pictures
│     ├─ cDepress.png
│     ├─ cDepress2.png
│     ├─ cHappy.png
│     ├─ cHappy2.png
│     ├─ cManiac.png
│     ├─ cManiac2.png
│     ├─ cNormal.png
│     ├─ cNormal2.png
│     ├─ cUnhappy.png
│     ├─ cUnhappy2.png
│     ├─ depress.png
│     ├─ depress1.png
│     ├─ forgotPassword.png
│     ├─ full-moon.png
│     ├─ happy.png
│     ├─ happy1.png
│     ├─ ic_moodicon.png
│     ├─ mania.png
│     ├─ mania1.png
│     ├─ normal.png
│     ├─ normal1.png
│     ├─ nursing.png
│     ├─ quiz.png
│     ├─ register.jpg
│     ├─ register2.png
│     ├─ sad.png
│     ├─ sad1.png
│     ├─ signin.png
│     ├─ signin2.png
│     ├─ sunny.png
│     ├─ support.png
│     ├─ support2.png
│     ├─ wash_hands.png
│     ├─ wear_mask.png
│     ├─ welcome.png
│     └─ welcome2.png
├─ fonts
│  ├─ Anakotmai-Bold.ttf
│  ├─ Anakotmai-Light.ttf
│  ├─ Anakotmai-Medium.ttf
│  ├─ MyMoodIcon.ttf
│  ├─ Prompt-Medium.ttf
│  ├─ Prompt-Regular.ttf
│  └─ Thonburi.ttf
├─ gen
├─ ios
│  ├─ .gitignore
│  ├─ Flutter
│  │  ├─ AppFrameworkInfo.plist
│  │  ├─ Debug.xcconfig
│  │  ├─ flutter_export_environment.sh
│  │  ├─ Generated.xcconfig
│  │  └─ Release.xcconfig
│  ├─ Runner
│  │  ├─ AppDelegate.swift
│  │  ├─ Assets.xcassets
│  │  │  ├─ AppIcon.appiconset
│  │  │  │  ├─ Contents.json
│  │  │  │  ├─ Icon-App-1024x1024@1x.png
│  │  │  │  ├─ Icon-App-20x20@1x.png
│  │  │  │  ├─ Icon-App-20x20@2x.png
│  │  │  │  ├─ Icon-App-20x20@3x.png
│  │  │  │  ├─ Icon-App-29x29@1x.png
│  │  │  │  ├─ Icon-App-29x29@2x.png
│  │  │  │  ├─ Icon-App-29x29@3x.png
│  │  │  │  ├─ Icon-App-40x40@1x.png
│  │  │  │  ├─ Icon-App-40x40@2x.png
│  │  │  │  ├─ Icon-App-40x40@3x.png
│  │  │  │  ├─ Icon-App-60x60@2x.png
│  │  │  │  ├─ Icon-App-60x60@3x.png
│  │  │  │  ├─ Icon-App-76x76@1x.png
│  │  │  │  ├─ Icon-App-76x76@2x.png
│  │  │  │  └─ Icon-App-83.5x83.5@2x.png
│  │  │  └─ LaunchImage.imageset
│  │  │     ├─ Contents.json
│  │  │     ├─ LaunchImage.png
│  │  │     ├─ LaunchImage@2x.png
│  │  │     ├─ LaunchImage@3x.png
│  │  │     └─ README.md
│  │  ├─ Base.lproj
│  │  │  ├─ LaunchScreen.storyboard
│  │  │  └─ Main.storyboard
│  │  ├─ GeneratedPluginRegistrant.h
│  │  ├─ GeneratedPluginRegistrant.m
│  │  ├─ GoogleService-Info.plist
│  │  ├─ Info.plist
│  │  └─ Runner-Bridging-Header.h
│  ├─ Runner.xcodeproj
│  │  ├─ project.pbxproj
│  │  ├─ project.xcworkspace
│  │  │  └─ contents.xcworkspacedata
│  │  └─ xcshareddata
│  │     └─ xcschemes
│  │        └─ Runner.xcscheme
│  └─ Runner.xcworkspace
│     └─ contents.xcworkspacedata
├─ lib
│  ├─ main.dart
│  ├─ Models
│  │  ├─ Activity.dart
│  │  ├─ Article.dart
│  │  ├─ Mood.dart
│  │  ├─ Quiz.dart
│  │  ├─ Sleep.dart
│  │  └─ User.dart
│  ├─ Screens
│  │  ├─ Authenticate
│  │  │  ├─ Firstpage.dart
│  │  │  ├─ forgotten.dart
│  │  │  ├─ Register.dart
│  │  │  └─ sign_in.dart
│  │  ├─ Home
│  │  │  ├─ instructions
│  │  │  │  ├─ aboutmePage.dart
│  │  │  │  ├─ instructionaboutMood.dart
│  │  │  │  ├─ instructionsBeforeQuiz.dart
│  │  │  │  └─ instructionsMain.dart
│  │  │  ├─ MyHomePage.dart
│  │  │  ├─ my_mood_icon_icons.dart
│  │  │  ├─ navpage
│  │  │  │  ├─ article
│  │  │  │  │  ├─ article.dart
│  │  │  │  │  └─ eachArticle.dart
│  │  │  │  ├─ homepage
│  │  │  │  │  ├─ eachMoodDetail.dart
│  │  │  │  │  └─ homescreen.dart
│  │  │  │  ├─ moodpage
│  │  │  │  │  ├─ moodAddons.dart
│  │  │  │  │  └─ moodHome.dart
│  │  │  │  ├─ others
│  │  │  │  │  ├─ hotline.dart
│  │  │  │  │  └─ searchClinic.dart
│  │  │  │  ├─ sleeppage
│  │  │  │  │  ├─ addSleep.dart
│  │  │  │  │  ├─ sleep.dart
│  │  │  │  │  ├─ sleepHistory.dart
│  │  │  │  │  └─ sleepSummary.dart
│  │  │  │  └─ summary
│  │  │  │     ├─ summary.dart
│  │  │  │     ├─ summaryGraphs.dart
│  │  │  │     └─ summaryYear.dart
│  │  │  └─ quizpage
│  │  │     ├─ EightQPage.dart
│  │  │     ├─ MDQPage.dart
│  │  │     ├─ MDQTWOPage.dart
│  │  │     ├─ NineQPage.dart
│  │  │     ├─ ResultPage.dart
│  │  │     └─ TwoQPage.dart
│  │  └─ Wrapper.dart
│  ├─ Services
│  │  ├─ ArticleCloudFirestore.dart
│  │  ├─ Auth.dart
│  │  ├─ CheckMental.dart
│  │  ├─ EvaluateMoodChart.dart
│  │  ├─ MoodCloudFirestore.dart
│  │  ├─ QuizCloudFirestore.dart
│  │  ├─ SleepCloudFireStore.dart
│  │  ├─ thCalendar.dart
│  │  └─ UserCloudFirestore.dart
│  └─ Widgets
│     ├─ loadingPage.dart
│     ├─ loadingPageTwo.dart
│     └─ SuicideDialog.dart
├─ pubspec.lock
└─ pubspec.yaml
```
