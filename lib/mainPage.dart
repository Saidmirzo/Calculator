import 'dart:async';
import 'dart:ui';

import 'package:calculation/utils/const.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late num son1, son2;
  late int amal;
  late BuildContext scaffoldContext;
  //bool visibleCricle = false;

  Alignment align = const Alignment(-0.8, 0);
  Alignment aligntext = const Alignment(-0.8, 0);
  bool night = true, mornig = false, visibleSun = false, visibleMoon = true;
  Color switchColor = const Color(0xff4E505F);
  Color color1 = const Color(0xff4E505F);
  Color color2 = const Color(0xff2E2F38);
  Color color3 = const Color(0xff4B5EFC);
  Color bgColor = Colors.black;
  Color colorText = Colors.white;
  Color containerColor = const Color(0xff2E2F38);
  Color littleTextColor = const Color.fromRGBO(255, 255, 255, 0.4);

  //var heightB;

  late AnimationController _controller;
  late Animation<double> animScale;
  late Animation<double> animName;
  late ScrollController controllerScroll;

  final textController = TextEditingController();
  final littleText = TextEditingController();
  late double displayHeight;
  late double displayWidth;
  late double sizeBigText = displayHeight * 0.092;
  double animCricleClear = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1800), vsync: this);
    animScale = Tween<double>(begin: 0.7, end: 1.3).animate(_controller);
    animName = Tween<double>(begin: -100, end: 400).animate(_controller);
    textController.text = '0';
    littleText.text = '';
    controllerScroll = ScrollController();

    controllerScroll.addListener(() {
      if (controllerScroll.hasClients) {
        if (controllerScroll.position.maxScrollExtent ==
            controllerScroll.offset) {
          calculate();
        }
      }
    });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    textController.dispose();
    littleText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    displayHeight = size.height;
    displayWidth = size.width;

    //heightB = size.height;
    bgColor = Colors.black;
    color2 = const Color(0xff2E2F38);
    colorText = Colors.white;
    containerColor = const Color(0xff2E2F38);
    littleTextColor = const Color.fromRGBO(255, 255, 255, 0.4);
    switchColor = const Color(0xff4E505F);

    if (mornig) {
      switchColor = const Color(0xffD2D3DA);
      bgColor = const Color(0xffF1F2F3);
      color2 = const Color(0xffFFFFFF);
      colorText = Colors.black;
      containerColor = const Color(0xffFFFFFF);
      littleTextColor = const Color.fromRGBO(0, 0, 0, 0.4);
    }

    const boxDecoration = BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/cell.jpg'),
        fit: BoxFit.cover,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: Image.asset(
                'assets/calc_icon.png',
                height: 30,
              ),
            ),
            InkWell(
              child: Image.asset(
                'assets/curr_icon.png',
                height: 40,
              ),
            ),
            InkWell(
              child: Image.asset(
                'assets/rule_icon.png',
                height: 40,
              ),
            ),
            InkWell(
              child: Image.asset(
                'assets/sett_icon.png',
                height: 40,
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        width: 250,
        backgroundColor: const Color(0xff2D2D2D),
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.5,
          crossAxisCount: 2,
          children: [
            //     ListTile(
            //   title: const Text('Cancel'),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            calc_view_bottom('assets/calc_img.jpg'),
            calc_view_bottom('assets/calc_img.jpg'),
          ],
        ),
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Builder(builder: (context) {
          scaffoldContext = context;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // InkWell(
              //   borderRadius: BorderRadius.circular(26),
              //   onTap: () {
              //     align = night
              //         ? const Alignment(0.7, 0)
              //         : const Alignment(-0.7, 0);
              //     night = !night;
              //     mornig = !mornig;

              //     setState(() {});
              //     visibleMoon = !visibleMoon;
              //     visibleSun = !visibleSun;
              //   },
              //   child: Container(
              //     margin: EdgeInsets.only(
              //       top: size.height * 0.02,
              //     ),
              //     height: 32,
              //     width: 72,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(26),
              //       color: containerColor,
              //     ),
              //     child: Stack(
              //       alignment: Alignment.center,
              //       children: [
              //         AnimatedAlign(
              //           alignment: align,
              //           duration: const Duration(milliseconds: 350),
              //           child: Container(
              //             height: 24,
              //             width: 24,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(12),
              //               color: switchColor,
              //             ),
              //           ),
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Visibility(
              //               visible: visibleSun,
              //               child: const Padding(
              //                 padding: EdgeInsets.only(left: 8),
              //                 child: Icon(
              //                   Icons.sunny,
              //                   color: Color.fromRGBO(75, 94, 252, 1),
              //                 ),
              //               ),
              //             ),
              //             Visibility(
              //               visible: visibleMoon,
              //               child: const Padding(
              //                 padding: EdgeInsets.only(right: 8),
              //                 child: Icon(
              //                   Icons.mode_night_outlined,
              //                   color: Color.fromRGBO(75, 94, 252, 1),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          AnimatedBuilder(
                              animation: animName,
                              builder: (context, child) {
                                return Text(
                                  'Saidmirzo',
                                  style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w300,
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: <Color>[
                                          Colors.black,
                                          Colors.white,
                                          Colors.black
                                          //add more color here.
                                        ],
                                      ).createShader(
                                        Rect.fromLTWH(
                                            animName.value, 0.0, 200.0, 100.0),
                                      ),
                                  ),
                                );
                              }),
                          Image.asset(
                            'assets/clock_ico.png',
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                    TextField(
                      style: sTextStyle(
                        color: colorText,
                        size: sizeBigText,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.right,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: textController,
                    ),
                    TextField(
                      style: sTextStyle(
                        color: littleTextColor,
                        size: size.height * 0.05,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.right,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: littleText,
                    ),
                  ],
                ),
              ),

              Stack(
                children: [
                  Align(
                    alignment: Alignment(1, -1),
                    child: Transform.translate(
                      offset: Offset(20, -10),
                      child: AnimatedScale(
                        duration: Duration(milliseconds: 500),
                        scale: animCricleClear,
                        child: Container(
                          //alignment: Alignment.bottomRight,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GridView.count(
                    controller: controllerScroll,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: size.height > 800
                        ? 1.0
                        : size.height > 700
                            ? 1.1
                            : 1.3,
                    crossAxisCount: 4,
                    // primary: false,
                    children: [
                      buttons('C', functionClear: clear, color1),
                      buttons('+/-', functionMultiMinus: multiMinus, color1),
                      buttons('%', functionPercentage: percentage, color1),
                      buttons(
                          '/',
                          functionDevide: devide,
                          color3,
                          colorBlu: Colors.white),
                      buttons('7', functionNum: writeNumbers, color2),
                      buttons('8', functionNum: writeNumbers, color2),
                      buttons('9', functionNum: writeNumbers, color2),
                      buttons(
                          'x',
                          functionMultiple: multiple,
                          color3,
                          colorBlu: Colors.white),
                      buttons('4', functionNum: writeNumbers, color2),
                      buttons('5', functionNum: writeNumbers, color2),
                      buttons('6', functionNum: writeNumbers, color2),
                      buttons(
                          '-',
                          functionMinus: minus,
                          color3,
                          colorBlu: Colors.white),
                      buttons('1', functionNum: writeNumbers, color2),
                      buttons('2', functionNum: writeNumbers, color2),
                      buttons('3', functionNum: writeNumbers, color2),
                      buttons(
                          '+',
                          functionPlus: plus,
                          color3,
                          colorBlu: Colors.white),
                      buttons('.', functionNum: writeNumbers, color2),
                      buttons('0', functionNum: writeNumbers, color2),
                      buttons(
                          '<x|',
                          functionDeleteLast: deleteLast,
                          color2,
                          boolIcon: true),
                      buttons(
                          '=',
                          functionCalculate: calculate,
                          color3,
                          colorBlu: Colors.white),
                    ],
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  InkWell calc_view_bottom(String path) {
    return InkWell(
      onTap: (() {}),
      child: Container(
        height: 100,
        width: 50,
        child: Image.asset(path),
      ),
    );
  }

  void calculate() {
    son2 = num.parse(textController.text);
    if (son1 != null && son2 != null) {
      late num natija;
      switch (amal) {
        case 1:
          natija = son1 / son2;
          break;
        case 2:
          natija = son1 * son2;
          break;
        case 3:
          natija = son1 - son2;
          break;
        case 4:
          natija = son1 + son2;
          break;
        default:
          natija = 0;
          break;
      }
      textController.text = natija.toString();
      littleText.text = '0';
      aligntext = const Alignment(-0.4, 0);
      setState(() {});
    }
  }

  void writeNumbers(String num) {
    if (textController.text.length > 15) {
      showInSnackBar('Raqamlar 15 tadn dan kop!');
    } else {
      if (num == '.') {
        String temp = textController.text.substring(
            textController.text.length - 1, textController.text.length);
        if (!textController.text.contains('.')) {
          textController.text = textController.text + num;
          littleText.text = littleText.text + num;
        }
      } else {
        if (textController.text != '0') {
          textController.text = textController.text + num;
        } else {
          textController.text = num;
        }
        if (littleText.text != '0') {
          littleText.text = littleText.text + num;
        } else {
          littleText.text = num;
        }
        if (textController.text.length > 13) {
          sizeBigText = displayHeight * 0.05;
        } else if (textController.text.length > 10) {
          sizeBigText = displayHeight * 0.065;
        } else if (textController.text.length > 8) {
          sizeBigText = displayHeight * 0.08;
        } else {
          sizeBigText = displayHeight * 0.092;
        }
        setState(() {});
      }
    }
  }

  void deleteLast() {
    textController.text =
        textController.text.substring(0, textController.text.length - 1);
    if (textController.text == '' || textController.text == '0') {
      textController.text = '0';
    }
    if (littleText.text != '0' && littleText.text != '') {
      String temp = littleText.text
          .substring(littleText.text.length - 1, littleText.text.length);
      if (temp != '/' || temp != 'x' || temp != '-' || temp != '+') {
        littleText.text =
            littleText.text.substring(0, littleText.text.length - 1);
      } else {
        littleText.text =
            littleText.text.substring(0, littleText.text.length - 2);
      }
      if (littleText.text == '' || littleText.text == '0') {
        littleText.text = '0';
      }
    }
    setState(() {});
  }

  void clear() async {
    textController.text = '0';
    littleText.text = '';
    sizeBigText = displayHeight * 0.092;
    animCricleClear = 20;

    setState(() {});
    await Future.delayed(Duration(milliseconds: 500));
    animCricleClear = 0;
    setState(() {});
  }

  void devide() {
    son1 = num.parse(textController.text);
    amal = 1;
    littleText.text = '$son1/';
    textController.text = '0';
    setState(() {});
  }

  void multiple() {
    son1 = num.parse(textController.text);
    amal = 2;
    littleText.text = '${son1}x';
    textController.text = '0';
    setState(() {});
  }

  void minus() {
    son1 = num.parse(textController.text);
    amal = 3;
    littleText.text = '$son1-';
    textController.text = '0';

    setState(() {});
  }

  void plus() {
    son1 = num.parse(textController.text);
    amal = 4;
    littleText.text = '$son1+';
    textController.text = '0';

    setState(() {});
  }

  void multiMinus() {
    if (littleText.text.contains('-') ||
        littleText.text.contains('+') ||
        littleText.text.contains('x') ||
        littleText.text.contains('/')) {
      calculate();
    }
    littleText.text = '0';

    textController.text = (num.parse(textController.text) * (-1)).toString();

    setState(() {});
  }

  void percentage() {
    if (littleText.text.contains('-') ||
        littleText.text.contains('+') ||
        littleText.text.contains('x') ||
        littleText.text.contains('/')) {
      calculate();
    }
    textController.text = (num.parse(textController.text) / 100).toString();
  }

  void showInSnackBar(String value) {
    // ignore: deprecated_member_use
    Scaffold.of(scaffoldContext).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Text(
          value,
          style: sTextStyle(
            color: Colors.red,
            size: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  InkWell buttons(String s, Color color,
      {Color? colorBlu,
      bool boolIcon = false,
      void Function(String)? functionNum,
      void Function()? functionClear,
      void Function()? functionDevide,
      void Function()? functionMultiple,
      void Function()? functionMinus,
      void Function()? functionPlus,
      void Function()? functionMultiMinus,
      void Function()? functionCalculate,
      void Function()? functionDeleteLast,
      void Function()? functionPercentage}) {
    return InkWell(
      onTap: () {
        if (functionNum != null) functionNum(s);
        if (functionClear != null) functionClear();
        if (functionDevide != null) functionDevide();
        if (functionMultiple != null) functionMultiple();
        if (functionMinus != null) functionMinus();
        if (functionPlus != null) functionPlus();
        if (functionMultiMinus != null) functionMultiMinus();
        if (functionCalculate != null) functionCalculate();
        if (functionDeleteLast != null) functionDeleteLast();
        if (functionPercentage != null) functionPercentage();
      },
      borderRadius: BorderRadius.circular(24),
      child: Container(
        alignment: Alignment.center,
        height: 65, //displayHeight * 0.00175,
        width: displayHeight * 0.00175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
          color: Colors.black,
        ),
        child: Builder(builder: (context) {
          if (boolIcon) {
            return Image.asset(
              'assets/delete.png',
              height: 30,
              color: colorText,
            );
          } else {
            return Text(
              s,
              style: sTextStyle(
                  // ignore: prefer_if_null_operators
                  color: colorBlu == null ? colorText : colorBlu,
                  size: 32,
                  fontWeight: FontWeight.w400),
            );
          }
        }),
      ),
    );
  }
}
