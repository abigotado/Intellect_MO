import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intellect_mo/controllers/teacher_page_controller.dart';
import 'package:intellect_mo/utils/icons.dart';
import 'package:intellect_mo/widgets/product_description/product_description.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({final Key key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
        body: GetBuilder<TeacherPageController>(
      init: TeacherPageController(),
      builder: (final TeacherPageController controller) {
        return controller.teacher != null
            ? Stack(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: controller.teacher.photo,
                        height: 450.h,
                        fit: BoxFit.cover,
                        placeholder: (final BuildContext context,
                                final String url) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.w, top: 10.h),
                          child: FloatingActionButton.small(
                            heroTag: '1',
                            elevation: 0,
                            backgroundColor: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: AppIcons.arrowLeft(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DraggableScrollableSheet(
                    minChildSize: 0.5,
                    builder: (
                      final BuildContext context,
                      final ScrollController scrollController,
                    ) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                            top: 30.h,
                            right: 25.w,
                          ),
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            controller: scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      '${controller.teacher.name} ${controller.teacher.patronimic}\n${controller.teacher.surname}',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    FloatingActionButton.small(
                                      heroTag: '2',
                                      elevation: 0,
                                      backgroundColor: const Color(0xFF518CFF),
                                      onPressed: () {
                                        launch(
                                            'tel://${controller.teacher.phone}');
                                      },
                                      child: SvgPicture.asset(
                                          'assets/icons/phone_filled.svg'),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  controller.teacher.title,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF001133)
                                          .withOpacity(0.4)),
                                ),
                                SizedBox(height: 15.h),
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: controller.teacher.name +
                                            ' ' +
                                            controller.teacher.patronimic,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const TextSpan(text: ' - '),
                                      TextSpan(
                                        text: controller.teacher.description,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const Text(
                                            'Обучает:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // ignore: always_specify_types
                                          for (var lesson
                                              in controller.teacher.lessons)
                                            ProductDescription(
                                                markerColor: Colors.red,
                                                description: Text(lesson)),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          const Text(
                                            'Помогает с:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // ignore: always_specify_types
                                          for (var helpItem
                                              in controller.teacher.help)
                                            ProductDescription(
                                              description: Text(helpItem),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: controller
                                          .videoController.value.isInitialized
                                      ? AspectRatio(
                                          aspectRatio: controller
                                              .videoController
                                              .value
                                              .aspectRatio,
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: <Widget>[
                                              VideoPlayer(
                                                  controller.videoController),
                                              _ControlsOverlay(
                                                  controller: controller
                                                      .videoController),
                                              VideoProgressIndicator(
                                                  controller.videoController,
                                                  allowScrubbing: true),
                                            ],
                                          ),
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            : const Expanded(child: Center(child: CircularProgressIndicator()));
      },
    ));
  }
}

class _ControlsOverlay extends StatelessWidget {
  // ignore: prefer_final_parameters
  const _ControlsOverlay({@required this.controller, final Key key})
      : super(key: key);

  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (final double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (final BuildContext context) {
              return <PopupMenuEntry<double>>[
                for (final double speed in _examplePlaybackRates)
                  // ignore: always_specify_types
                  PopupMenuItem(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}
