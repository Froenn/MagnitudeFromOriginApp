import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:scroller_app/states/field_util.dart';

class DistanceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fP = Provider.of<FieldUtil>(context);
    var d = fP.distance;
    return Text("Distance from Origin: " + d.length.toStringAsFixed(3) + " " + d.units);
  }
}