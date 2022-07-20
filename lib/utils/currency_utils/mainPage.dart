

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:calculation/utils/currency_utils/routes.dart';
import '../const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'currency_model.dart';

class CurrPage extends StatefulWidget {
  const CurrPage({Key? key}) : super(key: key);

  @override
  State<CurrPage> createState() => _CurrPageState();
}

class _CurrPageState extends State<CurrPage> {
  final TextEditingController _editingControllerTop = TextEditingController();
  final TextEditingController _editingControllerBottom =
      TextEditingController();
  final FocusNode _topFocus = FocusNode();
  final FocusNode _bottomFocus = FocusNode();
  final List<CurrencyModel> _listCurrency = [];
  CurrencyModel? topCur;
  CurrencyModel? bottomCur;

  @override
  void initState() {
    super.initState();
    _editingControllerTop.addListener(() {
      if (_topFocus.hasFocus) {
        setState(() {
          if (_editingControllerTop.text.isNotEmpty) {
            double sum = double.parse(topCur?.rate ?? '0') /
                double.parse(bottomCur?.rate ?? '0') *
                double.parse(_editingControllerTop.text);
            _editingControllerBottom.text = sum.toStringAsFixed(2);
          } else {
            _editingControllerBottom.clear();
          }
        });
      }
    });
    _editingControllerBottom.addListener(() {
      if (_bottomFocus.hasFocus) {
        setState(() {
          if (_editingControllerBottom.text.isNotEmpty) {
            double sum = double.parse(bottomCur?.rate ?? '0') /
                double.parse(topCur?.rate ?? '0') *
                double.parse(_editingControllerBottom.text);
            _editingControllerTop.text = sum.toStringAsFixed(2);
          } else {
            _editingControllerTop.clear();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _editingControllerTop.dispose();
    _editingControllerBottom.dispose();
    _topFocus.dispose();
    _bottomFocus.dispose();
    super.dispose();
  }

  Future<bool?> _loadData() async {
    try {
      var response =
          await get(Uri.parse('https://cbu.uz/uz/arkhiv-kursov-valyut/json/'));
      if (response.statusCode == 200) {
        for (final item in jsonDecode(response.body)) {
          var model = CurrencyModel.fromJson(item);
          if (model.ccy == 'USD') {
            topCur = model;
          } else if (model.ccy == 'RUB') {
            bottomCur = model;
          }
          _listCurrency.add(model);
        }
        return true;
      } else {
        _showMessage('Unknown error');
      }
    } on SocketException {
      _showMessage('Connection error');
    } catch (e) {
      _showMessage(e.toString());
    }
    return null;
  }

  _showMessage(String text, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red : Colors.green[400],
        content: Text(
          text,
          style: sTextStyle(size: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 22, 41),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Hello Saidmirzo',
                      style: sTextStyle(
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    Text(
                      'Welcome back',
                      style: sTextStyle(
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white12,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: _listCurrency.isEmpty ? _loadData() : null,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 63, 63, 104),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Exchange',
                              style: sTextStyle(
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                exchange_valute(
                                    _editingControllerTop, topCur, _topFocus,(value){
                                      if(value is CurrencyModel){
                                        setState(()=> topCur=value);
                                      }
                                    }),
                                const SizedBox(
                                  height: 15,
                                ),
                                exchange_valute(_editingControllerBottom,
                                    bottomCur, _bottomFocus,(value){
                                      if(value is CurrencyModel){
                                        setState(()=> topCur=value);
                                      }
                                    }),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 25,
                                width: 25,
                                //padding: const EdgeInsets.only(top: 100),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 63, 63, 104),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white12),
                                ),
                                child: const Icon(
                                  Icons.currency_exchange,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        'Error',
                        style: sTextStyle(size: 18),
                      ),
                    ),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container exchange_valute(TextEditingController controller,
      CurrencyModel? model, FocusNode focusNode, Function callBack) {
    return Container(
      width: double.infinity,
      //height: 60,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  style: sTextStyle(size: 24, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: '0.00',
                    hintStyle:
                        sTextStyle(size: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.currencyPage, arguments: {'list_currency':_listCurrency, 'top_cur': topCur, 'bottom_cur': bottomCur}).then((value) => callBack(value)),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xff10a4d4),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SvgPicture.asset(
                          'assets/flags/${model?.ccy?.substring(0, 2).toLowerCase()}.svg',
                          height: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          model?.ccy ?? 'UNK',
                          style: sTextStyle(color: Colors.white, size: 22),
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              controller.text.isNotEmpty
                  ? (double.parse(controller.text) * 0.05).toStringAsFixed(2)
                  : '0.00',
              style: sTextStyle(
                  fontWeight: FontWeight.w600, color: Colors.white54),
            ),
          ),
        ],
      ),
    );
  }
}
