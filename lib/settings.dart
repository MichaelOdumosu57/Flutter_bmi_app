import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'util.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int unit = 0;
  final Map<int, Widget> systems = const <int, Widget>{
    0: Text('Metric'),
    1: Text('Imperial'),
  };
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Util.getSettings().then(updateControl);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.network(
                "https://images.theconversation.com/files/379516/original/file-20210119-15-tmyvf4.jpg?ixlib=rb-1.1.0&q=15&auto=format&w=320&h=180&fit=crop&dpr=3"),
            Util.paddingTop,
            Row(
              children: [
                SizedBox(
                  width: width,
                  child: CupertinoSegmentedControl(
                      groupValue: unit,
                      children: systems,
                      onValueChanged: (int value) {
                        Util.saveSettings(value);
                        updateControl(value);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void updateControl(int value) {
    if (value != unit) {
      setState(() {
        unit = value;
      });
    }
  }
}
