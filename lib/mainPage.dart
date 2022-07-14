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

  Alignment align = const Alignment(-0.8, 0);
  bool night = true, mornig = false, visibleSun = false, visibleMoon = true;
  Color switchColor = const Color(0xff4E505F);
  Color color1 = const Color(0xff4E505F);
  Color color2 = const Color(0xff2E2F38);
  Color color3 = const Color(0xff4B5EFC);
  Color bgColor = const Color(0xff17171C);
  Color colorText = Colors.white;
  Color containerColor = const Color(0xff2E2F38);
  Color littleTextColor = const Color.fromRGBO(255, 255, 255, 0.4);
  //var heightB;

  late AnimationController _controller;
  late Animation<double> animScale;
  final textController = TextEditingController();
  final littleText = TextEditingController();
  late double displayHeight;
  late double displayWidth;
  late double sizeBigText = displayHeight * 0.092;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animScale = Tween<double>(begin: 0.7, end: 1.3).animate(_controller);
    textController.text = '0';
    littleText.text = '';
  }

  @override
  void dispose() {
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
    bgColor = const Color(0xff17171C);
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
        
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Cancel'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
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
                    TextField(
                      style: sTextStyle(
                        color: littleTextColor,
                        size: size.height * 0.06,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.right,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: littleText,
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
                  ],
                ),
              ),
              RefreshIndicator(
                onRefresh: () async {
                  calculate();
                },
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                color: Colors.transparent,
                backgroundColor: Colors.transparent,
                child: GridView.count(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
              ),
            ],
          );
        }),
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

  void clear() {
    textController.text = '0';
    littleText.text = '';
    sizeBigText = displayHeight * 0.092;
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
            BoxShadow(color: Colors.white, blurRadius: 8, spreadRadius: 2),
          ],
          color: color,
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
