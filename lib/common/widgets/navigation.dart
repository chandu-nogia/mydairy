import 'package:flutter/material.dart';

import 'message.dart';



final _ctx = Keys.navigatorKey().currentState!;

_material(Widget widget) => MaterialPageRoute(builder: (context) => widget);

//! Routing => ....
navigationPop() => _ctx.pop();
navigationTo(Widget widget) => _ctx.push(_material(widget));
navigationRemoveUntil(Widget widget) =>
    _ctx.pushAndRemoveUntil(_material(widget), (Route route) => false);


// navigationToReplacement(Widget widget) => _ctx!.pushReplacement(_material(widget));
