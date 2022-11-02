import 'package:flutter/material.dart';

const Map<String, dynamic> calculatorButtons = {
  "1": 1,
  "2": 2,
  "3": 3,
  "+": "add",
  "4": 4,
  "5": 5,
  "6": 6,
  "-": "substract",
  "7": 7,
  "8": 8,
  "9": 9,
  "/": "divide",
  "C": "cancel",
  "0": 0,
  "=": "equal",
  "X": "multiply",
};

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String result = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        output,
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      if (result.isNotEmpty)
                        Text(
                          result,
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.headline3?.copyWith(
                                color: Colors.green,
                              ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                color: Colors.grey.withOpacity(.2),
                child: GridView.builder(
                  itemCount: calculatorButtons.keys.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: ((context, index) {
                    var key = calculatorButtons.keys.toList()[index];
                    var value = calculatorButtons.values.toList()[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (value == "cancel") {
                            output = "0";
                            result = "";
                            return;
                          }

                          if (output == "0") {
                            output = "";
                          }

                          if (value == "equal") {
                            result = int.parse("+", onError: (_) {
                              return 0;
                            }).toString();
                            return;
                          }

                          output = output + key;
                        });
                      },
                      child: Container(
                        color: Colors.white,
                        margin: const EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            key,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
