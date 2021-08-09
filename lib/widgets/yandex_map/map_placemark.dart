import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class _PlacemarkWidget extends StatefulWidget {
  @override
  _PlacemarkWidgetState createState() => _PlacemarkWidgetState();
}

class _PlacemarkWidgetState extends State<_PlacemarkWidget> {
  YandexMapController controller;
  static const Point _point = Point(latitude: 59.945933, longitude: 30.320045);
  final Placemark _placemark = Placemark(
    point: _point,
    onTap: (Placemark self, Point point) => print('Tapped me at ${point.latitude},${point.longitude}'),
    style: const PlacemarkStyle(
      opacity: 0.7,
      iconName: 'lib/assets/place.png',
    ),
  );

  final Placemark _placemarkWithDynamicIcon = Placemark(
    point: const Point(latitude: 30.320045, longitude: 59.945933),
    onTap: (Placemark self, Point point) => print('Tapped me at ${point.latitude},${point.longitude}'),
    style: PlacemarkStyle(
      opacity: 0.95,
      rawImageData: rawImageData,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: YandexMap(
                onMapCreated: (YandexMapController yandexMapController) async {
                  controller = yandexMapController;
                },
              )
          ),
          const SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      children: <Widget>[
                        const Text('Placemark with Assets Icon:'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ControlButton(
                                onPressed: () async {
                                  await controller!.addPlacemark(_placemark);
                                },
                                title: 'Add'
                            ),
                            ControlButton(
                                onPressed: () async {
                                  await controller!.removePlacemark(_placemark);
                                },
                                title: 'Remove'
                            ),
                          ],
                        ),
                        const Text('Placemark with Binary Icon:'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ControlButton(
                                onPressed: () async {
                                  await controller!.addPlacemark(_placemarkWithDynamicIcon);
                                },
                                title: 'Add'
                            ),
                            ControlButton(
                                onPressed: () async {
                                  await controller!.removePlacemark(_placemarkWithDynamicIcon);
                                },
                                title: 'Remove'
                            ),
                          ],
                        )
                      ]
                  )
              )
          )
        ]
    );
  }
}