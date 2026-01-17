import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import '../util/multi_select_list_type.dart';
import '../chip_display/multi_select_chip_display.dart';
import '../util/multi_select_item.dart';
import 'multi_select_bottom_sheet.dart';

class MultiSelectBottomSheetField<V> extends FormField<List<V>> {
  final BoxDecoration? decoration;
  final Text? buttonText;
  final Icon? buttonIcon;
  final List<MultiSelectItem<V>> items;
  final List<V> initialValue;
  final Widget? title;
  final void Function(List<V>)? onSelectionChanged;
  final void Function(List<V>) onConfirm;
  final bool searchable;
  final Text? confirmText;
  final Text? cancelText;
  final MultiSelectListType? listType;
  final Color? selectedColor;
  final String? searchHint;
  final double? initialChildSize;
  final double? minChildSize;
  final double? maxChildSize;
  final ShapeBorder? shape;
  final Color? barrierColor;
  final MultiSelectChipDisplay<V>? chipDisplay;
  final Color Function(V)? colorator;
  final Color? backgroundColor;
  final Color? unselectedColor;
  final Icon? searchIcon;
  final Icon? closeSearchIcon;
  final TextStyle? itemsTextStyle;
  final TextStyle? selectedItemsTextStyle;
  final bool separateSelectedItems;
  final TextStyle? searchTextStyle;
  final TextStyle? searchHintStyle;
  final Color? checkColor;
  final bool isDismissible;
  final AutovalidateMode autovalidateMode;
  final FormFieldValidator<List<V>>? validator;
  final FormFieldSetter<List<V>>? onSaved;
  final GlobalKey<FormFieldState>? key;
  FormFieldState<List<V>>? state;

  final Color? fieldBackgroundColor;
  final Color? fieldBorderColor;
  final Color? fieldErrorBorderColor;
  final Color? arrowIconColor;
  final Color? clearIconColor;

  MultiSelectBottomSheetField({
    required this.items,
    required this.onConfirm,
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.listType,
    this.decoration,
    this.onSelectionChanged,
    this.chipDisplay,
    this.initialValue = const [],
    this.searchable = false,
    this.confirmText,
    this.cancelText,
    this.selectedColor,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
    this.shape,
    this.barrierColor,
    this.searchHint,
    this.colorator,
    this.backgroundColor,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.searchTextStyle,
    this.searchHintStyle,
    this.selectedItemsTextStyle,
    this.separateSelectedItems = false,
    this.checkColor,
    this.isDismissible = true,
    this.key,
    this.onSaved,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,

    this.fieldBackgroundColor,
    this.fieldBorderColor,
    this.fieldErrorBorderColor,
    this.arrowIconColor,
    this.clearIconColor,
  }) : super(
         key: key,
         onSaved: onSaved,
         validator: validator,
         autovalidateMode: autovalidateMode,
         initialValue: initialValue,
         builder: (FormFieldState<List<V>> state) {
           _MultiSelectBottomSheetFieldView view =
               _MultiSelectBottomSheetFieldView<V>(
                 items: items,
                 decoration: decoration,
                 unselectedColor: unselectedColor,
                 colorator: colorator,
                 itemsTextStyle: itemsTextStyle,
                 selectedItemsTextStyle: selectedItemsTextStyle,
                 backgroundColor: backgroundColor,
                 title: title,
                 initialValue: initialValue,
                 barrierColor: barrierColor,
                 buttonIcon: buttonIcon,
                 buttonText: buttonText,
                 cancelText: cancelText,
                 chipDisplay: chipDisplay,
                 closeSearchIcon: closeSearchIcon,
                 confirmText: confirmText,
                 initialChildSize: initialChildSize,
                 listType: listType,
                 maxChildSize: maxChildSize,
                 minChildSize: minChildSize,
                 onConfirm: onConfirm,
                 onSelectionChanged: onSelectionChanged,
                 searchHintStyle: searchHintStyle,
                 searchIcon: searchIcon,
                 searchHint: searchHint,
                 searchTextStyle: searchTextStyle,
                 searchable: searchable,
                 selectedColor: selectedColor,
                 separateSelectedItems: separateSelectedItems,
                 shape: shape,
                 checkColor: checkColor,
                 isDismissible: isDismissible,
                 fieldBackgroundColor: fieldBackgroundColor,
                 fieldBorderColor: fieldBorderColor,
                 fieldErrorBorderColor: fieldErrorBorderColor,
                 arrowIconColor: arrowIconColor,
                 clearIconColor: clearIconColor,
               );
           return _MultiSelectBottomSheetFieldView<V?>._withState(
             view as _MultiSelectBottomSheetFieldView<V?>,
             state,
           );
         },
       );
}

// ignore: must_be_immutable
class _MultiSelectBottomSheetFieldView<V> extends StatefulWidget {
  final BoxDecoration? decoration;
  final Text? buttonText;
  final Icon? buttonIcon;
  final List<MultiSelectItem<V>> items;
  final List<V> initialValue;
  final Widget? title;
  final void Function(List<V>)? onSelectionChanged;
  final void Function(List<V>)? onConfirm;
  final bool searchable;
  final Text? confirmText;
  final Text? cancelText;
  final MultiSelectListType? listType;
  final Color? selectedColor;
  final String? searchHint;
  final double? initialChildSize;
  final double? minChildSize;
  final double? maxChildSize;
  final ShapeBorder? shape;
  final Color? barrierColor;
  final MultiSelectChipDisplay<V>? chipDisplay;
  final Color Function(V)? colorator;
  final Color? backgroundColor;
  final Color? unselectedColor;
  final Icon? searchIcon;
  final Icon? closeSearchIcon;
  final TextStyle? itemsTextStyle;
  final TextStyle? selectedItemsTextStyle;
  final TextStyle? searchTextStyle;
  final TextStyle? searchHintStyle;
  final bool separateSelectedItems;
  final Color? checkColor;
  final bool isDismissible;
  FormFieldState<List<V>>? state;

  final Color? fieldBackgroundColor;
  final Color? fieldBorderColor;
  final Color? fieldErrorBorderColor;
  final Color? arrowIconColor;
  final Color? clearIconColor;

  _MultiSelectBottomSheetFieldView({
    required this.items,
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.listType,
    this.decoration,
    this.onSelectionChanged,
    this.onConfirm,
    this.chipDisplay,
    required this.initialValue,
    required this.searchable,
    this.confirmText,
    this.cancelText,
    this.selectedColor,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
    this.shape,
    this.barrierColor,
    this.searchHint,
    this.colorator,
    this.backgroundColor,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.searchTextStyle,
    this.searchHintStyle,
    this.selectedItemsTextStyle,
    required this.separateSelectedItems,
    this.checkColor,
    required this.isDismissible,
    this.fieldBackgroundColor,
    this.fieldBorderColor,
    this.fieldErrorBorderColor,
    this.arrowIconColor,
    this.clearIconColor,
  });

  _MultiSelectBottomSheetFieldView._withState(
    _MultiSelectBottomSheetFieldView<V> field,
    FormFieldState<List<V>> state,
  ) : items = field.items,
      title = field.title,
      buttonText = field.buttonText,
      buttonIcon = field.buttonIcon,
      listType = field.listType,
      decoration = field.decoration,
      onSelectionChanged = field.onSelectionChanged,
      onConfirm = field.onConfirm,
      chipDisplay = field.chipDisplay,
      initialValue = field.initialValue,
      searchable = field.searchable,
      confirmText = field.confirmText,
      cancelText = field.cancelText,
      selectedColor = field.selectedColor,
      initialChildSize = field.initialChildSize,
      minChildSize = field.minChildSize,
      maxChildSize = field.maxChildSize,
      shape = field.shape,
      barrierColor = field.barrierColor,
      searchHint = field.searchHint,
      colorator = field.colorator,
      backgroundColor = field.backgroundColor,
      unselectedColor = field.unselectedColor,
      searchIcon = field.searchIcon,
      closeSearchIcon = field.closeSearchIcon,
      itemsTextStyle = field.itemsTextStyle,
      searchHintStyle = field.searchHintStyle,
      searchTextStyle = field.searchTextStyle,
      selectedItemsTextStyle = field.selectedItemsTextStyle,
      separateSelectedItems = field.separateSelectedItems,
      checkColor = field.checkColor,
      isDismissible = field.isDismissible,
      fieldBackgroundColor = field.fieldBackgroundColor,
      fieldBorderColor = field.fieldBorderColor,
      fieldErrorBorderColor = field.fieldErrorBorderColor,
      arrowIconColor = field.arrowIconColor,
      clearIconColor = field.clearIconColor,
      state = state;

  @override
  __MultiSelectBottomSheetFieldViewState createState() =>
      __MultiSelectBottomSheetFieldViewState<V>();
}

class __MultiSelectBottomSheetFieldViewState<V>
    extends State<_MultiSelectBottomSheetFieldView<V>> {
  List<V> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _selectedItems.addAll(widget.initialValue);
  }

  @override
  void didUpdateWidget(_MultiSelectBottomSheetFieldView<V> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initialValue != widget.initialValue) {
      _selectedItems = [];
      _selectedItems.addAll(widget.initialValue);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.state!.didChange(_selectedItems);
      });
    }
  }

  void _clearSelection() {
    setState(() => _selectedItems.clear());
    widget.state?.didChange(_selectedItems);
    widget.onConfirm?.call(_selectedItems);
    widget.onSelectionChanged?.call(_selectedItems);
  }

  _showBottomSheet(BuildContext ctx) async {
    await showModalBottomSheet<List<V>>(
      isDismissible: widget.isDismissible,
      backgroundColor: widget.backgroundColor,
      barrierColor: widget.barrierColor,
      shape:
          widget.shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return MultiSelectBottomSheet<V>(
          checkColor: widget.checkColor,
          selectedItemsTextStyle: widget.selectedItemsTextStyle,
          searchTextStyle: widget.searchTextStyle,
          searchHintStyle: widget.searchHintStyle,
          itemsTextStyle: widget.itemsTextStyle,
          searchIcon: widget.searchIcon,
          closeSearchIcon: widget.closeSearchIcon,
          unselectedColor: widget.unselectedColor,
          colorator: widget.colorator,
          searchHint: widget.searchHint,
          selectedColor: widget.selectedColor,
          listType: widget.listType,
          items: widget.items,
          cancelText: widget.cancelText,
          confirmText: widget.confirmText,
          separateSelectedItems: widget.separateSelectedItems,
          initialValue: _selectedItems,
          onConfirm: (selected) {
            widget.state?.didChange(selected);
            _selectedItems = selected;
            widget.onConfirm?.call(selected);
          },
          onSelectionChanged: widget.onSelectionChanged,
          searchable: widget.searchable,
          title: widget.title,
          initialChildSize: widget.initialChildSize,
          minChildSize: widget.minChildSize,
          maxChildSize: widget.maxChildSize,
        );
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () => _showBottomSheet(context),
              child: Container(
                decoration:
                    widget.decoration ??
                    BoxDecoration(
                      color: widget.fieldBackgroundColor,
                      borderRadius: const BorderRadius.all(Radius.circular(14)),
                      border: Border.all(
                        color: widget.state != null && widget.state!.hasError
                            ? (widget.fieldErrorBorderColor ?? Colors.red)
                            : (_selectedItems.isNotEmpty
                                  ? (widget.fieldBorderColor ??
                                        widget.selectedColor ??
                                        Colors.transparent)
                                  : Colors.transparent),
                        width: _selectedItems.isNotEmpty ? 1.6 : 1.2,
                      ),
                    ),
                padding: EdgeInsets.symmetric(
                  vertical: 3.48 * (w / 100),
                  horizontal: 4.97 * (w / 100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: widget.buttonText ?? const Text("Select")),
                    widget.buttonIcon ??
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: widget.arrowIconColor,
                        ),
                  ],
                ),
              ),
            ),
            if (_selectedItems.isNotEmpty)
              Positioned(
                right: 40,
                top: 0,
                bottom: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: _clearSelection,
                    child: Icon(
                      Icons.clear,
                      size: 18,
                      color: widget.clearIconColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
