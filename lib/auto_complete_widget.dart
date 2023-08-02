import 'dart:async';

import 'package:auto_complete/theme.dart';
import 'package:flutter/material.dart';

import 'base_auto_complete_model.dart';

class AutoCompleteWithBaseModel extends StatefulWidget {
  final bool isMobile;
  final String label;
  final List<BaseAutoComplete> lsData;
  final bool enable;
  final Function(BaseAutoComplete?) onSelected;
  final void Function(String)? onSubmit;
  final void Function() clearCallback;
  final InputDecoration? inputDecoration;
  final TextStyle? textStyle;
  final TextEditingValue initialValue;

  AutoCompleteWithBaseModel({
    Key? key,
    required this.isMobile,
    required this.label,
    required this.lsData,
    this.enable = true,
    required this.onSelected,
    this.onSubmit,
    required this.clearCallback,
    this.inputDecoration,
    this.textStyle,
    this.initialValue = const TextEditingValue(),
  }) : super(key: UniqueKey());

  @override
  State<AutoCompleteWithBaseModel> createState() =>
      _AutoCompleteWithBaseModelState();
}

class _AutoCompleteWithBaseModelState extends State<AutoCompleteWithBaseModel> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) {
        return Autocomplete<BaseAutoComplete>(
          initialValue: widget.initialValue,
          optionsBuilder: (pattern) async {
            if (pattern.text.isEmpty) {
              widget.clearCallback();
            }

            List<BaseAutoComplete> result = widget.lsData
                .where(
                  (element) => element.getName().toUpperCase().contains(
                        pattern.text.toUpperCase(),
                      ),
                )
                .toList();
            if (pattern.text == 'ALL') {
              result = widget.lsData;
            }

            if (result.isEmpty) {
              return [BaseAutoComplete()];
            }

            return result;
          },
          displayStringForOption: (pattern) => pattern.getName(),
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted,
          ) {
            // textEditingController.text = controller.text;
            return TextFormField(
              style: widget.textStyle ?? body12.copyWith(fontSize: 16),
              controller: textEditingController,
              enabled: widget.enable,
              focusNode: fieldFocusNode,
              onFieldSubmitted: widget.onSubmit,
              decoration: widget.inputDecoration ??
                  InputDecoration(
                    labelStyle: bodyStyle.copyWith(
                      fontSize: 16,
                    ),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: primary),
                    ),
                    errorStyle: bodyStyle.copyWith(
                      color: Colors.red,
                      fontSize: 10,
                    ),
                    labelText: widget.label,
                    focusColor: Colors.transparent,
                    suffixIcon: (textEditingController.text.isNotEmpty ||
                                textEditingController.text != 'ALL') &&
                            widget.enable
                        ? IconButton(
                            onPressed: () {
                              textEditingController.clear();
                              widget.clearCallback();
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null,
                  ),
            );
          },
          optionsViewBuilder: (
            BuildContext context,
            AutocompleteOnSelected<BaseAutoComplete> onSelected,
            Iterable<BaseAutoComplete> options,
          ) {
            if (options.length == 1) {
              try {
                List.from(options)[0].getName();
              } on UnimplementedError catch (_) {
                options = [];
              }
            }
            return Align(
              alignment: Alignment.topLeft,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: constraint.maxWidth,
                  maxHeight: 200,
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Card(
                  elevation: 5,
                  child: options.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final option = options.elementAt(index);
                            return InkWell(
                              hoverColor: Theme.of(context).primaryColor.withOpacity(0.3),
                              onTap: () {
                                onSelected(option);
                              },
                              child: ListTile(
                                dense: true,
                                title: Text(
                                  option.getName(),
                                  style: body12.copyWith(
                                    fontSize: 14,
                                    color: option.getColor(),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                              ),
                            );
                          },
                        )
                      : ListTile(
                          dense: true,
                          title: Text(
                            'No Items Data',
                            style: body12.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                        ),
                ),
              ),
            );
          },
          onSelected: (object) {
            FocusScope.of(context).requestFocus(FocusNode());

            widget.onSelected(object);
          },
        );
      },
    );
  }
}

Widget listAutoCompleteLocation<T>(
  bool isMobile,
  String label,
  TextEditingController controller, {
  bool enable = true,
  FocusNode? focusNode,
  required FutureOr<Iterable<Object>> Function(TextEditingValue) optionsBuilder,
  required String Function(dynamic) displayStringForOption,
  required Widget Function(T) itemWidget,
  required Function(dynamic)? onSelected,
  final void Function(String)? onSubmit,
  final Function(String? value)? onSaved,
  final TextStyle? textStyle,
  void Function()? suffixCallback,
  final InputDecoration? inputDecoration,
  final Function({
    required FocusNode fieldFocusNode,
    required TextEditingController textEditingController,
  })? onFieldViewBuilder,
}) {
  return LayoutBuilder(builder: (_, constraint) {
    return Autocomplete(
      optionsBuilder: optionsBuilder,
      displayStringForOption: displayStringForOption,
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController textEditingController,
        FocusNode fieldFocusNode,
        VoidCallback onFieldSubmitted,
      ) {
        if (onFieldViewBuilder != null) {
          onFieldViewBuilder(
            fieldFocusNode: fieldFocusNode,
            textEditingController: textEditingController,
          );
          textEditingController.text = textEditingController.text;
        } else {
          textEditingController.text = controller.text;
        }

        return TextFormField(
          style: textStyle ??
              body12.copyWith(color: const Color(0xff8F90A6), fontSize: 14),
          controller: textEditingController,
          enabled: enable,
          decoration: inputDecoration,
          focusNode: fieldFocusNode,
          onFieldSubmitted: onSubmit,
          onSaved: onSaved,
        );
      },
      optionsViewBuilder: (
        BuildContext context,
        AutocompleteOnSelected onSelected,
        Iterable options,
      ) {
        return Align(
          alignment: Alignment.topLeft,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            constraints: BoxConstraints(
              maxWidth: constraint.maxWidth,
              maxHeight: 200,
            ),
            child: Card(
              elevation: 5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final option = options.elementAt(index);
                  return InkWell(
                    hoverColor: primary.shade300,
                    onTap: () {
                      onSelected(option);
                    },
                    child: itemWidget(option),
                  );
                },
              ),
            ),
          ),
        );
      },
      onSelected: onSelected,
    );
  });
}
