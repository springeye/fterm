import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class RadioFormGroup<T> extends FormField<T> {
  RadioFormGroup(
    T groupValue, {
    required List<RadioItem> items,
    super.key,
    super.onSaved,
    Function(T? value)? onChanged,
  }) : super(
          initialValue: groupValue,
          builder: (FormFieldState<T> field) {
            return RadioGroup(field.value, items: items, onChanged: (v) {
              field.didChange(v);
              onChanged?.call(v);
            });
          },
        );
}

class RadioGroup<T> extends StatelessWidget {
  final List<RadioItem> items;
  final Function(T? value)? onChanged;
  final T groupValue;

  const RadioGroup(this.groupValue,
      {Key? key, required this.items, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectColor = Theme.of(context).secondaryHeaderColor;
    var color = Colors.transparent;
    return Row(
      children: [
        ...items.mapIndexed(
          (i, e) {
            var widget = Container(
              padding: e.padding ??
                  const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
              child: e,
            );
            var card = Card(
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.zero,
                ),
              ),
              color: groupValue == e.value ? selectColor : color,
              child: widget,
            );
            if (i == 0) {
              card = Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ).copyWith(
                    topRight: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                ),
                color: groupValue == e.value ? selectColor : color,
                child: widget,
              );
            } else if (i == items.length - 1) {
              card = Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ).copyWith(
                    topLeft: Radius.zero,
                    bottomLeft: Radius.zero,
                  ),
                ),
                color: groupValue == e.value ? selectColor : color,
                child: widget,
              );
            }
            return GestureDetector(
              onTap: () {
                onChanged?.call(e.value);
              },
              child: card,
            );
          },
        ),
      ],
    );
  }
}

class RadioItem<T> extends StatelessWidget {
  final Widget title;
  final T value;
  final EdgeInsetsGeometry? padding;

  const RadioItem(this.value, {Key? key, required this.title, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return title;
  }
}
