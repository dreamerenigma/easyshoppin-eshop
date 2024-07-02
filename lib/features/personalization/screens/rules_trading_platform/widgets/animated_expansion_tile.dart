import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../../../../utils/constants/colors.dart';

class AnimatedExpansionTile extends StatefulWidget {
  final String title;
  final List<Widget> children;

  const AnimatedExpansionTile({
    required this.title,
    required this.children,
    super.key,
  });

  @override
  AnimatedExpansionTileState createState() => AnimatedExpansionTileState();
}

class AnimatedExpansionTileState extends State<AnimatedExpansionTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<Color?> _colorAnimation;
  final ValueNotifier<bool> _isExpanded = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _iconTurns = Tween<double>(begin: 0.0, end: 0.5).animate(_controller);
    _colorAnimation = ColorTween(begin: Colors.grey, end: TColors.darkerGrey).animate(_controller);

    _isExpanded.addListener(() {
      if (_isExpanded.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ListTileTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        child: ExpansionTile(
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child) => RotationTransition(
              turns: _iconTurns,
              child: Icon(
                EvaIcons.arrowIosDownwardOutline,
                color: _colorAnimation.value,
              ),
            ),
          ),
          onExpansionChanged: (bool expanded) {
            _isExpanded.value = expanded;
          },
          children: widget.children,
        ),
      ),
    );
  }
}
