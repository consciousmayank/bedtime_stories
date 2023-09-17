import 'package:bedtime_stories/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class ThemePopUpMenuWidget extends StatelessWidget {
  final List<PopUpMenuOptions> options;
  final Offset? offset;
  const ThemePopUpMenuWidget({
    super.key,
    required this.options,
    this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => options
          .map(
            (e) => PopupMenuItem(
              enabled:
                  options.elementAt(options.indexOf(e)).onMenuItemSelected !=
                      null,
              value: e.menuValue,
              // row with 2 children
              child: Row(
                children: [
                  Expanded(flex: 1, child: Text(e.menuTitle)),
                  horizontalSpaceSmall,
                  if (e.menuIcon != null) ...[
                    e.menuIcon!,
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ],
              ),
            ),
          )
          .toList(),
      offset: offset ?? const Offset(0, 0),
      color: Colors.grey,
      elevation: 2,
      // on selected we show the dialog box
      onSelected: (value) {
        // if value 1 show dialog
        if (options.elementAt(value).onMenuItemSelected != null) {
          options.elementAt(value).onMenuItemSelected!()?.call();
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.more_vert_outlined),
      ),
    );
  }
}

class PopUpMenuOptions {
  final int menuValue;
  final Function? onMenuItemSelected;
  final String menuTitle;
  final Icon? menuIcon;

  PopUpMenuOptions({
    required this.menuValue,
    required this.onMenuItemSelected,
    required this.menuTitle,
    this.menuIcon,
  });
}
