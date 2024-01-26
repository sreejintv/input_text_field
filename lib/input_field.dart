library input_field;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// A Calculator.
class EntryTextField extends StatefulWidget {
  const EntryTextField(
      {super.key,
      required this.fieldWidth,
      required this.title,
      this.hint,
      this.prefixIcon,
      this.errorText,
      required this.textController,
      this.inputFormatters,
      this.keyboardType,
      this.textInputAction,
      this.isPasswordField,
      this.onEditTextFocusChange,
      this.onFocusChange,
      this.normalColor,
      this.validColor,
      this.errorColor,
      this.hintColor,
      this.fontFamily});
  final double fieldWidth;
  final String title;
  final String? errorText;
  final String? hint;
  final Color? normalColor;
  final Color? validColor;
  final Color? errorColor;
  final Color? hintColor;
  final Icon? prefixIcon;
  final String? fontFamily;
  final TextEditingController textController;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? isPasswordField;
  final FieldFocusChange? onEditTextFocusChange;
  final VoidCallback? onFocusChange;
  @override
  State<EntryTextField> createState() => _EntryTextFieldState();
}

class _EntryTextFieldState extends State<EntryTextField> {
  String textValue = '';
  late bool hasFocus = false;

  final FocusNode unitCodeCtrlFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        width: widget.fieldWidth,
        child: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(unitCodeCtrlFocusNode);
          },
          child: IntrinsicHeight(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: hasFocus
                            ? widget.errorText?.isEmpty == true
                                ? const Color.fromARGB(
                                    255,
                                    19,
                                    25,
                                    221,
                                  )
                                : const Color.fromARGB(
                                    255,
                                    210,
                                    3,
                                    3,
                                  )
                            : widget.errorText?.isEmpty == true
                                ? widget.normalColor ?? const Color(0xffe2e2e2)
                                : widget.errorColor ??
                                    const Color.fromARGB(
                                      255,
                                      210,
                                      3,
                                      3,
                                    ),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Focus(
                      onFocusChange: (onFocus) {
                        widget.onFocusChange?.call();
                        setState(
                          () {
                            hasFocus = onFocus;
                          },
                        );
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: hasFocus
                                      ? widget.errorText?.isEmpty == true
                                          ? widget.validColor ??
                                              const Color.fromARGB(
                                                255,
                                                19,
                                                25,
                                                221,
                                              )
                                          : widget.errorColor ??
                                              const Color.fromARGB(
                                                255,
                                                210,
                                                3,
                                                3,
                                              )
                                      : widget.errorText?.isEmpty == true
                                          ? widget.normalColor ??
                                              const Color(0XffA1A1A1)
                                          : widget.errorColor ??
                                              const Color.fromARGB(
                                                255,
                                                210,
                                                3,
                                                3,
                                              ),
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal,
                                  fontFamily:
                                      widget.fontFamily ?? "Geometria-medium",
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: SizedBox(
                              height: 30,
                              child: TextField(
                                obscureText: widget.isPasswordField == true,
                                enableSuggestions: false,
                                autocorrect: false,
                                focusNode: unitCodeCtrlFocusNode,
                                inputFormatters: widget.inputFormatters,
                                controller: widget.textController,
                                keyboardType: widget.keyboardType,
                                textInputAction: widget.textInputAction,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    color: widget.hintColor ?? Colors.brown,
                                  ),
                                  alignLabelWithHint: false,
                                  floatingLabelAlignment:
                                      FloatingLabelAlignment.center,
                                  filled: false,
                                  isDense: false,
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 0,
                                  ),
                                  hintText: widget.hint,
                                  errorMaxLines: 1,
                                  prefixIconConstraints: const BoxConstraints(
                                    minWidth: 20,
                                    maxHeight: 10,
                                  ),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Icon(
                                      widget.prefixIcon?.icon,
                                      color: hasFocus
                                          ? widget.errorText?.isEmpty == true
                                              ? widget.validColor ??
                                                  const Color.fromARGB(
                                                    255,
                                                    19,
                                                    25,
                                                    221,
                                                  )
                                              : widget.errorColor ??
                                                  const Color.fromARGB(
                                                    255,
                                                    210,
                                                    3,
                                                    3,
                                                  )
                                          : widget.errorText?.isEmpty == true
                                              ? widget.normalColor ??
                                                  Colors.black
                                              : widget.errorColor ??
                                                  const Color.fromARGB(
                                                    255,
                                                    210,
                                                    3,
                                                    3,
                                                  ),
                                    ),
                                  ),
                                  prefixIconColor:
                                      MaterialStateColor.resolveWith(
                                    (states) => states
                                            .contains(MaterialState.focused)
                                        ? widget.errorText?.isEmpty == true
                                            ? widget.validColor ??
                                                const Color(0xff474DE3)
                                            : widget.errorColor ??
                                                const Color.fromARGB(
                                                  255,
                                                  210,
                                                  3,
                                                  3,
                                                )
                                        : widget.errorText?.isEmpty == true
                                            ? widget.normalColor ?? Colors.grey
                                            : widget.errorColor ??
                                                const Color.fromARGB(
                                                  255,
                                                  210,
                                                  3,
                                                  3,
                                                ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.errorText?.isNotEmpty == true,
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            widget.errorText.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              backgroundColor: Colors.white,
                              color: widget.errorColor ??
                                  const Color.fromARGB(255, 210, 3, 3),
                              fontSize: 10,
                              fontStyle: FontStyle.normal,
                              fontFamily:
                                  widget.fontFamily ?? "Geometria-medium",
                            ),
                          ),
                        ],
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

class FieldFocusChange {
  void onFocusChange() {
    print('onFocusChange');
  }
}
