import 'package:flutter/material.dart';

extension Screen on BuildContext {
  getNavigator(Widget target) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => target));
  }

  pushAndRemoveNav(Widget target) {
    Navigator.pushAndRemoveUntil(this,
        MaterialPageRoute(builder: (context) => target), (route) => false);
  }

  pop(Widget target) {
    Navigator.pop(this);
  }
}
