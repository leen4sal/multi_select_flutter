import 'package:flutter/material.dart';
import '../util/multi_select_item.dart';
import '../util/multi_select_actions.dart';
import '../util/multi_select_list_type.dart';

/// A bottom sheet widget containing either a classic checkbox style list, or a chip style list.
class MultiSelectBottomSheet<T> extends StatefulWidget
    with MultiSelectActions<T> {
  /// List of items to select from.
  final List<MultiSelectItem<T>> items;

  /// The list of selected values before interaction.
  final List<T> initialValue;

  /// The text at the top of the BottomSheet.
  final Widget? title;

  /// Fires when the an item is selected / unselected.
  final void Function(List<T>)? onSelectionChanged;

  /// Fires when confirm is tapped.
  final void Function(List<T>)? onConfirm;

  /// Toggles search functionality.
  final bool searchable;

  /// Text on the confirm button.
  final Text? confirmText;

  /// Text on the cancel button.
  final Text? cancelText;

  /// An enum that determines which type of list to render.
  final MultiSelectListType? listType;

  /// Sets the color of the checkbox or chip when it's selected.
  final Color? selectedColor;

  /// Set the initial height of the BottomSheet.
  final double? initialChildSize;

  /// Set the minimum height threshold of the BottomSheet before it closes.
  final double? minChildSize;

  /// Set the maximum height of the BottomSheet.
  final double? maxChildSize;

  /// Set the placeholder text of the search field.
  final String? searchHint;

  /// A function that sets the color of selected items based on their value.
  final Color? Function(T)? colorator;

  /// Color of the chip body or checkbox border while not selected.
  final Color? unselectedColor;

  /// Icon button that shows the search field.
  final Icon? searchIcon;

  /// Icon button that hides the search field
  final Icon? closeSearchIcon;

  /// Style the text on the chips or list tiles.
  final TextStyle? itemsTextStyle;

  /// Style the text on the selected chips or list tiles.
  final TextStyle? selectedItemsTextStyle;

  /// Style the search text.
  final TextStyle? searchTextStyle;

  /// Style the search hint.
  final TextStyle? searchHintStyle;

  /// Moves the selected items to the top of the list.
  final bool separateSelectedItems;

  /// Set the color of the check in the checkbox
  final Color? checkColor;

  final Color? checkboxBorderColor;
  final Color? checkboxActiveColor;

  final Color? searchFillColor;
  final Color? searchCursorColor;

  final Color? cancelButtonBackgroundColor;
  final Color? cancelButtonBorderColor;
  final Color? cancelTextColor;

  final Color? confirmButtonBackgroundColor;

  MultiSelectBottomSheet({
    required this.items,
    required this.initialValue,
    this.title,
    this.onSelectionChanged,
    this.onConfirm,
    this.listType,
    this.cancelText,
    this.confirmText,
    this.searchable = false,
    this.selectedColor,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
    this.colorator,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.searchTextStyle,
    this.searchHint,
    this.searchHintStyle,
    this.selectedItemsTextStyle,
    this.separateSelectedItems = false,
    this.checkColor,

    // new
    this.checkboxBorderColor,
    this.checkboxActiveColor,
    this.searchFillColor,
    this.searchCursorColor,
    this.cancelButtonBackgroundColor,
    this.cancelButtonBorderColor,
    this.cancelTextColor,
    this.confirmButtonBackgroundColor,
  });

  @override
  _MultiSelectBottomSheetState<T> createState() =>
      _MultiSelectBottomSheetState<T>(items);
}

class _MultiSelectBottomSheetState<T> extends State<MultiSelectBottomSheet<T>> {
  List<T> _selectedValues = [];
  bool _showSearch = false;
  List<MultiSelectItem<T>> _items;

  _MultiSelectBottomSheetState(this._items);

  @override
  void initState() {
    super.initState();
    _selectedValues.addAll(widget.initialValue);

    for (int i = 0; i < _items.length; i++) {
      _items[i].selected = false;
      if (_selectedValues.contains(_items[i].value)) {
        _items[i].selected = true;
      }
    }

    if (widget.separateSelectedItems) {
      _items = widget.separateSelected(_items);
    }
  }

  /// Returns a CheckboxListTile
  Widget _buildListItem(MultiSelectItem<T> item) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: widget.unselectedColor ?? Colors.black54,
      ),
      child: CheckboxListTile(
        side: BorderSide(
          color: widget.checkboxBorderColor ?? Colors.grey,
          width: 1,
        ),
        activeColor:
            widget.checkboxActiveColor ?? Theme.of(context).primaryColor,
        checkColor: widget.checkColor ?? Colors.white,
        value: item.selected,
        title: Text(
          item.label,
          style: item.selected
              ? widget.selectedItemsTextStyle
              : widget.itemsTextStyle,
        ),
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (checked) {
          setState(() {
            _selectedValues = widget.onItemCheckedChange(
              _selectedValues,
              item.value,
              checked!,
            );

            item.selected = checked;

            if (widget.separateSelectedItems) {
              _items = widget.separateSelected(_items);
            }
          });
          if (widget.onSelectionChanged != null) {
            widget.onSelectionChanged!(_selectedValues);
          }
        },
      ),
    );
  }

  /// Returns a ChoiceChip
  Widget _buildChipItem(MultiSelectItem<T> item) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        backgroundColor: widget.unselectedColor,
        selectedColor:
            widget.colorator != null && widget.colorator!(item.value) != null
            ? widget.colorator!(item.value)
            : widget.selectedColor ??
                  Theme.of(context).primaryColor.withOpacity(0.35),
        label: Text(
          item.label,
          style: _selectedValues.contains(item.value)
              ? TextStyle(
                  color:
                      widget.selectedItemsTextStyle?.color ??
                      widget.colorator?.call(item.value) ??
                      widget.selectedColor ??
                      Theme.of(context).primaryColor,
                  fontSize: widget.selectedItemsTextStyle?.fontSize,
                )
              : widget.itemsTextStyle,
        ),
        selected: item.selected,
        onSelected: (checked) {
          item.selected = checked;
          setState(() {
            _selectedValues = widget.onItemCheckedChange(
              _selectedValues,
              item.value,
              checked,
            );
          });
          if (widget.onSelectionChanged != null) {
            widget.onSelectionChanged!(_selectedValues);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: widget.initialChildSize ?? 0.3,
        minChildSize: widget.minChildSize ?? 0.3,
        maxChildSize: widget.maxChildSize ?? 0.6,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _showSearch
                        ? Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextField(
                                autofocus: true,
                                style: widget.searchTextStyle,
                                cursorColor:
                                    widget.searchCursorColor ?? Colors.grey,
                                decoration: InputDecoration(
                                  hintStyle: widget.searchHintStyle,
                                  hintText: widget.searchHint ?? "Search",
                                  enabled: true,
                                  filled: true,
                                  fillColor:
                                      widget.searchFillColor ??
                                      Colors.grey.withOpacity(0.1),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 3.48 * (w / 100),
                                    horizontal: 4.97 * (w / 100),
                                  ),
                                ),
                                onChanged: (val) {
                                  List<MultiSelectItem<T>> filteredList = [];
                                  filteredList = widget.updateSearchQuery(
                                    val,
                                    widget.items,
                                  );
                                  setState(() {
                                    if (widget.separateSelectedItems) {
                                      _items = widget.separateSelected(
                                        filteredList,
                                      );
                                    } else {
                                      _items = filteredList;
                                    }
                                  });
                                },
                              ),
                            ),
                          )
                        : widget.title ??
                              const Text(
                                "Select",
                                style: TextStyle(fontSize: 18),
                              ),
                    widget.searchable
                        ? IconButton(
                            icon: _showSearch
                                ? widget.closeSearchIcon ??
                                      const Icon(Icons.close)
                                : widget.searchIcon ?? const Icon(Icons.search),
                            onPressed: () {
                              setState(() {
                                _showSearch = !_showSearch;
                                if (!_showSearch) {
                                  if (widget.separateSelectedItems) {
                                    _items = widget.separateSelected(
                                      widget.items,
                                    );
                                  } else {
                                    _items = widget.items;
                                  }
                                }
                              });
                            },
                          )
                        : const Padding(padding: EdgeInsets.all(15)),
                  ],
                ),
              ),
              Expanded(
                child:
                    widget.listType == null ||
                        widget.listType == MultiSelectListType.LIST
                    ? ListView.builder(
                        controller: scrollController,
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          return _buildListItem(_items[index]);
                        },
                      )
                    : SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Wrap(
                            children: _items.map(_buildChipItem).toList(),
                          ),
                        ),
                      ),
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: 6.21 * (w / 100),
                  left: 5.97 * (w / 100),
                  right: 5.97 * (w / 100),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              widget.cancelButtonBackgroundColor ??
                              Colors.white,
                          side: BorderSide(
                            color:
                                widget.cancelButtonBorderColor ??
                                Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {
                          widget.onCancelTap(context, widget.initialValue);
                        },
                        child:
                            widget.cancelText ??
                            Text(
                              "Cancel",
                              style: TextStyle(
                                color:
                                    widget.cancelTextColor ??
                                    Theme.of(context).primaryColor,
                              ),
                            ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              widget.confirmButtonBackgroundColor ??
                              Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          widget.onConfirmTap(
                            context,
                            _selectedValues,
                            widget.onConfirm,
                          );
                        },
                        child: widget.confirmText ?? const Text("Confirm"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
