import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';

import 'video_widget.dart';

class VideoList extends StatefulWidget {
  @override
  _SocialFeedScreenState createState() => _SocialFeedScreenState();
}

class _SocialFeedScreenState extends State<VideoList> {
  List<String> list = List<String>();
  @override
  void initState() {
    list.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4");
    list.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4");
    list.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4");
    list.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4");
    list.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
    list.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4");
    list.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4");
    list.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4");
    list.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4");
    list.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4");
    list.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4");
    list.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        InViewNotifierList(
          scrollDirection: Axis.vertical,
          initialInViewIds: ['0'],
          isInViewPortCondition:
              (double deltaTop, double deltaBottom, double viewPortDimension) {
            return deltaTop < (0.5 * viewPortDimension) &&
                deltaBottom > (0.5 * viewPortDimension);
          },
          itemCount: 10,
          builder: (BuildContext context, int index) {
            return Container(
              width: double.infinity,
              height: 300.0,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 1.0),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return InViewNotifierWidget(
                    id: '$index',
                    builder:
                        (BuildContext context, bool isInView, Widget child) {
                      return VideoWidget(play: isInView, url: list[index]);
                    },
                  );
                },
              ),
            );
          },
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 1.0,
            color: Colors.redAccent,
          ),
        )
      ],
    );
  }
}
