import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:panara_dialogs/src/constants/strings.dart';
import 'package:panara_dialogs/src/widgets/panara_button.dart';

///
/// A custom dialog widget that can be used to show custom content in a dialog.
/// Fully customizable.
///
class PanaraCustomDialogWidget extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final VoidCallback? onTapConfirm;
  final VoidCallback? onTapCancel;
  final PanaraDialogType? panaraDialogType;
  final Color? buttonColorYes;
  final Color? buttonTextColorYes;
  final Color? buttonColorNo;
  final Color? buttonTextColorNo;
  final Color? color;
  final String? imagePath;
  final bool noImage;
  final bool isInfo;

  const PanaraCustomDialogWidget({
    Key? key,
    required this.children,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.confirmButtonText,
    this.cancelButtonText,
    this.onTapConfirm,
    this.onTapCancel,
    this.panaraDialogType = PanaraDialogType.normal,
    this.buttonTextColorYes,
    this.buttonTextColorNo,
    this.noImage = false,
    this.imagePath,
    this.color,
    this.buttonColorYes,
    this.buttonColorNo,
    this.isInfo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

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
              ...children,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: PanaraButton(
                      onTap: onTapCancel,
                      text: confirmButtonText ?? Strings.yes,
                      bgColor: buttonTextColorYes ??
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
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    flex: 1,
                    child: PanaraButton(
                      buttonTextColor: buttonTextColorNo ?? Colors.white,
                      onTap: onTapConfirm,
                      text: cancelButtonText ?? Strings.no,
                      bgColor: panaraDialogType == PanaraDialogType.normal
                          ? PanaraColors.normal
                          : panaraDialogType == PanaraDialogType.success
                              ? PanaraColors.success
                              : panaraDialogType == PanaraDialogType.warning
                                  ? PanaraColors.warning
                                  : panaraDialogType == PanaraDialogType.error
                                      ? PanaraColors.error
                                      : color ?? const Color(0xFF179DFF),
                      isOutlined: false,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
