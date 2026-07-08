import 'package:flutter/cupertino.dart';

enum DeviceType {mobile, tablet, desktop }

class Responsive {
  static const double mobileMax = 700;
  static const double tabletMax = 1100;

  static DeviceType deviceTypeOf (BuildContext context){
    final width = MediaQuery.of(context).size.width;
    if (width < mobileMax) return DeviceType.mobile;
    if (width < tabletMax) return DeviceType.tablet;
    return DeviceType.desktop;
  }

  static bool isMobile(BuildContext context) =>
      deviceTypeOf(context) == DeviceType.mobile;

  static bool isTablet (BuildContext context)=>
      deviceTypeOf(context) == DeviceType.tablet;

  static bool isDesktop (BuildContext context) =>
      deviceTypeOf(context) == DeviceType.desktop;

  static double pagePadding(BuildContext context){
    switch (deviceTypeOf(context)){
      case DeviceType.mobile:
        return 16;
      case DeviceType.tablet:
        return 24;
      case DeviceType.desktop:
        return 32;
    }
  }
}