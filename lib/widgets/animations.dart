import 'package:flutter/cupertino.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedAppearance extends StatefulWidget{
  const AnimatedAppearance({super.key, required this.child});
  final Widget child;

  @override
  State<StatefulWidget> createState() => _AnimateAppearanceState();
}

class _AnimateAppearanceState extends State<AnimatedAppearance>{
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: Key(widget.child.hashCode.toString()),
        onVisibilityChanged: (info) {
          if(info.visibleFraction > 0.1) setState(() => _isVisible = true);
        },
        child: AnimatedScale(
          scale: _isVisible ? 1.0 : 0.5,
          duration: const Duration(milliseconds: 500),
          child: AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: widget.child
          ),
        ),
    );
  }
}