import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:panara_dialogs/src/constants/extensions.dart';
import 'package:panara_dialogs/src/widgets/panara_button.dart';

///
/// A custom dialog widget that can be used to show custom content in a dialog.
/// Fully customizable.
///
class PanaraCustomDialogWidget extends StatefulWidget {
  final Widget content;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final ButtonData? confirmButton;
  final ButtonData? cancelButton;
  final VoidCallback? onDismiss;
  final PanaraDialogType? panaraDialogType;
  final Color? color;
  final String? imagePath;
  final bool noImage;
  final bool isInfo;
  final IconData? icon;
  final bool barrierDismissable;

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
    this.barrierDismissable = true,
    this.onDismiss,
  }) : super(key: key);

  @override
  State<PanaraCustomDialogWidget> createState() => _PanaraCustomDialogWidgetState();
}

class _PanaraCustomDialogWidgetState extends State<PanaraCustomDialogWidget> {
  late ThemeData theme;

  void _checkButtons(BuildContext context) {
    if (widget.confirmButton != null) {
      widget.confirmButton!.buttonText ??= Strings.sim;
      var confirmFunction = widget.confirmButton!.callback;
      widget.confirmButton!.callback = () {
        Navigator.pop(context);

        if (confirmFunction != null) {
          confirmFunction();
        }
      };
    }

    if (widget.cancelButton != null) {
      widget.cancelButton!.buttonColor ??= widget.isInfo ? widget.color ?? const Color(0xFF179DFF) : Colors.red.shade500;

      widget.cancelButton!.buttonText ??= Strings.nao;
      var cancelFunction = widget.cancelButton!.callback;
      widget.cancelButton!.callback = () {
        Navigator.pop(context);

        if (cancelFunction != null) {
          cancelFunction();
        }
      };
    }

    if (widget.confirmButton != null && widget.cancelButton != null) {
      if (widget.confirmButton!.buttonText != null) {
        var text = widget.confirmButton!.buttonText!;

        widget.confirmButton!.buttonText = text.passToTitle();
      }

      if (widget.cancelButton!.buttonText != null) {
        var text = widget.cancelButton!.buttonText!;

        widget.cancelButton!.buttonText = text.passToTitle();
      }
    }
  }

  @override
  void initState() {
    _checkButtons(context);
    theme = Theme.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.barrierDismissable,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop && widget.onDismiss != null) {
          widget.onDismiss!();
        }
      },
      child: Padding(
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
              margin: widget.margin ?? const EdgeInsets.all(24),
              padding: widget.padding ?? const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: widget.backgroundColor ?? theme.dialogBackgroundColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.center,
                crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.center,
                children: [
                  if (!widget.noImage)
                    widget.icon != null
                        ? Icon(
                            widget.icon,
                            size: 84,
                            color: widget.imagePath != null
                                ? null
                                : (widget.panaraDialogType == PanaraDialogType.normal
                                    ? PanaraColors.normal
                                    : widget.panaraDialogType == PanaraDialogType.success
                                        ? PanaraColors.success
                                        : widget.panaraDialogType == PanaraDialogType.warning
                                            ? PanaraColors.warning
                                            : widget.panaraDialogType == PanaraDialogType.error
                                                ? PanaraColors.error
                                                : widget.color),
                          )
                        : Image.asset(
                            widget.imagePath ?? 'assets/${widget.isInfo ? 'info' : 'confirm'}.png',
                            package: widget.imagePath != null ? null : 'panara_dialogs',
                            width: 84,
                            height: 84,
                            color: widget.imagePath != null
                                ? null
                                : (widget.panaraDialogType == PanaraDialogType.normal
                                    ? PanaraColors.normal
                                    : widget.panaraDialogType == PanaraDialogType.success
                                        ? PanaraColors.success
                                        : widget.panaraDialogType == PanaraDialogType.warning
                                            ? PanaraColors.warning
                                            : widget.panaraDialogType == PanaraDialogType.error
                                                ? PanaraColors.error
                                                : widget.color),
                          ),
                  if (!widget.noImage)
                    const SizedBox(
                      height: 24,
                    ),
                  widget.content,
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: []
                      ..insertIf(
                        widget.confirmButton != null,
                        0,
                        Expanded(
                          flex: 1,
                          child: PanaraButton(
                            onTap: widget.confirmButton?.callback,
                            text: widget.confirmButton?.buttonText ?? Strings.sim,
                            bgColor: widget.confirmButton?.buttonColor ??
                                (widget.panaraDialogType == PanaraDialogType.normal
                                    ? PanaraColors.normal
                                    : widget.panaraDialogType == PanaraDialogType.success
                                        ? PanaraColors.success
                                        : widget.panaraDialogType == PanaraDialogType.warning
                                            ? PanaraColors.warning
                                            : widget.panaraDialogType == PanaraDialogType.error
                                                ? PanaraColors.error
                                                : widget.color ?? const Color(0xFF179DFF)),
                            isOutlined: true,
                          ),
                        ),
                      )
                      ..insertIf(
                        (widget.confirmButton != null && widget.cancelButton != null),
                        1,
                        const SizedBox(
                          width: 24,
                        ),
                      )
                      ..insertIf(
                        widget.cancelButton != null,
                        2,
                        Expanded(
                          flex: 1,
                          child: PanaraButton(
                            onTap: widget.cancelButton?.callback,
                            text: widget.cancelButton?.buttonText ?? Strings.nao,
                            bgColor: widget.cancelButton?.buttonColor ?? const Color(0xFF179DFF),
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
      ),
    );
  }
}
