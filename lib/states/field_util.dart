import 'dart:math';

import 'package:flutter/material.dart';

import 'package:simple_gesture_detector/simple_gesture_detector.dart' show SwipeDirection;

import 'package:scroller_app/models/distance.dart';

class FieldUtil with ChangeNotifier{
  double _width;
  double _height;

  void setDimensions(double w, double h){ 
    _width = w; 
    _height = h;
  }

  static const _origin = Point<double>(0,0);

  var _location = _origin;

  var _distance = Distance(0);

  get location => _location;
  get distance => _distance;

  void swapUnits(){
    _distance.swapSystems();
    notifyListeners();
  }

  void reset(){
    _location = _origin;
    _distance.magnitude = _location.magnitude;
    notifyListeners();
  }

  void move(SwipeDirection direction){
    var x = _location.x;
    var y = _location.y;

    switch (direction) {
      case SwipeDirection.up:
        _location = Point<double>(x, y - _height); // moves "down"
        break;
      case SwipeDirection.down:
        _location = Point<double>(x, y + _height); // moves "up"
        break;
      case SwipeDirection.left:
        _location = Point<double>(x + _width, y); // moves "right"
        break;
      case SwipeDirection.right:
        _location = Point<double>(x - _width, y); // moves "left"
        break;
      default:
    }

    _distance.magnitude = _location.magnitude;

    notifyListeners();
  }
}