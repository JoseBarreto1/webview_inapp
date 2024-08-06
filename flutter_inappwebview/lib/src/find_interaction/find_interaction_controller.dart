import 'package:webview_inapp_platform_interface/webview_inapp_platform_interface.dart';

///{@macro webview_inapp_platform_interface.PlatformFindInteractionController}
class FindInteractionController {
  ///{@macro webview_inapp_platform_interface.PlatformFindInteractionController}
  FindInteractionController(
      {void Function(PlatformFindInteractionController controller,
              int activeMatchOrdinal, int numberOfMatches, bool isDoneCounting)?
          onFindResultReceived})
      : this.fromPlatformCreationParams(
            params: PlatformFindInteractionControllerCreationParams(
                onFindResultReceived: onFindResultReceived));

  /// Constructs a [FindInteractionController].
  ///
  /// See [FindInteractionController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  FindInteractionController.fromPlatformCreationParams({
    required PlatformFindInteractionControllerCreationParams params,
  }) : this.fromPlatform(platform: PlatformFindInteractionController(params));

  /// Constructs a [FindInteractionController] from a specific platform implementation.
  FindInteractionController.fromPlatform({required this.platform});

  /// Implementation of [PlatformFindInteractionController] for the current platform.
  final PlatformFindInteractionController platform;

  ///{@macro webview_inapp_platform_interface.PlatformFindInteractionController.onFindResultReceived}
  void Function(PlatformFindInteractionController controller,
          int activeMatchOrdinal, int numberOfMatches, bool isDoneCounting)?
      get onFindResultReceived => platform.onFindResultReceived;

  ///{@macro webview_inapp_platform_interface.PlatformFindInteractionController.findAll}
  Future<void> findAll({String? find}) => platform.findAll(find: find);

  ///{@macro webview_inapp_platform_interface.PlatformFindInteractionController.findNext}
  Future<void> findNext({bool forward = true}) =>
      platform.findNext(forward: forward);

  ///{@macro webview_inapp_platform_interface.PlatformFindInteractionController.clearMatches}
  Future<void> clearMatches() => platform.clearMatches();

  ///{@macro webview_inapp_platform_interface.PlatformFindInteractionController.setSearchText}
  Future<void> setSearchText(String? searchText) =>
      platform.setSearchText(searchText);

  ///{@macro webview_inapp_platform_interface.PlatformFindInteractionController.getSearchText}
  Future<String?> getSearchText() => platform.getSearchText();

  ///{@macro webview_inapp_platform_interface.PlatformFindInteractionController.isFindNavigatorVisible}
  Future<bool?> isFindNavigatorVisible() => platform.isFindNavigatorVisible();

  ///{@macro webview_inapp_platform_interface.PlatformFindInteractionController.updateResultCount}
  Future<void> updateResultCount() => platform.updateResultCount();

  ///{@macro webview_inapp_platform_interface.PlatformFindInteractionController.presentFindNavigator}
  Future<void> presentFindNavigator() => platform.presentFindNavigator();

  ///{@macro webview_inapp_platform_interface.PlatformFindInteractionController.dismissFindNavigator}
  Future<void> dismissFindNavigator() => platform.dismissFindNavigator();

  ///{@macro webview_inapp_platform_interface.PlatformFindInteractionController.getActiveFindSession}
  Future<FindSession?> getActiveFindSession() =>
      platform.getActiveFindSession();

  ///{@macro webview_inapp_platform_interface.PlatformFindInteractionController.dispose}
  void dispose({bool isKeepAlive = false}) => platform.dispose();
}
