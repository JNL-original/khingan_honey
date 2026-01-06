import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget{
  const Responsive({super.key, required this.mobile, this.tablet,required this.desktop});

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  static bool isMobile(context) => MediaQuery.of(context).size.width < 600;
  static bool isTablet(context) => MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1024;
  static bool isDesktop(context) => MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(width < 600) return mobile;
    if(width >= 600 && width < 1024) return tablet ?? desktop;
    return desktop;
  }
}

class AdaptiveForSmallPhones extends StatelessWidget{
  const AdaptiveForSmallPhones({super.key, required this.child, this.minWidth = 490});
  final Widget child;
  final double minWidth;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < minWidth) {
      return Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: SizedBox(
            width: minWidth,
            child: child,
          ),
        ),
      );
    }
    return child;
  }

}
