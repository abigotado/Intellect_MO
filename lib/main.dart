import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intellect_mo/widgets/price_item/price_item.dart';
import 'package:intellect_mo/widgets/price_item/type.dart';
import 'package:flutter_svg/flutter_svg.dart';

final String watches = 'assets/icons/timeicon.svg';
final Widget svg = SvgPicture.asset(
  watches,
  width: 26,
  height: 26,
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final List<PriceItemType> priceListItems = [
    PriceItemType(name: "Ментальная арифметика", price: 1450),
    PriceItemType(name: "Интеллектуальное развитие", price: 1450),
    PriceItemType(name: "Техника чтения", price: 1450),
    PriceItemType(name: "Скорочтение", price: 1450),
    PriceItemType(name: "Подготовка к школе", price: 1450),
    PriceItemType(name: "Помощь с домашними заданиями", price: 1000),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromRGBO(248, 250, 255, 1),
          body: SafeArea(
            child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: priceListItems.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Container(
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(81, 140, 255, 1)),
                        width: 325,
                        height: 100,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                width: 76,
                                height: 76,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 4,
                                        color:
                                            Color.fromRGBO(248, 250, 255, 1)),
                                    borderRadius: BorderRadius.circular(38)),
                                child: Center(child: SvgPicture.asset(watches))),
                            Text("Первое занятие бесплатно!",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Color.fromRGBO(255, 255, 255, 1))),
                          ],
                        ));
                  }
                  int numberOfExtraWidget =
                      1; // here we have 1 ExtraWidget i.e Container.
                  index = index - numberOfExtraWidget;
                  return PriceItem(value: priceListItems[index]);
                }),
          ),
          appBar: AppBar(
            title: Text("Стоимость занятий"),
            backgroundColor: Color.fromRGBO(81, 140, 255, 1),
          )),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
