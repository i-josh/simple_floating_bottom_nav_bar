import 'package:simple_floating_bottom_nav_bar/floating_item.dart';
import 'package:flutter/material.dart';

class FloatingBottomNavBar extends StatefulWidget {
  final List<Widget> pages;
  final int selectedIndex;
  final double? elevation;
  final double? radius;
  final double? height;
  final double? width;
  final double? bottomPadding;
  final Color? backgroundColor;
  final List<FloatingBottomNavItem> items;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final Function? onItemTapped;

  const FloatingBottomNavBar(
      {super.key,
      required this.pages,
      this.selectedIndex = 0,
      this.elevation = 0,
      this.radius = 20,
      this.backgroundColor = Colors.blue,
      this.height = 65,
      this.width = 300,
      this.bottomPadding = 5,
      this.onItemTapped,
      required this.items,
      this.selectedLabelStyle,
      this.unselectedLabelStyle});

  @override
  State<FloatingBottomNavBar> createState() => _FloatingBottomNavBarState();
}

class _FloatingBottomNavBarState extends State<FloatingBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widget.pages.elementAt(widget.selectedIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius!),
            color: widget.backgroundColor,
          ),
          padding: EdgeInsets.only(bottom: widget.bottomPadding!),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            fixedColor: widget.selectedLabelStyle?.color ?? Colors.white,
            elevation: widget.elevation,
            type: BottomNavigationBarType.fixed,
            currentIndex: widget.selectedIndex,
            unselectedFontSize:
                widget.items.any((element) => element.label == null)
                    ? 0
                    : widget.unselectedLabelStyle?.fontSize ?? 14,
            selectedFontSize:
                widget.items.any((element) => element.label == null)
                    ? 0
                    : widget.selectedLabelStyle?.fontSize ?? 14,
            selectedLabelStyle: widget.selectedLabelStyle,
            unselectedLabelStyle: widget.unselectedLabelStyle,
            onTap: widget.onItemTapped as void Function(int)?,
            items: widget.items
                .map((item) => BottomNavigationBarItem(
                    icon: item.inactiveIcon,
                    activeIcon: item.activeIcon,
                    label: item.label ?? ''))
                .toList(),
          )),
    );
  }
}
