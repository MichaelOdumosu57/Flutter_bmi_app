import 'package:cupertinobmi/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  late int unit;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: height * .8),
            child: Column(
              children: [
                Image.network(
                    'https://images.squarespace-cdn.com/content/v1/5d90f77944ab8f386aef4977/1597679744294-6K3F60CCHV98EIADZQSY/pure-core_bmitable-online_1200px.jpg?format=1000w'),
                Util.paddingTop,
                Row(
                  children: [
                    Util.paddingLeft,
                    SizedBox(
                      width: width / 3,
                      child: const Text('Height'),
                    ),
                    Expanded(
                      child: CupertinoTextField(
                        controller: heightController,
                      ),
                    ),
                    Util.paddingLeft,
                  ],
                ),
                Util.paddingTop,
                Row(
                  children: [
                    Util.paddingLeft,
                    SizedBox(
                      width: width / 3,
                      child: const Text('Weight'),
                    ),
                    Expanded(
                      child: CupertinoTextField(
                        controller: weightController,
                      ),
                    ),
                    Util.paddingLeft,
                  ],
                ),
                Expanded(child: Util.paddingTop),
                CupertinoButton.filled(
                    child: const Text("Calculate BMI"),
                    onPressed: () {
                      showResult();
                    }),
                Util.paddingTop
              ],
            ),
          ),
        ),
      ),
      navigationBar: const CupertinoNavigationBar(
        middle: Text('BMI'),
      ),
    );
  }

  void showResult() async {
    double height;
    double weight;
    int unit = await Util.getSettings();
    height = double.tryParse(heightController.text) ?? 0;
    weight = double.tryParse(weightController.text) ?? 0;
    double result = Util.calculateBMI(height, weight, unit);
    String message = 'Your BMI is ${result.toStringAsFixed(2)}';
    CupertinoAlertDialog dialog = CupertinoAlertDialog(
      title: Text('Result'),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}
