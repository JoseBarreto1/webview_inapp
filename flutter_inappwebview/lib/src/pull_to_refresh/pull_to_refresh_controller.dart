import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:webview_inapp_platform_interface/webview_inapp_platform_interface.dart';

///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController}
class PullToRefreshController {
  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController}
  PullToRefreshController(
      {void Function()? onRefresh,
      @Deprecated("Use settings instead") PullToRefreshOptions? options,
      PullToRefreshSettings? settings})
      : this.fromPlatformCreationParams(
            params: PlatformPullToRefreshControllerCreationParams(
                onRefresh: onRefresh, options: options, settings: settings));

  /// Constructs a [PullToRefreshController].
  ///
  /// See [PullToRefreshController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  PullToRefreshController.fromPlatformCreationParams({
    required PlatformPullToRefreshControllerCreationParams params,
  }) : this.fromPlatform(platform: PlatformPullToRefreshController(params));

  /// Constructs a [PullToRefreshController] from a specific platform implementation.
  PullToRefreshController.fromPlatform({required this.platform});

  /// Implementation of [PlatformPullToRefreshController] for the current platform.
  final PlatformPullToRefreshController platform;

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.options}
  @Deprecated("Use settings instead")
  PullToRefreshOptions get options => platform.options;

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.settings}
  PullToRefreshSettings get settings => platform.settings;

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.onRefresh}
  void Function()? get onRefresh => platform.onRefresh;

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.setEnabled}
  Future<void> setEnabled(bool enabled) => platform.setEnabled(enabled);

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.isEnabled}
  Future<bool> isEnabled() => platform.isEnabled();

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.beginRefreshing}
  Future<void> beginRefreshing() => platform.beginRefreshing();

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.endRefreshing}
  Future<void> endRefreshing() => platform.endRefreshing();

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.isRefreshing}
  Future<bool> isRefreshing() => platform.isRefreshing();

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.setColor}
  Future<void> setColor(Color color) => platform.setColor(color);

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.setBackgroundColor}
  Future<void> setBackgroundColor(Color color) =>
      platform.setBackgroundColor(color);

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.setDistanceToTriggerSync}
  Future<void> setDistanceToTriggerSync(int distanceToTriggerSync) =>
      platform.setDistanceToTriggerSync(distanceToTriggerSync);

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.setSlingshotDistance}
  Future<void> setSlingshotDistance(int slingshotDistance) =>
      platform.setSlingshotDistance(slingshotDistance);

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.getDefaultSlingshotDistance}
  Future<int> getDefaultSlingshotDistance() =>
      platform.getDefaultSlingshotDistance();

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.setSize}
  @Deprecated("Use setIndicatorSize instead")
  Future<void> setSize(AndroidPullToRefreshSize size) => platform.setSize(size);

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.setIndicatorSize}
  Future<void> setIndicatorSize(PullToRefreshSize size) =>
      platform.setIndicatorSize(size);

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.setAttributedTitle}
  @Deprecated("Use setStyledTitle instead")
  Future<void> setAttributedTitle(IOSNSAttributedString attributedTitle) =>
      platform.setAttributedTitle(attributedTitle);

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.setStyledTitle}
  Future<void> setStyledTitle(AttributedString attributedTitle) =>
      platform.setStyledTitle(attributedTitle);

  ///{@macro webview_inapp_platform_interface.PlatformPullToRefreshController.dispose}
  void dispose({bool isKeepAlive = false}) =>
      platform.dispose(isKeepAlive: isKeepAlive);
}
