import 'package:flutter/material.dart';

class SmartListView extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final Function onListEndReached;

   SmartListView({
    required this.itemCount,
    required this.itemBuilder,
   // required this.padding,
    required this.onListEndReached,
  });

  @override
  State<SmartListView> createState() => _SmartListViewState();
}

class _SmartListViewState extends State<SmartListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        // start
        if (_scrollController.position.pixels == 0) {
          debugPrint("start the list reached");
        } else {
          debugPrint("end the list reached");
          widget.onListEndReached();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        itemCount: widget.itemCount,
        itemBuilder: widget.itemBuilder);

  }
}
