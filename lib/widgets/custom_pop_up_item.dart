import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:real_estate_task/widgets/gap.dart';
//
// class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
//   final T value;
//   final String label;
//   final bool isSelected;
//
//   CustomPopupMenuItem({
//     Key? key,
//     required this.value,
//     required this.label,
//     this.isSelected = false,
//   }) : super(
//           key: key,
//           value: value,
//           child: Text(
//             label,
//             style: TextStyle(
//               color: Colors.red,
//             ),
//           ), // Empty child to avoid assertion error
//         );
//
//   @override
//   Widget buildChild(BuildContext context) {
//     return ListTile(
//       // selected: isSelected,
//       // selectedTileColor: Theme.of(context).primaryColor,
//       title: Text(
//         label,
//         style:
//             Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
//       ),
//     );
//   }
// }

class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  const CustomPopupMenuItem({
    required this.title,
    required this.icon,
    super.key,
    super.value,
    this.checked = false,
    super.enabled,
    super.padding,
    super.height,
    super.mouseCursor,
    super.child,
  });

  final bool checked;

  final String title;

  final IconData icon;

  @override
  PopupMenuItemState<T, CustomPopupMenuItem<T>> createState() =>
      _CustomPopupMenuItemState<T>();
}

class _CustomPopupMenuItemState<T>
    extends PopupMenuItemState<T, CustomPopupMenuItem<T>> {
  @override
  Widget buildChild() {
    return IgnorePointer(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        enabled: widget.enabled,
        title: DefaultTextStyle(
          style: TextStyle(
            color: widget.checked
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.tertiary,
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 16,
                color: widget.checked ? Theme.of(context).primaryColor : null,
                // color: Color(0xff000000),
              ),
              const Gap.w(5),
              Text(widget.title),
            ],
          ),
        ),
      ),
    );
  }
}
