import 'package:calculation/utils/const.dart';
import 'package:flutter/material.dart';

late var _decoration;
late Color _listColor;
late Color _darkColor;
String _dropDownValue = 'salomS';

bool _show = false;

class RulePage extends StatefulWidget {
  RulePage(var decoration, Color color, Color darkColor, {Key? key})
      : super(key: key) {
    _decoration = decoration;
    _listColor = color;
    _darkColor = darkColor;
  }

  @override
  State<RulePage> createState() => _RulePageState();
}

class _RulePageState extends State<RulePage> {
  final TextStyle _textStyle =
      sTextStyle(color: Colors.black, size: 16, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 5,
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Text(
                'DISTANCE',
                style: _textStyle,
              ),
              Text(
                'AREA',
                style: _textStyle,
              ),
              Text(
                'MASSA',
                style: _textStyle,
              ),
              Text(
                'VOLUME',
                style: _textStyle,
              ),
              Text(
                'TEMPERATURE',
                style: _textStyle,
              ),
              Text(
                'FUEL',
                style: _textStyle,
              ),
              Text(
                'COOKING',
                style: _textStyle,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Container(
                  color: const Color(0xff1F2229),
                  //decoration: _decoration,
                  height: 200,
                ),
                // DropdownButton(

                //   hint: _dropDownValue == null
                //       ? Text('Dropdown')
                //       : Text(
                //           _dropDownValue,
                //           style: TextStyle(color: Colors.blue),
                //         ),
                //   isExpanded: true,
                //   iconSize: 30.0,
                //   style: TextStyle(color: Colors.blue),
                //   items: ['One', 'Two', 'Three'].map(
                //     (val) {
                //       return DropdownMenuItem<String>(
                //         value: val,
                //         child: Text(val),
                //       );
                //     },
                //   ).toList(),
                //   onChanged: (val) {
                //     setState(
                //       () {
                //         _dropDownValue = val.toString();
                //       },
                //     );
                //   },
                // ),
                Text('cantimetr'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children:const [
                        Text(
                          'cm',
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined),
                      ],
                    ),
                    Text('1'),
                  ],
                ),
                BottomSheet(
                  onClosing: () {},
                  builder: (context) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        child: Text("Close Bottom Sheet"),
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          //_show = false;
                          setState(() {});
                        },
                      ),
                    );
                  },
                ),
                listDistance('kilometr', 'km', '0.001', 1),
                listDistance('millimeter', 'mm', '0.001', 2),
                listDistance('camtimetr', 'cm', '0.001', 1),
                listDistance('mile', 'mi', '0.001', 2),
                listDistance('yard', 'yd', '0.001', 1),
                listDistance('foot', 'ft', '0.001', 2),
                listDistance('inch', 'in', '0.001', 1),
                listDistance('nautical mile', 'nmi', '0.001', 2),
              ],
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              height: 50,
              color: Colors.green,
            ),
            Container(
              height: 50,
              color: Colors.red,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  ListTile listDistance(
      String title, String subTitle, String valueText, int i) {
    return ListTile(
        tileColor: i == 1 ? const Color(0xff32363F) : const Color(0xff494F5C),
        title: Text(
          title,
          style: sTextStyle(color: Colors.black, size: 22),
        ),
        subtitle: Text(
          subTitle,
          style: sTextStyle(color: Colors.black38, size: 14),
        ),
        trailing: Text(
          valueText,
          style: sTextStyle(color: Colors.black, size: 20),
        ));
  }

  Widget _showBottomSheet() {
    if (_show) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text("Close Bottom Sheet"),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.green,
              ),
              onPressed: () {
                _show = false;
                setState(() {});
              },
            ),
          );
        },
      );
    } else {
      return SizedBox();
    }
  }
}
