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
  }) : super(key: key);

  void _checkButtons(BuildContext context) {
    if (confirmButton != null) {
      confirmButton!.buttonText ??= Strings.yes;
      confirmButton!.callback ??= () {
        Navigator.pop(context);
      };
    }

    if (cancelButton != null) {
      cancelButton!.buttonColor ??= isInfo ? color ?? const Color(0xFF179DFF) : Colors.red.shade500;

      cancelButton!.buttonText ??= Strings.no;
      cancelButton!.callback ??= () {
        Navigator.pop(context);
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    _checkButtons(context);

    return Align(
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
                Image.asset(
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
                        text: confirmButton?.buttonText ?? Strings.yes,
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
                        text: cancelButton?.buttonText ?? Strings.no,
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
    );
  }
}
