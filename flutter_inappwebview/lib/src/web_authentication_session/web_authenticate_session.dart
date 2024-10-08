import 'dart:async';

import 'package:webview_inapp_platform_interface/webview_inapp_platform_interface.dart';

///{@macro webview_inapp_platform_interface.PlatformWebAuthenticationSession}
class WebAuthenticationSession {
  ///{@macro webview_inapp_platform_interface.PlatformWebAuthenticationSession}
  WebAuthenticationSession()
      : this.fromPlatformCreationParams(
            params: PlatformWebAuthenticationSessionCreationParams());

  /// Constructs a [WebAuthenticationSession].
  ///
  /// See [WebAuthenticationSession.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  WebAuthenticationSession.fromPlatformCreationParams({
    required PlatformWebAuthenticationSessionCreationParams params,
  }) : this.fromPlatform(platform: PlatformWebAuthenticationSession(params));

  /// Constructs a [WebAuthenticationSession] from a specific platform implementation.
  WebAuthenticationSession.fromPlatform({required this.platform});

  /// Implementation of [PlatformWebAuthenticationSession] for the current platform.
  final PlatformWebAuthenticationSession platform;

  ///{@macro webview_inapp_platform_interface.PlatformWebAuthenticationSession.id}
  String get id => platform.id;

  ///{@macro webview_inapp_platform_interface.PlatformWebAuthenticationSession.url}
  WebUri get url => platform.url;

  ///{@macro webview_inapp_platform_interface.PlatformWebAuthenticationSession.callbackURLScheme}
  String? get callbackURLScheme => platform.callbackURLScheme;

  ///{@macro webview_inapp_platform_interface.PlatformWebAuthenticationSession.initialSettings}
  WebAuthenticationSessionSettings? get initialSettings =>
      platform.initialSettings;

  ///{@macro webview_inapp_platform_interface.PlatformWebAuthenticationSession.onComplete}
  WebAuthenticationSessionCompletionHandler get onComplete =>
      platform.onComplete;

  ///{@macro webview_inapp_platform_interface.PlatformWebAuthenticationSession.create}
  static Future<WebAuthenticationSession> create(
      {required WebUri url,
      String? callbackURLScheme,
      WebAuthenticationSessionCompletionHandler onComplete,
      WebAuthenticationSessionSettings? initialSettings}) async {
    return WebAuthenticationSession.fromPlatform(
        platform: await PlatformWebAuthenticationSession.static().create(
            url: url,
            callbackURLScheme: callbackURLScheme,
            onComplete: onComplete,
            initialSettings: initialSettings));
  }

  ///{@macro webview_inapp_platform_interface.PlatformWebAuthenticationSession.canStart}
  Future<bool> canStart() => platform.canStart();

  ///{@macro webview_inapp_platform_interface.PlatformWebAuthenticationSession.start}
  Future<bool> start() => platform.start();

  ///{@macro webview_inapp_platform_interface.PlatformWebAuthenticationSession.cancel}
  Future<void> cancel() => platform.cancel();

  ///{@macro webview_inapp_platform_interface.PlatformWebAuthenticationSession.dispose}
  Future<void> dispose() => platform.dispose();

  ///{@macro webview_inapp_platform_interface.PlatformWebAuthenticationSession.isAvailable}
  static Future<bool> isAvailable() =>
      PlatformWebAuthenticationSession.static().isAvailable();
}
