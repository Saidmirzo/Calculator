import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UiTwo {
  Color bgColor = const Color(0xff22262F);
  Color colorText = const Color.fromRGBO(187, 187, 187, 1);
  Color spesTextColor = const Color.fromRGBO(252, 163, 0, 1);
  Color containerColor = const Color(0xff22262F);
  Color drawerColor = const Color(0xff263558);
  Color colorIcon = const Color.fromRGBO(157, 102, 0, 1);
  Color colorDarkIcon = const Color.fromRGBO(252, 163, 0, 1);
  double gridSpace = 0;

  BoxDecoration boxDecoration = BoxDecoration(
    //borderRadius: BorderRadius.circular(5),
    border: Border.all(color: Colors.black, width: 1),
    color: const Color(0xff32363F),
  );
  BoxDecoration boxDecorationSpes = BoxDecoration(
    border: Border.all(color: Colors.black, width: 1),
    color: const Color(0xff1F2229),
  );
}

class UiFour {
  Color bgColor = const Color(0xffAAAAAA);
  Color colorText = const Color.fromRGBO(51, 51, 51, 1);
  Color spesTextColor = Colors.white;
  Color containerColor = const Color(0xff333333);
  Color drawerColor = const Color(0xff8F8F8F);
  Color colorIcon = const Color.fromRGBO(97, 97, 97, 1);
  Color colorDarkIcon = const Color.fromRGBO(51, 51, 51, 1);
  double gridSpace = 10;

  BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    
    boxShadow: const [
      BoxShadow(
        color: Colors.black,
        offset: Offset(1, 3),
      ),
    ],
    gradient: const LinearGradient(
      colors: [
        Color(0xffCDCDCD),
        Color(0xffFFFFFF),
      ],
      transform: GradientRotation(-1.57),
    ),
  );
  BoxDecoration boxDecorationSpes = BoxDecoration(
    borderRadius: BorderRadius.circular(3),
     boxShadow: const [
      BoxShadow(
        color: Colors.black,
        offset: Offset(1, 3),
      ),
    ],
    gradient: const LinearGradient(
      colors: [
        Color(0xffEC5C22),
        Color(0xffF0781A),
      ],
      transform: GradientRotation(-1.57),
    ),
  );
}

class UiSeven {
  Color bgColor = Colors.black;
  Color colorText = const Color.fromRGBO(2, 196, 244, 1);
  Color spesTextColor = const Color.fromRGBO(2, 196, 244, 1);
  Color containerColor = Colors.black;
  Color drawerColor = const Color(0xff004055);
  Color colorIcon = const Color.fromRGBO(6, 148, 184, 1);
  Color colorDarkIcon = const Color.fromRGBO(2, 196, 244, 1);
  double gridSpace = 5;

  BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    gradient: const LinearGradient(
      colors: [
        Color.fromARGB(1, 35, 47, 1),
        Color.fromRGBO(17, 17, 17, 1),
      ],
      transform: GradientRotation(-1.57),
    ),
    //color: Colors.black,
  );
  BoxDecoration boxDecorationSpes = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    gradient: const LinearGradient(
      colors: [
        Color.fromARGB(1, 35, 47, 1),
        Color.fromRGBO(17, 17, 17, 1),
      ],
      transform: GradientRotation(-1.57),
    ),
  );
}

class UiNine {
  Color bgColor = Colors.black;
  Color colorText = Colors.white;
  Color spesTextColor = Colors.white;
  Color containerColor = Colors.black;
  Color drawerColor = const Color(0xff2D2D2D);
  Color colorIcon = const Color.fromRGBO(149, 149, 149, 1);
  Color colorDarkIcon = Colors.white;
  double gridSpace = 10;

  BoxDecoration boxDecoration = BoxDecoration(
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
  BoxDecoration boxDecorationSpes = BoxDecoration(
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
