import 'dart:core';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:webview_inapp_platform_interface/webview_inapp_platform_interface.dart';

import '../web_message/main.dart';
import '../web_storage/web_storage.dart';
import 'android/in_app_webview_controller.dart';
import 'apple/in_app_webview_controller.dart';

import '../print_job/main.dart';

///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController}
class InAppWebViewController {
  ///Use [InAppWebViewController] instead.
  @Deprecated("Use InAppWebViewController instead")
  late AndroidInAppWebViewController android;

  ///Use [InAppWebViewController] instead.
  @Deprecated("Use InAppWebViewController instead")
  late IOSInAppWebViewController ios;

  /// Constructs a [InAppWebViewController].
  ///
  /// See [InAppWebViewController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  InAppWebViewController.fromPlatformCreationParams({
    required PlatformInAppWebViewControllerCreationParams params,
  }) : this.fromPlatform(platform: PlatformInAppWebViewController(params));

  /// Constructs a [InAppWebViewController] from a specific platform implementation.
  InAppWebViewController.fromPlatform({required this.platform}) {
    android = AndroidInAppWebViewController(controller: this.platform);
    ios = IOSInAppWebViewController(controller: this.platform);
  }

  /// Implementation of [PlatformInAppWebViewController] for the current platform.
  final PlatformInAppWebViewController platform;

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.webStorage}
  WebStorage get webStorage =>
      WebStorage.fromPlatform(platform: platform.webStorage);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getUrl}
  Future<WebUri?> getUrl() => platform.getUrl();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getTitle}
  Future<String?> getTitle() => platform.getTitle();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getProgress}
  Future<int?> getProgress() => platform.getProgress();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getHtml}
  Future<String?> getHtml() => platform.getHtml();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getFavicons}
  Future<List<Favicon>> getFavicons() => platform.getFavicons();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.loadUrl}
  Future<void> loadUrl(
          {required URLRequest urlRequest,
          @Deprecated('Use allowingReadAccessTo instead')
          Uri? iosAllowingReadAccessTo,
          WebUri? allowingReadAccessTo}) =>
      platform.loadUrl(
          urlRequest: urlRequest,
          iosAllowingReadAccessTo: iosAllowingReadAccessTo,
          allowingReadAccessTo: allowingReadAccessTo);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.postUrl}
  Future<void> postUrl({required WebUri url, required Uint8List postData}) =>
      platform.postUrl(url: url, postData: postData);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.loadData}
  Future<void> loadData(
          {required String data,
          String mimeType = "text/html",
          String encoding = "utf8",
          WebUri? baseUrl,
          @Deprecated('Use historyUrl instead') Uri? androidHistoryUrl,
          WebUri? historyUrl,
          @Deprecated('Use allowingReadAccessTo instead')
          Uri? iosAllowingReadAccessTo,
          WebUri? allowingReadAccessTo}) =>
      platform.loadData(
          data: data,
          mimeType: mimeType,
          encoding: encoding,
          baseUrl: baseUrl,
          androidHistoryUrl: androidHistoryUrl,
          historyUrl: historyUrl,
          iosAllowingReadAccessTo: iosAllowingReadAccessTo,
          allowingReadAccessTo: allowingReadAccessTo);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.loadFile}
  Future<void> loadFile({required String assetFilePath}) =>
      platform.loadFile(assetFilePath: assetFilePath);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.reload}
  Future<void> reload() => platform.reload();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.goBack}
  Future<void> goBack() => platform.goBack();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.canGoBack}
  Future<bool> canGoBack() => platform.canGoBack();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.goForward}
  Future<void> goForward() => platform.goForward();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.canGoForward}
  Future<bool> canGoForward() => platform.canGoForward();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.goBackOrForward}
  Future<void> goBackOrForward({required int steps}) =>
      platform.goBackOrForward(steps: steps);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.canGoBackOrForward}
  Future<bool> canGoBackOrForward({required int steps}) =>
      platform.canGoBackOrForward(steps: steps);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.goTo}
  Future<void> goTo({required WebHistoryItem historyItem}) =>
      platform.goTo(historyItem: historyItem);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.isLoading}
  Future<bool> isLoading() => platform.isLoading();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.stopLoading}
  Future<void> stopLoading() => platform.stopLoading();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.evaluateJavascript}
  Future<dynamic> evaluateJavascript(
          {required String source, ContentWorld? contentWorld}) =>
      platform.evaluateJavascript(source: source, contentWorld: contentWorld);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.injectJavascriptFileFromUrl}
  Future<void> injectJavascriptFileFromUrl(
          {required WebUri urlFile,
          ScriptHtmlTagAttributes? scriptHtmlTagAttributes}) =>
      platform.injectJavascriptFileFromUrl(
          urlFile: urlFile, scriptHtmlTagAttributes: scriptHtmlTagAttributes);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.injectJavascriptFileFromAsset}
  Future<dynamic> injectJavascriptFileFromAsset(
          {required String assetFilePath}) =>
      platform.injectJavascriptFileFromAsset(assetFilePath: assetFilePath);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.injectCSSCode}
  Future<void> injectCSSCode({required String source}) =>
      platform.injectCSSCode(source: source);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.injectCSSFileFromUrl}
  Future<void> injectCSSFileFromUrl(
          {required WebUri urlFile,
          CSSLinkHtmlTagAttributes? cssLinkHtmlTagAttributes}) =>
      platform.injectCSSFileFromUrl(
          urlFile: urlFile, cssLinkHtmlTagAttributes: cssLinkHtmlTagAttributes);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.injectCSSFileFromAsset}
  Future<void> injectCSSFileFromAsset({required String assetFilePath}) =>
      platform.injectCSSFileFromAsset(assetFilePath: assetFilePath);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.addJavaScriptHandler}
  void addJavaScriptHandler(
          {required String handlerName,
          required JavaScriptHandlerCallback callback}) =>
      platform.addJavaScriptHandler(
          handlerName: handlerName, callback: callback);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.removeJavaScriptHandler}
  JavaScriptHandlerCallback? removeJavaScriptHandler(
          {required String handlerName}) =>
      platform.removeJavaScriptHandler(handlerName: handlerName);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.hasJavaScriptHandler}
  bool hasJavaScriptHandler({required String handlerName}) =>
      platform.hasJavaScriptHandler(handlerName: handlerName);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.takeScreenshot}
  Future<Uint8List?> takeScreenshot(
          {ScreenshotConfiguration? screenshotConfiguration}) =>
      platform.takeScreenshot(screenshotConfiguration: screenshotConfiguration);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.setOptions}
  @Deprecated('Use setSettings instead')
  Future<void> setOptions({required InAppWebViewGroupOptions options}) =>
      platform.setOptions(options: options);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getOptions}
  @Deprecated('Use getSettings instead')
  Future<InAppWebViewGroupOptions?> getOptions() => platform.getOptions();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.setSettings}
  Future<void> setSettings({required InAppWebViewSettings settings}) =>
      platform.setSettings(settings: settings);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getSettings}
  Future<InAppWebViewSettings?> getSettings() => platform.getSettings();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getCopyBackForwardList}
  Future<WebHistory?> getCopyBackForwardList() =>
      platform.getCopyBackForwardList();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.clearCache}
  @Deprecated("Use InAppWebViewController.clearAllCache instead")
  Future<void> clearCache() => platform.clearCache();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.findAllAsync}
  @Deprecated("Use FindInteractionController.findAll instead")
  Future<void> findAllAsync({required String find}) =>
      platform.findAllAsync(find: find);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.findNext}
  @Deprecated("Use FindInteractionController.findNext instead")
  Future<void> findNext({required bool forward}) =>
      platform.findNext(forward: forward);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.clearMatches}
  @Deprecated("Use FindInteractionController.clearMatches instead")
  Future<void> clearMatches() => platform.clearMatches();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getTRexRunnerHtml}
  @Deprecated("Use tRexRunnerHtml instead")
  Future<String> getTRexRunnerHtml() => platform.getTRexRunnerHtml();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getTRexRunnerCss}
  @Deprecated("Use tRexRunnerCss instead")
  Future<String> getTRexRunnerCss() => platform.getTRexRunnerCss();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.scrollTo}
  Future<void> scrollTo(
          {required int x, required int y, bool animated = false}) =>
      platform.scrollTo(x: x, y: y, animated: animated);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.scrollBy}
  Future<void> scrollBy(
          {required int x, required int y, bool animated = false}) =>
      platform.scrollBy(x: x, y: y, animated: animated);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.pauseTimers}
  Future<void> pauseTimers() => platform.pauseTimers();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.resumeTimers}
  Future<void> resumeTimers() => platform.resumeTimers();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.printCurrentPage}
  Future<PrintJobController?> printCurrentPage(
      {PrintJobSettings? settings}) async {
    final printJobControllerPlatform =
        await platform.printCurrentPage(settings: settings);
    if (printJobControllerPlatform == null) {
      return null;
    }
    return PrintJobController.fromPlatform(
        platform: printJobControllerPlatform);
  }

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getContentHeight}
  Future<int?> getContentHeight() => platform.getContentHeight();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getContentWidth}
  Future<int?> getContentWidth() => platform.getContentWidth();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.zoomBy}
  Future<void> zoomBy(
          {required double zoomFactor,
          @Deprecated('Use animated instead') bool? iosAnimated,
          bool animated = false}) =>
      platform.zoomBy(
          zoomFactor: zoomFactor, iosAnimated: iosAnimated, animated: animated);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getOriginalUrl}
  Future<WebUri?> getOriginalUrl() => platform.getOriginalUrl();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getZoomScale}
  Future<double?> getZoomScale() => platform.getZoomScale();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getScale}
  @Deprecated('Use getZoomScale instead')
  Future<double?> getScale() => platform.getScale();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getSelectedText}
  Future<String?> getSelectedText() => platform.getSelectedText();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getHitTestResult}
  Future<InAppWebViewHitTestResult?> getHitTestResult() =>
      platform.getHitTestResult();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.clearFocus}
  Future<void> clearFocus() => platform.clearFocus();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.setContextMenu}
  Future<void> setContextMenu(ContextMenu? contextMenu) =>
      platform.setContextMenu(contextMenu);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.requestFocusNodeHref}
  Future<RequestFocusNodeHrefResult?> requestFocusNodeHref() =>
      platform.requestFocusNodeHref();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.requestImageRef}
  Future<RequestImageRefResult?> requestImageRef() =>
      platform.requestImageRef();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getMetaTags}
  Future<List<MetaTag>> getMetaTags() => platform.getMetaTags();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getMetaThemeColor}
  Future<Color?> getMetaThemeColor() => platform.getMetaThemeColor();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getScrollX}
  Future<int?> getScrollX() => platform.getScrollX();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getScrollY}
  Future<int?> getScrollY() => platform.getScrollY();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getCertificate}
  Future<SslCertificate?> getCertificate() => platform.getCertificate();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.addUserScript}
  Future<void> addUserScript({required UserScript userScript}) =>
      platform.addUserScript(userScript: userScript);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.addUserScripts}
  Future<void> addUserScripts({required List<UserScript> userScripts}) =>
      platform.addUserScripts(userScripts: userScripts);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.removeUserScript}
  Future<bool> removeUserScript({required UserScript userScript}) =>
      platform.removeUserScript(userScript: userScript);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.removeUserScriptsByGroupName}
  Future<void> removeUserScriptsByGroupName({required String groupName}) =>
      platform.removeUserScriptsByGroupName(groupName: groupName);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.removeUserScripts}
  Future<void> removeUserScripts({required List<UserScript> userScripts}) =>
      platform.removeUserScripts(userScripts: userScripts);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.removeAllUserScripts}
  Future<void> removeAllUserScripts() => platform.removeAllUserScripts();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.hasUserScript}
  bool hasUserScript({required UserScript userScript}) =>
      platform.hasUserScript(userScript: userScript);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.callAsyncJavaScript}
  Future<CallAsyncJavaScriptResult?> callAsyncJavaScript(
          {required String functionBody,
          Map<String, dynamic> arguments = const <String, dynamic>{},
          ContentWorld? contentWorld}) =>
      platform.callAsyncJavaScript(
          functionBody: functionBody,
          arguments: arguments,
          contentWorld: contentWorld);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.saveWebArchive}
  Future<String?> saveWebArchive(
          {required String filePath, bool autoname = false}) =>
      platform.saveWebArchive(filePath: filePath, autoname: autoname);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.isSecureContext}
  Future<bool> isSecureContext() => platform.isSecureContext();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.createWebMessageChannel}
  Future<WebMessageChannel?> createWebMessageChannel() async {
    final webMessagePlatform = await platform.createWebMessageChannel();
    if (webMessagePlatform == null) {
      return null;
    }
    return WebMessageChannel.fromPlatform(platform: webMessagePlatform);
  }

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.postWebMessage}
  Future<void> postWebMessage(
          {required WebMessage message, WebUri? targetOrigin}) =>
      platform.postWebMessage(message: message, targetOrigin: targetOrigin);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.addWebMessageListener}
  Future<void> addWebMessageListener(WebMessageListener webMessageListener) =>
      platform.addWebMessageListener(webMessageListener.platform);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.hasWebMessageListener}
  bool hasWebMessageListener(WebMessageListener webMessageListener) =>
      platform.hasWebMessageListener(webMessageListener.platform);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.canScrollVertically}
  Future<bool> canScrollVertically() => platform.canScrollVertically();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.canScrollHorizontally}
  Future<bool> canScrollHorizontally() => platform.canScrollHorizontally();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.startSafeBrowsing}
  Future<bool> startSafeBrowsing() => platform.startSafeBrowsing();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.clearSslPreferences}
  Future<void> clearSslPreferences() => platform.clearSslPreferences();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.pause}
  Future<void> pause() => platform.pause();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.resume}
  Future<void> resume() => platform.resume();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.pageDown}
  Future<bool> pageDown({required bool bottom}) =>
      platform.pageDown(bottom: bottom);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.pageUp}
  Future<bool> pageUp({required bool top}) => platform.pageUp(top: top);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.zoomIn}
  Future<bool> zoomIn() => platform.zoomIn();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.zoomOut}
  Future<bool> zoomOut() => platform.zoomOut();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.clearHistory}
  Future<void> clearHistory() => platform.clearHistory();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.reloadFromOrigin}
  Future<void> reloadFromOrigin() => platform.reloadFromOrigin();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.createPdf}
  Future<Uint8List?> createPdf(
          {@Deprecated("Use pdfConfiguration instead")
          // ignore: deprecated_member_use_from_same_package
          IOSWKPDFConfiguration? iosWKPdfConfiguration,
          PDFConfiguration? pdfConfiguration}) =>
      platform.createPdf(
          iosWKPdfConfiguration: iosWKPdfConfiguration,
          pdfConfiguration: pdfConfiguration);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.createWebArchiveData}
  Future<Uint8List?> createWebArchiveData() => platform.createWebArchiveData();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.hasOnlySecureContent}
  Future<bool> hasOnlySecureContent() => platform.hasOnlySecureContent();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.pauseAllMediaPlayback}
  Future<void> pauseAllMediaPlayback() => platform.pauseAllMediaPlayback();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.setAllMediaPlaybackSuspended}
  Future<void> setAllMediaPlaybackSuspended({required bool suspended}) =>
      platform.setAllMediaPlaybackSuspended(suspended: suspended);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.closeAllMediaPresentations}
  Future<void> closeAllMediaPresentations() =>
      platform.closeAllMediaPresentations();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.requestMediaPlaybackState}
  Future<MediaPlaybackState?> requestMediaPlaybackState() =>
      platform.requestMediaPlaybackState();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.isInFullscreen}
  Future<bool> isInFullscreen() => platform.isInFullscreen();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.clearFormData}
  Future<void> clearFormData() => platform.clearFormData();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getCameraCaptureState}
  Future<MediaCaptureState?> getCameraCaptureState() =>
      platform.getCameraCaptureState();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.setCameraCaptureState}
  Future<void> setCameraCaptureState({required MediaCaptureState state}) =>
      platform.setCameraCaptureState(state: state);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getMicrophoneCaptureState}
  Future<MediaCaptureState?> getMicrophoneCaptureState() =>
      platform.getMicrophoneCaptureState();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.setMicrophoneCaptureState}
  Future<void> setMicrophoneCaptureState({required MediaCaptureState state}) =>
      platform.setMicrophoneCaptureState(state: state);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.loadSimulatedRequest}
  Future<void> loadSimulatedRequest(
          {required URLRequest urlRequest,
          required Uint8List data,
          URLResponse? urlResponse}) =>
      platform.loadSimulatedRequest(urlRequest: urlRequest, data: data);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.openDevTools}
  Future<void> openDevTools() => platform.openDevTools();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.callDevToolsProtocolMethod}
  Future<dynamic> callDevToolsProtocolMethod(
          {required String methodName, Map<String, dynamic>? parameters}) =>
      platform.callDevToolsProtocolMethod(
          methodName: methodName, parameters: parameters);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.addDevToolsProtocolEventListener}
  Future<void> addDevToolsProtocolEventListener(
          {required String eventName,
          required Function(dynamic data) callback}) =>
      platform.addDevToolsProtocolEventListener(
          eventName: eventName, callback: callback);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.removeDevToolsProtocolEventListener}
  Future<void> removeDevToolsProtocolEventListener(
          {required String eventName}) =>
      platform.removeDevToolsProtocolEventListener(eventName: eventName);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getIFrameId}
  Future<String?> getIFrameId() => platform.getIFrameId();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getDefaultUserAgent}
  static Future<String> getDefaultUserAgent() =>
      PlatformInAppWebViewController.static().getDefaultUserAgent();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.clearClientCertPreferences}
  static Future<void> clearClientCertPreferences() =>
      PlatformInAppWebViewController.static().clearClientCertPreferences();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getSafeBrowsingPrivacyPolicyUrl}
  static Future<WebUri?> getSafeBrowsingPrivacyPolicyUrl() =>
      PlatformInAppWebViewController.static().getSafeBrowsingPrivacyPolicyUrl();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.setSafeBrowsingWhitelist}
  @Deprecated("Use setSafeBrowsingAllowlist instead")
  static Future<bool> setSafeBrowsingWhitelist({required List<String> hosts}) =>
      PlatformInAppWebViewController.static()
          .setSafeBrowsingWhitelist(hosts: hosts);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.setSafeBrowsingAllowlist}
  static Future<bool> setSafeBrowsingAllowlist({required List<String> hosts}) =>
      PlatformInAppWebViewController.static()
          .setSafeBrowsingAllowlist(hosts: hosts);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getCurrentWebViewPackage}
  static Future<WebViewPackageInfo?> getCurrentWebViewPackage() =>
      PlatformInAppWebViewController.static().getCurrentWebViewPackage();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.setWebContentsDebuggingEnabled}
  static Future<void> setWebContentsDebuggingEnabled(bool debuggingEnabled) =>
      PlatformInAppWebViewController.static()
          .setWebContentsDebuggingEnabled(debuggingEnabled);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getVariationsHeader}
  static Future<String?> getVariationsHeader() =>
      PlatformInAppWebViewController.static().getVariationsHeader();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.isMultiProcessEnabled}
  static Future<bool> isMultiProcessEnabled() =>
      PlatformInAppWebViewController.static().isMultiProcessEnabled();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.disableWebView}
  static Future<void> disableWebView() =>
      PlatformInAppWebViewController.static().disableWebView();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.handlesURLScheme}
  static Future<bool> handlesURLScheme(String urlScheme) =>
      PlatformInAppWebViewController.static().handlesURLScheme(urlScheme);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.disposeKeepAlive}
  static Future<void> disposeKeepAlive(InAppWebViewKeepAlive keepAlive) =>
      PlatformInAppWebViewController.static().disposeKeepAlive(keepAlive);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.clearAllCache}
  static Future<void> clearAllCache({bool includeDiskFiles = true}) =>
      PlatformInAppWebViewController.static()
          .clearAllCache(includeDiskFiles: includeDiskFiles);

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.tRexRunnerHtml}
  static Future<String> get tRexRunnerHtml =>
      PlatformInAppWebViewController.static().tRexRunnerHtml;

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.tRexRunnerCss}
  static Future<String> get tRexRunnerCss =>
      PlatformInAppWebViewController.static().tRexRunnerCss;

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.getViewId}
  dynamic getViewId() => platform.getViewId();

  ///{@macro webview_inapp_platform_interface.PlatformInAppWebViewController.dispose}
  void dispose({bool isKeepAlive = false}) =>
      platform.dispose(isKeepAlive: isKeepAlive);
}
