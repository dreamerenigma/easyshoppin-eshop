import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

Widget buildListItem(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 35.0),
    child: Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Icon(Remix.arrow_right_s_line),
            ],
          ),
        ),
      ],
    ),
  );
}

class BuildListItemWithGestureDetector extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const BuildListItemWithGestureDetector({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  BuildListItemWithGestureDetectorState createState() => BuildListItemWithGestureDetectorState();
}

class BuildListItemWithGestureDetectorState extends State<BuildListItemWithGestureDetector> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isTapped ? Theme.of(context).highlightColor.withOpacity(0.3) : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16.0, top: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.text,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Icon(Remix.arrow_right_s_line),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}