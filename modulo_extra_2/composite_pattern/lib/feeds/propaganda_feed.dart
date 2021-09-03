import 'package:composite_pattern/feeds/feed.dart';
import 'package:composite_pattern/feeds/ifeed.dart';
import 'package:flutter/material.dart';

class PropagandaFeed implements IFeed {
  @override 
  Widget render() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.blue,
        height: 100,
        width: double.maxFinite,
      ),
    );
  }

  @override
  Widget renderBottom() {
    throw UnimplementedError();
  }

  @override
  Widget renderContent() {
    throw UnimplementedError();
  }
}