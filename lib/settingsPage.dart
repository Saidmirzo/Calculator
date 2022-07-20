import 'package:calculation/utils/const.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool digitBool = false;
  bool swipeBool = false;
  bool animDisableBool = false;
  bool leaveBool = false;
  bool vibrationBool = false;
  bool statusBarBool = false;

  void toggleSwitch(bool value, bool activeBool, int son) {
    bool temp = activeBool;
    switch (son) {
      case 1:
        digitBool = !digitBool;
        break;
      case 2:
        swipeBool = !swipeBool;
        break;
      case 3:
        animDisableBool = !animDisableBool;
        break;
      case 4:
        leaveBool = !leaveBool;
        break;
      case 5:
        vibrationBool = !vibrationBool;
        break;
      case 6:
        statusBarBool = !statusBarBool;
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Text(
                'SETTINGS',
                style: sTextStyle(
                    color: Colors.black, size: 22, fontWeight: FontWeight.w400),
              ),
              Text('THEMES',style: sTextStyle(
                    color: Colors.black, size: 22, fontWeight: FontWeight.w400),),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              // height: MediaQuery.of(context).size.height,
              color: const Color(0xffC4C4C4),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: const Alignment(-0.8, 0),
                    child: Text(
                      'Change the text of the main screen',
                      style: sTextStyle(size: 18, color: Colors.black54),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          style: sTextStyle(
                            color: Colors.black,
                            size: 30,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: const InputDecoration.collapsed(
                            border: OutlineInputBorder(),
                            hintText: 'Saidmirzo',
                            //labelText: 'Saidmirzo',
                          ),
                          //controller: textController,
                        ),
                      ),
                      InkWell(
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                )
                              ]),
                          alignment: Alignment.center,
                          child: Text(
                            'ok',
                            style: sTextStyle(color: Colors.black, size: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                  listSettings('Minimum accuracy',
                      'Limit minimum accurancy to 2 digits', digitBool, 1),
                  listSettings('Swipe to count',
                      'Swipe down the keyboard to calculate', swipeBool, 2),
                  listSettings(
                      'Disable text animation',
                      'Turn off text animation in the main section',
                      animDisableBool,
                      3),
                  listSettings(
                      'Leave the screen on',
                      'Disabale sleep mode while the application is running',
                      leaveBool,
                      4),
                  listSettings('turn off the vibration', '', vibrationBool, 5),
                  listSettings('hide status bar', '', statusBarBool, 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.info_outline),
                      Text(
                        'About',
                        style: sTextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          size: 25,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.green,
            )
            //Scaffold.of(context).openDrawer();
            //     GridView.count(
            //   crossAxisSpacing: 10,
            //   mainAxisSpacing: 10,
            //   childAspectRatio: 0.5,
            //   crossAxisCount: 2,
            //   children: [
            //     //     ListTile(
            //     //   title: const Text('Cancel'),
            //     //   onTap: () {
            //     //     Navigator.pop(context);
            //     //   },
            //     // ),
            //     calc_view_bottom('assets/calc9_img.jpg', _uiNine),
            //     calc_view_bottom('assets/calc7_img.jpg', _uiSeven),
            //     calc_view_bottom('assets/calc2_img.jpg', _uiTwo),
            //     calc_view_bottom('assets/calc4_img.jpg', _uiFour),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  ListTile listSettings(String title, String subTitle, bool active, int son) {
    return ListTile(
      title: Text(
        title,
        style: sTextStyle(color: Colors.black, size: 22),
      ),
      subtitle: Text(
        subTitle,
        style: sTextStyle(color: Colors.black38, size: 14),
      ),
      trailing: Switch(
        onChanged: (value) {
          toggleSwitch(value, active, son);
          setState(() {});
        },
        value: active,
        inactiveThumbColor: Colors.tealAccent,
        inactiveTrackColor: Colors.grey,
        activeColor: Colors.tealAccent,
        // ...
      ),
    );
  }
}
