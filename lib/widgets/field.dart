import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'package:scroller_app/states/field_util.dart';
import 'package:scroller_app/widgets/distance_view.dart';

class Field extends StatelessWidget {
  const Field({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fieldProvider = Provider.of<FieldUtil>(context);

    return SimpleGestureDetector(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: DistanceView(),
        ),
        body: Container(),
      ),
      onHorizontalSwipe: (SwipeDirection direction) => fieldProvider.move(direction),
      onVerticalSwipe: (SwipeDirection direction) => fieldProvider.move(direction),
    );
  }
}