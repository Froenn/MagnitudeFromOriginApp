import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:scroller_app/states/field_util.dart';
import 'package:scroller_app/widgets/field.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<FieldUtil>(context).setDimensions(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Field();
  }
}