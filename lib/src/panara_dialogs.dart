import 'package:flutter/material.dart';
import 'package:panara_dialogs/src/animations.dart';
import 'package:panara_dialogs/src/constants/panara_dialog_type.dart';
import 'package:panara_dialogs/src/widgets/panara_confirm_dialog_widget.dart';
import 'package:panara_dialogs/src/widgets/panara_info_dialog_widget.dart';

///
/// This is the Info dialog with 4 different varients as follows:
/// 1. Sucess (Green color)
/// 2. Normal (Blue color)
/// 3. Warning (Orange color)
/// 4. Error (Red color)
/// 5. Custom (you can add your own color)
///
/// Also this dialog comes with 6 different animations:
/// 1. showAnimatedFromLeft
/// 2. showAnimatedFromRight
/// 3. showAnimatedFromTop
/// 4. showAnimatedFromBottom
/// 5. showAnimatedGrow
/// 6. showAnimatedShrink
///
/// Checkout online documentation for more information or example at https://pub.dev
///
class PanaraInfoDialog {
  ///
  /// This is PanaraInfoDialog without animation.
  ///
  /// for more information visit https://pub.dev
  ///
  static show(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => PanaraInfoDialogWidget(
          title: title,
          message: message,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          imagePath: imagePath,
        ),
      );

  ///
  /// This will show the PanaraInfoDialog with slide animation from left.
  ///
  /// for more information visit https://pub.dev
  ///
  static showAnimatedFromLeft(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return Animations.fromLeft(animation, secondaryAnimation, child);
        },
        pageBuilder: (animation, secondaryAnimation, child) =>
            PanaraInfoDialogWidget(
          title: title,
          message: message,
          imagePath: imagePath,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
        ),
      );

  ///
  /// This will show the PanaraInfoDialog with slide animation from right.
  ///
  /// for more information visit https://pub.dev
  ///
  static showAnimatedFromRight(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return Animations.fromRight(animation, secondaryAnimation, child);
        },
        pageBuilder: (animation, secondaryAnimation, child) =>
            PanaraInfoDialogWidget(
          title: title,
          message: message,
          imagePath: imagePath,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
        ),
      );

  ///
  /// This will show the PanaraInfoDialog with slide animation from top.
  ///
  /// for more information visit https://pub.dev
  ///
  static showAnimatedFromTop(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return Animations.fromTop(animation, secondaryAnimation, child);
        },
        pageBuilder: (animation, secondaryAnimation, child) =>
            PanaraInfoDialogWidget(
          title: title,
          message: message,
          imagePath: imagePath,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
        ),
      );

  ///
  /// This will show the PanaraInfoDialog with slide animation from bottom.
  ///
  /// for more information visit https://pub.dev
  ///
  static showAnimatedFromBottom(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return Animations.fromBottom(animation, secondaryAnimation, child);
        },
        pageBuilder: (animation, secondaryAnimation, child) =>
            PanaraInfoDialogWidget(
          title: title,
          message: message,
          imagePath: imagePath,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
        ),
      );

  ///
  /// This will show the PanaraInfoDialog with grow animation from center.
  ///
  /// for more information visit https://pub.dev
  ///
  static showAnimatedGrow(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return Animations.grow(animation, secondaryAnimation, child);
        },
        pageBuilder: (animation, secondaryAnimation, child) =>
            PanaraInfoDialogWidget(
          title: title,
          message: message,
          imagePath: imagePath,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
        ),
      );

  ///
  /// This will show the PanaraInfoDialog with shrink animation from center.
  ///
  /// for more information visit https://pub.dev
  ///
  static showAnimatedShrink(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return Animations.shrink(animation, secondaryAnimation, child);
        },
        pageBuilder: (animation, secondaryAnimation, child) =>
            PanaraInfoDialogWidget(
          title: title,
          message: message,
          imagePath: imagePath,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
        ),
      );
}

///
/// This is the Confirmation dialog with 4 different varients as follows:
/// 1. Sucess (Green color)
/// 2. Normal (Blue color)
/// 3. Warning (Orange color)
/// 4. Error (Red color)
/// 5. Custom (you can add your own color)
///
/// Also this dialog comes with 6 different animations:
/// 1. showAnimatedFromLeft
/// 2. showAnimatedFromRight
/// 3. showAnimatedFromTop
/// 4. showAnimatedFromBottom
/// 5. showAnimatedGrow
/// 6. showAnimatedShrink
///
/// Checkout online documentation for more information or example at https://pub.dev
///
class PanaraConfirmDialog {
  ///
  /// This is PanaraConfirmDialog without animation.
  ///
  /// for more information visit https://pub.dev
  ///
  static show(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => PanaraConfirmDialogWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          imagePath: imagePath,
        ),
      );

  ///
  /// This will show the PanaraConfirmDialog with slide animation from left.
  ///
  /// for more information visit https://pub.dev
  ///
  static showAnimatedFromLeft(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return Animations.fromLeft(animation, secondaryAnimation, child);
        },
        pageBuilder: (animation, secondaryAnimation, child) =>
            PanaraConfirmDialogWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          imagePath: imagePath,
        ),
      );

  ///
  /// This will show the PanaraConfirmDialog with slide animation from right.
  ///
  /// for more information visit https://pub.dev
  ///
  static showAnimatedFromRight(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return Animations.fromRight(animation, secondaryAnimation, child);
        },
        pageBuilder: (animation, secondaryAnimation, child) =>
            PanaraConfirmDialogWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          imagePath: imagePath,
        ),
      );

  ///
  /// This will show the PanaraConfirmDialog with slide animation from top.
  ///
  /// for more information visit https://pub.dev
  ///
  static showAnimatedFromTop(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return Animations.fromTop(animation, secondaryAnimation, child);
        },
        pageBuilder: (animation, secondaryAnimation, child) =>
            PanaraConfirmDialogWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          imagePath: imagePath,
        ),
      );

  ///
  /// This will show the PanaraConfirmDialog with slide animation from bottom.
  ///
  /// for more information visit https://pub.dev
  ///
  static showAnimatedFromBottom(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return Animations.fromBottom(animation, secondaryAnimation, child);
        },
        pageBuilder: (animation, secondaryAnimation, child) =>
            PanaraConfirmDialogWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          imagePath: imagePath,
        ),
      );

  ///
  /// This will show the PanaraConfirmDialog with grow animation from center.
  ///
  /// for more information visit https://pub.dev
  ///
  static showAnimatedGrow(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return Animations.grow(animation, secondaryAnimation, child);
        },
        pageBuilder: (animation, secondaryAnimation, child) =>
            PanaraConfirmDialogWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          imagePath: imagePath,
        ),
      );

  ///
  /// This will show the PanaraConfirmDialog with shrink animation from center.
  ///
  /// for more information visit https://pub.dev
  ///
  static showAnimatedShrink(
    BuildContext context, {
    required String title,
    required String message,
    String? imagePath,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
    required PanaraDialogType panaraDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return Animations.shrink(animation, secondaryAnimation, child);
        },
        pageBuilder: (animation, secondaryAnimation, child) =>
            PanaraConfirmDialogWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
          panaraDialogType: panaraDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          imagePath: imagePath,
        ),
      );
}
