import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UiNine {
  Color colorIcon = const Color.fromRGBO(149, 149, 149, 1);
  Color colorDarkIcon = Colors.white;
  BoxDecoration bottonDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      boxShadow: const [
        BoxShadow(
          color: Colors.white,
          blurRadius: 8,
          spreadRadius: 2,
        ),
      ],
      color: Colors.black,
    );
  }
}
