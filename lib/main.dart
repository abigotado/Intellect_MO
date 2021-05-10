import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intellect_mo/widgets/banner/banner.dart';
import 'package:intellect_mo/widgets/price_item/price_item.dart';
import 'package:intellect_mo/widgets/price_item/type.dart';
import 'package:flutter_svg/flutter_svg.dart';

final String mentalArithmeticIcon = 'assets/icons/pendilum.svg';
final String brainIntellect = 'assets/icons/square-academic-cap.svg';
final String learnReading = 'assets/icons/textbook.svg';
final String fastReading = 'assets/icons/books.svg';
final String schoolPreparation = 'assets/icons/backpack.svg';
final String homework = 'assets/icons/evaluation.svg';
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
    PriceItemType(
        icon: mentalArithmeticIcon,
        name: "Ментальная арифметика",
        price: 1450,
        description:
            "Ментальная арифметика — это один из методов развития дейтского интеллекта, при котором применяется быстрый счёт в уме. На первом этапе ребёнок считает с помощью специальных счёт - абакуса. При этом также тренируется мелкую моторика рук. Затем он учится считать на так называемых воображаемых счётах — представляет абакус в голове. То есть считает ментально. Это позволяет развить творческое мышление и воображение. Таким образом, ментальная арифметика позволяет развивать различные интеллектуальные способности в комплексе. Кроме того, ребёнок овладевает моментальным устным счётом. В итоге ему становится значитльно проще осуществлять различную творческую и интеллектуальную деятельность. Кроме того, ребёнок учится быстро решать различные задачи, прибегая к нестандартным подходам.",
        image: 'assets/images/mentari.jpg'),
    PriceItemType(
        icon: brainIntellect,
        name: "Развитие мозга, памяти и интеллекта",
        price: 1450,
        image: 'assets/images/brainintellect.jpg'),
    PriceItemType(
        icon: learnReading,
        name: "Обучение чтению",
        price: 1450,
        image: 'assets/images/learnreading.jpg'),
    PriceItemType(
        icon: fastReading,
        name: "Скорочтение и техника чтения",
        price: 1450,
        image: 'assets/images/fastreading.jpg'),
    PriceItemType(
        icon: schoolPreparation,
        name: "Подготовка к школе",
        price: 1450,
        image: 'assets/images/schoolprep.jpg'),
    PriceItemType(
        icon: homework,
        name: "Помощь с домашними заданиями",
        price: 1000,
        image: 'assets/images/homework.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Scaffold(
          backgroundColor: Color.fromRGBO(248, 250, 255, 1),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: priceListItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return PriceItem(value: priceListItems[index]);
                          })),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: FirstLessonInfo(
                          icon: svg, text: "Первое занятие бесплатно!")),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: Text(
              "Наши занятия".toUpperCase(),
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Color(0xFFF8FAFF),
            centerTitle: true,
            elevation: 0,
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
