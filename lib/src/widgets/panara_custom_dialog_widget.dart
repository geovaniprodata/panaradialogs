import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:panara_dialogs/src/constants/extensions.dart';
import 'package:panara_dialogs/src/widgets/panara_button.dart';

///
/// A custom dialog widget that can be used to show custom content in a dialog.
/// Fully customizable.
///
class PanaraCustomDialogWidget extends StatelessWidget {
  final Widget content;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final ButtonData? confirmButton;
  final ButtonData? cancelButton;
  final PanaraDialogType? panaraDialogType;
  final Color? color;
  final String? imagePath;
  final bool noImage;
  final bool isInfo;
  final IconData? icon;

  const PanaraCustomDialogWidget({
    Key? key,
    required this.content,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.panaraDialogType = PanaraDialogType.normal,
    this.noImage = false,
    this.imagePath,
    this.color,
    this.isInfo = false,
    this.cancelButton,
    this.confirmButton,
    this.icon,
  }) : super(key: key);

  void _checkButtons(BuildContext context) {
    if (confirmButton != null) {
      confirmButton!.buttonText ??= Strings.sim;
      var confirmFunction = confirmButton!.callback;
      confirmButton!.callback = () {
        if (confirmFunction != null) {
          confirmFunction();
        }

        Navigator.pop(context);
      };
    }

    if (cancelButton != null) {
      cancelButton!.buttonColor ??= isInfo ? color ?? const Color(0xFF179DFF) : Colors.red.shade500;

      cancelButton!.buttonText ??= Strings.nao;
      var cancelFunction = cancelButton!.callback;
      cancelButton!.callback = () {
        if (cancelFunction != null) {
          cancelFunction();
        }

        Navigator.pop(context);
      };
    }

    if (confirmButton != null && cancelButton != null) {
      if (confirmButton!.buttonText != null) {
        var text = confirmButton!.buttonText!;

        confirmButton!.buttonText = text.passToTitle();
      }

      if (cancelButton!.buttonText != null) {
        var text = cancelButton!.buttonText!;

        cancelButton!.buttonText = text.passToTitle();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    _checkButtons(context);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 340,
            ),
            margin: margin ?? const EdgeInsets.all(24),
            padding: padding ?? const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: backgroundColor ?? theme.dialogBackgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
              children: [
                if (!noImage)
                  icon != null
                      ? Icon(
                          icon,
                          size: 84,
                          color: imagePath != null
                              ? null
                              : (panaraDialogType == PanaraDialogType.normal
                                  ? PanaraColors.normal
                                  : panaraDialogType == PanaraDialogType.success
                                      ? PanaraColors.success
                                      : panaraDialogType == PanaraDialogType.warning
                                          ? PanaraColors.warning
                                          : panaraDialogType == PanaraDialogType.error
                                              ? PanaraColors.error
                                              : color),
                        )
                      : Image.asset(
                          imagePath ?? 'assets/${isInfo ? 'info' : 'confirm'}.png',
                          package: imagePath != null ? null : 'panara_dialogs',
                          width: 84,
                          height: 84,
                          color: imagePath != null
                              ? null
                              : (panaraDialogType == PanaraDialogType.normal
                                  ? PanaraColors.normal
                                  : panaraDialogType == PanaraDialogType.success
                                      ? PanaraColors.success
                                      : panaraDialogType == PanaraDialogType.warning
                                          ? PanaraColors.warning
                                          : panaraDialogType == PanaraDialogType.error
                                              ? PanaraColors.error
                                              : color),
                        ),
                if (!noImage)
                  const SizedBox(
                    height: 24,
                  ),
                content,
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: []
                    ..insertIf(
                      confirmButton != null,
                      0,
                      Expanded(
                        flex: 1,
                        child: PanaraButton(
                          onTap: confirmButton?.callback,
                          text: confirmButton?.buttonText ?? Strings.sim,
                          bgColor: confirmButton?.buttonColor ??
                              (panaraDialogType == PanaraDialogType.normal
                                  ? PanaraColors.normal
                                  : panaraDialogType == PanaraDialogType.success
                                      ? PanaraColors.success
                                      : panaraDialogType == PanaraDialogType.warning
                                          ? PanaraColors.warning
                                          : panaraDialogType == PanaraDialogType.error
                                              ? PanaraColors.error
                                              : color ?? const Color(0xFF179DFF)),
                          isOutlined: true,
                        ),
                      ),
                    )
                    ..insertIf(
                      (confirmButton != null && cancelButton != null),
                      1,
                      const SizedBox(
                        width: 24,
                      ),
                    )
                    ..insertIf(
                      cancelButton != null,
                      2,
                      Expanded(
                        flex: 1,
                        child: PanaraButton(
                          onTap: cancelButton?.callback,
                          text: cancelButton?.buttonText ?? Strings.nao,
                          bgColor: cancelButton?.buttonColor ?? const Color(0xFF179DFF),
                          isOutlined: false,
                        ),
                      ),
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
