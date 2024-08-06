<div align="center">

# Flutter InAppWebView Plugin 

![InAppWebView-logo](https://user-images.githubusercontent.com/5956938/195422744-bdcfed16-73f0-4bc9-94ab-ecf10771a1c4.png)

A Flutter plugin that allows you to add an inline webview, to use an headless webview, and to open an in-app browser window.

</div>

## Articles/Resources

- [Official documentation: inappwebview.dev/docs](https://inappwebview.dev/docs/intro)
- Read the online [API Reference](https://pub.dartlang.org/documentation/flutter_inappwebview/latest/) to get the **full API documentation**.
- [Official blog: inappwebview.dev/blog](https://inappwebview.dev/blog/)
- Find open source projects on the [Official Showcase page: inappwebview.dev/showcase](https://inappwebview.dev/showcase/)
- Check the [flutter_inappwebview_examples](https://github.com/pichillilorenzo/flutter_inappwebview_examples) repository for project examples
- Check the [flutter_inappwebview/example/integration_test/webview_flutter_test.dart](https://github.com/pichillilorenzo/flutter_inappwebview/blob/master/flutter_inappwebview/example/integration_test/webview_flutter_test.dart) file for other code examples
- [Flutter Browser App](https://github.com/pichillilorenzo/flutter_browser_app): A Full-Featured Mobile Browser App (such as the Google Chrome mobile browser) created using Flutter and the features offered by the flutter_inappwebview plugin

## Showcase - Who use it

Check the [Showcase](https://inappwebview.dev/showcase/) page to see an open list of Apps built with **Flutter** and **Flutter InAppWebView**.

#### Are you using the **Flutter InAppWebView** plugin and would you like to add your App there?

Send a submission request to the [Submit App](https://inappwebview.dev/submit-app/) page!

## Requirements

- Dart sdk: ">=2.17.0 <4.0.0"
- Flutter: ">=3.0.0"
- Android: `minSdkVersion >= 19`, `compileSdk >= 34`, [AGP](https://developer.android.com/build/releases/gradle-plugin) version `>= 7.3.0` (use [Android Studio - Android Gradle plugin Upgrade Assistant](https://developer.android.com/build/agp-upgrade-assistant) for help), support for `androidx` (see [AndroidX Migration](https://flutter.dev/docs/development/androidx-migration) to migrate an existing app)
- iOS 9.0+: `--ios-language swift`, Xcode version `>= 14.3`
- MacOS 10.11+: Xcode version `>= 14.3`

## Installation

Add `flutter_inappwebview` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

### Installation - Web support

To make it work properly on the Web platform, you need to add the `web_support.js` file inside the `<head>` of your `web/index.html` file:

```html
<head>
    <!-- ... -->
    <script type="application/javascript" src="/assets/packages/flutter_inappwebview_web/assets/web/web_support.js" defer></script>
    <!-- ... -->
</head>
```  

## Support

Did you find this plugin useful? Please consider to [make a donation](https://inappwebview.dev/donate/) to help improve it!

## Original design:

https://github.com/pichillilorenzo/flutter_inappwebview

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
