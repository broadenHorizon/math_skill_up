import 'package:flutter/material.dart';

class LineItem extends StatelessWidget {
  final double width;
  final LineItemPosition historyItemPosition;
  final bool isHeader;
  final String text;

  const LineItem(
      {super.key,
      required this.width,
      required this.historyItemPosition,
      this.isHeader = false,
      required this.text});

  BorderRadius getRadius() {
    switch (historyItemPosition) {
      case LineItemPosition.left:
        return BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        );
      case LineItemPosition.middle:
        return BorderRadius.zero;
      case LineItemPosition.right:
        return BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.5),
      height: 35,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: getRadius(),
      ),
      child: Center(
          child: Text(
        text,
        style: isHeader
            ? Theme.of(context).textTheme.labelLarge
            : Theme.of(context).textTheme.bodyLarge,
      )),
    );
  }
}

enum LineItemPosition {
  left,
  middle,
  right;
}
