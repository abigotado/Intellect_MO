import 'package:flutter/material.dart';
import 'package:intellect_mo/widgets/banner/banner.dart';
import 'package:intellect_mo/widgets/price_item/price_item.dart';
import 'package:intellect_mo/widgets/price_item/type.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<PriceItemType> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final productsRef = FirebaseFirestore.instance.collection('products');
    productsRef.get().then((serverProducts) {
      List<PriceItemType> preparedProducts = [];
      for(var product in serverProducts.docs){
        PriceItemType prepareProduct = PriceItemType(name: product.get('name'), price: product.get('price'));
        preparedProducts.add(prepareProduct);
      }
      setState(() {
        products = preparedProducts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<PriceItemType> priceListItems = [
      PriceItemType(
          icon: mentalArithmeticIcon,
          name: "Ментальная арифметика",
          price: 1450,
          descriptionTitle: "Для чего нужна ментальная арифметика",
          description: [
            "Ментальная арифметика — это один из методов развития дейтского интеллекта, при котором применяется быстрый счёт в уме",
            "На первом этапе необходимо научиться считать с помощью специальных счётов - абакуса. При этом также тренируется мелкая моторика рук",
            "Затем можно переходить к так называемым воображаемым счётах. То есть представлять абакус в голове и считать ментально. Это позволяет развить творческое мышление и воображение",
            "Также ребёнок овладевает моментальным устным счётом. В итоге ему становится значительно проще осуществлять различную творческую и интеллектуальную деятельность",
            "Кроме того, ребёнок учится быстро решать различные задачи, прибегая к нестандартным подходам."
          ],
          image: 'assets/images/mentari.png'),
      PriceItemType(
          icon: brainIntellect,
          name: "Развитие мозга, памяти и интеллекта",
          price: 1450,
          descriptionTitle: "Мы развиваем:",
          description: [
            "Память — более 10 мнемотехник развития зрительной и слуховой памяти",
            "Логику — умение видеть закономерности, делать выводы, решать логические задачи",
            "Внимание — коцентрация, умение слышать педагога с первого раза",
            "Гибкость - нестандартность мышления, стремление к экспериментам",
            "Мышление — умение структурировать информацию",
            "Речь — богатый словарный запас, умение красиво ищлагать свои мысли",
            "Оба полушария головного мозга — всеми процессами в нашем организме управлет головной мозг и крайне важно улучшать эффективность его функцонирования. Так как каждому полушарию подчиняется противоположная рука, для развития одновременно обоих необзодимо выполнять специальные упражнения, в которых задейтвованы две руки, которые при этом выполняют действия независимо друг от друга"
          ],
          image: 'assets/images/brainintellect.png'),
      PriceItemType(
          icon: learnReading,
          name: "Обучение чтению",
          price: 1450,
          descriptionTitle: "Цели занятий:",
          description: [
            "Умение читать готовит детей к самостоятельной работе с текстом, его пониманию, а также прививает любовь к литературе",
            "В ходе занятий дети научатся правильному чтению со скоростью до 50-60 слов в минуту",
            "При этом развиваются внимание, мышление и все виды памяти"
          ],
          image: 'assets/images/learnreading.png'),
      PriceItemType(
          icon: fastReading,
          name: "Скорочтение и техника чтения",
          price: 1450,
          descriptionTitle: "Что такое скорочтение и зачем ему учиться",
          description: [
            "Скорочтение — это способность быстрого восприятия текстовой информации при использовании особых способов чтения.",
            "При должном развитии навыка скорость может составлять до 600 слов в минуту",
            "Мы обучаем методикам, позволяющим освоить скорочтение",
            "Научим рациональному, эффективному и осмысленному чтению",
            "Совершенствовуем технику и повышаем скорость чтения",
            "Курс рекомендован как детям, так и взрослым"
          ],
          image: 'assets/images/fastreading.png'),
      PriceItemType(
          icon: schoolPreparation,
          name: "Подготовка к школе",
          price: 1450,
          descriptionTitle: "Мы готовим ребёнка к школе заранее",
          description: [
            "Занятия проходят в игровой форме и носят развивающий характер",
            "В ходе занятий дети учатся не только чтению. У них формируется комплекс знаний об окружающем мире",
            "Ребёнок приучается к работе в коллективе, готовится к интеграции в школьную среду",
            "Рука ребёнка привыкает к письму, развивается его речь, навыки математики и логики",
            "Мы не просто адаптируем ребёнка к обучению в школе, мы развиваем его мышление"
          ],
          image: 'assets/images/schoolprep.png'),
      PriceItemType(
          icon: homework,
          name: "Помощь с домашними заданиями",
          price: 1000,
          descriptionTitle: "Мы развиваем у ребёнка интерес к учёбе",
          description: [
            "Больше никаких страданий при выполнении домашних заданий",
            "Ребёнок быстро и самостоятельно выполняет даже самые сложные упражнения",
            "Ребёнок сам тянется к знаниям, учёба теперь не скучная рутина, а увлекатеьный процесс саморазвития",
            "Вам остаётся радоваться его успехам",
            "У Вас появится свободное время для новых увлекательных занятий"
          ],
          image: 'assets/images/homework.png'),
    ];


    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFF8FAFF),
          padding: EdgeInsets.only(bottom: 115),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PriceItem(value: products[index]);
                      })),
              Container(
                  margin: EdgeInsets.only(left: 30, top: 5, right: 30),
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
        ));
  }
}