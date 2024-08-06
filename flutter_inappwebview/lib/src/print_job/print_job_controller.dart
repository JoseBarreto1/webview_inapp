import 'package:webview_inapp_platform_interface/webview_inapp_platform_interface.dart';

///{@macro webview_inapp_platform_interface.PlatformPrintJobController}
class PrintJobController {
  ///{@macro webview_inapp_platform_interface.PlatformPrintJobController}
  PrintJobController({required String id, PrintJobCompletionHandler onComplete})
      : this.fromPlatformCreationParams(
            params: PlatformPrintJobControllerCreationParams(
                id: id, onComplete: onComplete));

  /// Constructs a [PrintJobController].
  ///
  /// See [PrintJobController.fromPlatformCreationParams] for setting parameters for
  /// a specific platform.
  PrintJobController.fromPlatformCreationParams({
    required PlatformPrintJobControllerCreationParams params,
  }) : this.fromPlatform(platform: PlatformPrintJobController(params));

  /// Constructs a [PrintJobController] from a specific platform implementation.
  PrintJobController.fromPlatform({required this.platform});

  /// Implementation of [PlatformPrintJobController] for the current platform.
  final PlatformPrintJobController platform;

  ///{@macro webview_inapp_platform_interface.PlatformPrintJobController.id}
  String get id => platform.id;

  ///{@macro webview_inapp_platform_interface.PlatformPrintJobController.onComplete}
  PrintJobCompletionHandler? get onComplete => platform.onComplete;

  void set onComplete(PrintJobCompletionHandler? handler) {
    platform.onComplete = handler;
  }

  ///{@macro webview_inapp_platform_interface.PlatformPrintJobController.cancel}
  Future<void> cancel() => platform.cancel();

  ///{@macro webview_inapp_platform_interface.PlatformPrintJobController.restart}
  Future<void> restart() => platform.restart();

  ///{@macro webview_inapp_platform_interface.PlatformPrintJobController.dismiss}
  Future<void> dismiss({bool animated = true}) =>
      platform.dismiss(animated: animated);

  ///{@macro webview_inapp_platform_interface.PlatformPrintJobController.getInfo}
  Future<PrintJobInfo?> getInfo() => platform.getInfo();

  ///{@macro webview_inapp_platform_interface.PlatformPrintJobController.dispose}
  void dispose() => platform.dispose();
}
