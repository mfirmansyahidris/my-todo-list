import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../ui/ui.dart';

extension ContextExtensions on BuildContext {
  bool isMobile() {
    final shortestSide = MediaQuery.of(this).size.shortestSide;
    return shortestSide < 600;
  }

  void logs(dynamic message) {
    if (kDebugMode) {
      debugPrint(
        "========================================================================================",
      );
      debugPrint("| Message Log : $message");
      debugPrint("| Widget Name : $widget");
      debugPrint(
        "========================================================================================",
      );
    }
  }

  Future<dynamic> goTo(String routeName, {Object? args}) =>
      Navigator.pushNamed(this, routeName, arguments: args);

  Future<dynamic> goToReplace(String routeName, {Object? args}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: args);

  Future<dynamic> goToClearStack(String routeName, {Object? args}) =>
      Navigator.pushNamedAndRemoveUntil(
        this,
        routeName,
        (Route<dynamic> route) => false,
        arguments: args,
      );

  void back() => Navigator.pop(this);

  double widthInPercent(double percent) {
    final toDouble = percent / 100;
    return MediaQuery.of(this).size.width * toDouble;
  }

  double heightInPercent(double percent) {
    final toDouble = percent / 100;
    return MediaQuery.of(this).size.height * toDouble;
  }

  // PreferredSize noAppBarPrimary() => PreferredSize(
  //       preferredSize: const Size.fromHeight(0.0),
  //       child: AppBar(
  //         backgroundColor: Colors.transparent,
  //         elevation: 0.0,
  //         systemOverlayStyle: const SystemUiOverlayStyle(
  //           statusBarColor: Colors.transparent,
  //           statusBarIconBrightness: Brightness.dark,
  //           statusBarBrightness: Brightness.light,
  //         ),
  //       ),
  //     );
  //
  // PreferredSize noAppBarDark() => PreferredSize(
  //       preferredSize: const Size.fromHeight(0.0),
  //       child: AppBar(
  //         backgroundColor: Colors.transparent,
  //         elevation: 0.0,
  //         systemOverlayStyle: const SystemUiOverlayStyle(
  //           statusBarColor: Colors.transparent,
  //           statusBarIconBrightness: Brightness.dark,
  //           statusBarBrightness: Brightness.light,
  //         ),
  //       ),
  //     );
  //
  // PreferredSize noAppBarLight() => PreferredSize(
  //       preferredSize: const Size.fromHeight(0.0),
  //       child: AppBar(
  //         backgroundColor: Colors.transparent,
  //         elevation: 0.0,
  //         systemOverlayStyle: const SystemUiOverlayStyle(
  //           statusBarColor: Colors.transparent,
  //           statusBarIconBrightness: Brightness.light,
  //           statusBarBrightness: Brightness.dark,
  //         ),
  //       ),
  //     );
  //

  //
  // // Handle dialog
  Future<void> dialog({
    required Widget child,
    String? title,
    List<Widget>? actions
  }) async {
    await showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title != null ? Text(
              title,
              style: TextStyles.h5
          ) : null,
          content: child,
          contentPadding: EdgeInsets.symmetric(
            horizontal: Dimens.space30,
            vertical: Dimens.space24,
          ),
          actions: <Widget>[
            if(actions != null || (actions ?? []).isNotEmpty) Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions ?? [],
            )
          ],
        );
      },
    );
  }

  //Start Loading Dialog
  static late BuildContext ctx;

  void dismiss() {
    try {
      Navigator.pop(ctx);
    } catch (_) {}
  }

  Future<void> dialogConfirm(
      {required String title,
      required String message,
      Color? color,
      VoidCallback? onActionYes,
      VoidCallback? onActionNo}) async {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyles.h5
          ),
          content: Text(
            message,
            style: TextStyles.body1,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: Dimens.space30,
            vertical: Dimens.space24,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onActionYes?.call();
                  },
                  child: Text(
                    Strings.get.yes,
                    style: TextStyles.body1.copyWith(
                      color: color ?? Palette.primary,
                    ),
                  ),
                ),
                const SpacerH(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onActionNo?.call();
                  },
                  child: Text(
                    Strings.get.cancel,
                    style: TextStyles.body1
                        .copyWith(color: color ?? Palette.primary),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
  //
  // Future bottomSheet(
  //         {required String title,
  //         required List<Widget> children,
  //         bool isDismissible = true,
  //         bool centerTitle = false}) =>
  //     showModalBottomSheet(
  //       context: this,
  //       enableDrag: true,
  //       isDismissible: isDismissible,
  //       isScrollControlled: true,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(Dimens.space30),
  //           topRight: Radius.circular(Dimens.space30),
  //         ),
  //       ),
  //       backgroundColor: Colors.white,
  //       elevation: Dimens.space16,
  //       builder: (context) {
  //         return AnimatedPadding(
  //           padding: EdgeInsets.only(
  //             left: Dimens.space16,
  //             right: Dimens.space16,
  //             top: Dimens.space16,
  //             bottom: MediaQuery.of(context).viewInsets.bottom,
  //           ),
  //           duration: const Duration(milliseconds: 300),
  //           child: Wrap(
  //             children: [
  //               Align(
  //                 alignment: Alignment.topCenter,
  //                 child: Container(
  //                   width: Dimens.bottomBar,
  //                   height: Dimens.space8,
  //                   margin: EdgeInsets.only(bottom: Dimens.space24),
  //                   decoration: const BoxDecoration(
  //                     color: Palette.disable,
  //                     borderRadius: BorderRadius.all(Radius.circular(30)),
  //                   ),
  //                 ),
  //               ),
  //               Align(
  //                 alignment:
  //                     centerTitle ? Alignment.center : Alignment.centerLeft,
  //                 child: Text(
  //                   title,
  //                   style: TextStyles.h6.copyWith(fontWeight: FontWeight.w500),
  //                   textAlign: centerTitle ? TextAlign.center : TextAlign.left,
  //                 ),
  //               ),
  //               SpacerV(value: Dimens.space16),
  //               const Divider(
  //                 height: 0,
  //               ),
  //               Container(
  //                 constraints: BoxConstraints(maxHeight: heightInPercent(80)),
  //                 child: SingleChildScrollView(
  //                   physics: const BouncingScrollPhysics(),
  //                   child: Column(
  //                     children: [
  //                       SpacerV(value: Dimens.space16),
  //                       for (final child in children) child,
  //                       SpacerV(value: Dimens.space16),
  //                     ],
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         );
  //       },
  //     );
}
