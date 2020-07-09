import 'package:flutter/material.dart';

class FabDrawer extends StatefulWidget {
  FabDrawer({
      this.onTopPressed, 
      this.onMidPressed, 
      this.onBotPressed,
      this.topIcon,
      this.midIcon,
      this.botIcon,
      this.topToolTip,
      this.midToolTip,
      this.botToolTip,
      this.toggleToolTip,
      this.hasTop,
      this.hasMid,
      this.hasBot,
      this.themeData,
    });

  final Function() onTopPressed;
  final Function() onMidPressed;
  final Function() onBotPressed;
  final Widget topIcon;
  final Widget midIcon;
  final Widget botIcon;
  final String topToolTip;
  final String midToolTip;
  final String botToolTip;
  final String toggleToolTip;
  final bool hasTop;
  final bool hasMid;
  final bool hasBot;
  final ThemeData themeData;

  @override
  _FabDrawerState createState() => _FabDrawerState();
}

class _FabDrawerState extends State<FabDrawer>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: widget.themeData.floatingActionButtonTheme.foregroundColor,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget fab(Widget icon, Function() onPressed, String toolTip) {
    return Container(
      child: FloatingActionButton(
        child: icon,
        heroTag: null,
        onPressed: onPressed,
        tooltip: toolTip,
      ),
    );
  }

  Widget display(Widget fab, double translationalMultiplier, bool hide){
    return Transform(
              transform: Matrix4.translationValues(
                0.0,
                _translateButton.value * translationalMultiplier,
                0.0,
              ),
              child: Offstage(
                child: fab,
                offstage: !hide,
              ),
        );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: null,
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: widget.toggleToolTip,
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        display(fab(widget.topIcon, widget.onTopPressed, widget.topToolTip), 3.0, widget?.hasTop ?? false),
        display(fab(widget.midIcon, widget.onMidPressed, widget.midToolTip), 2.0, widget?.hasMid ?? false),
        display(fab(widget.botIcon, widget.onBotPressed, widget.botToolTip), 1.0, widget?.hasBot ?? false),
        toggle(),
      ],
    );
  }
}