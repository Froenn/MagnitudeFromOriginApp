import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'package:scroller_app/states/field_util.dart';
import 'package:scroller_app/widgets/distance_view.dart';
import 'package:scroller_app/widgets/fab_drawer.dart';

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
        floatingActionButton: FabDrawer(
          onMidPressed: () => fieldProvider.swapUnits(),
          midIcon: Icon(Icons.straighten),
          midToolTip: "Units",
          hasMid: true,
          onBotPressed: () => fieldProvider.reset(),
          botIcon: Icon(Icons.settings_backup_restore),
          botToolTip: "Reset",
          hasBot: true,
          toggleToolTip: "Menu",
          themeData: ThemeData.dark(),
        ),
      ),
      onHorizontalSwipe: (SwipeDirection direction) => fieldProvider.move(direction),
      onVerticalSwipe: (SwipeDirection direction) => fieldProvider.move(direction),
    );
  }
}