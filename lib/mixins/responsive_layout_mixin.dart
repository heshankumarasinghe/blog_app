import 'package:flutter/widgets.dart';

import '../constants/constraints.dart';

class ResponsiveLayoutMixin {
  double getScreenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double getContentWidth(BuildContext context) => getScreenWidth(context) * Constraints.contentWidthFactor;

  double getContentHeight(BuildContext context, {bool safeAreaPadding = true, bool keyboardHeight = true}) {
    // Difference between this method an the above getScreenHeight method is that unlike the getScreenHeight method
    // which returns the raw screen height is that this method is configurable to reduce the content height and the keyboard
    // height (avoids soft keyboard overflow issues) from the raw height. In simple terms, this method gives the height
    // of the content whereas the getScreenHeight method gives the height of the screen

    double heightToReturn = getScreenHeight(context);

    if (safeAreaPadding) {
      heightToReturn -= MediaQuery.of(context).padding.top;
    }

    if (keyboardHeight) {
      heightToReturn + MediaQuery.of(context).viewInsets.bottom;
    }

    return heightToReturn;
  }
}
