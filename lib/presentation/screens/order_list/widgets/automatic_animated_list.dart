import 'package:diffutil_dart/diffutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const Duration _kDuration = Duration(milliseconds: 300);

class AutomaticAnimatedList<T> extends StatefulWidget {
  const AutomaticAnimatedList({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.keyingFunction,
    this.insertDuration = _kDuration,
    this.removeDuration = _kDuration,
  });

  final List<T> items;
  final Widget Function(BuildContext, T, Animation<double>) itemBuilder;
  final Key Function(T item) keyingFunction;

  final Duration insertDuration;
  final Duration removeDuration;

  @override
  State<AutomaticAnimatedList<T>> createState() =>
      _AutomaticAnimatedListState<T>();
}

class _AutomaticAnimatedListState<T> extends State<AutomaticAnimatedList<T>> {
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();

  @override
  void didUpdateWidget(AutomaticAnimatedList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldKeys =
        oldWidget.items.map((T e) => oldWidget.keyingFunction(e)).toList();
    final newKeys =
        widget.items.map((T e) => widget.keyingFunction(e)).toList();

    for (final update in calculateListDiff<Key>(
      oldKeys,
      newKeys,
      detectMoves: false,
    ).getUpdatesWithData()) {
      if (update is DataInsert<Key>) {
        _listKey.currentState!.insertItem(
          update.position,
          duration: widget.insertDuration,
        );
      } else if (update is DataRemove<Key>) {
        if (_listKey.currentState != null) {
          _listKey.currentState!.removeItem(
            update.position,
            (BuildContext context, Animation<double> animation) =>
                oldWidget.itemBuilder(
              context,
              oldWidget.items[update.position],
              animation,
            ),
            duration: widget.removeDuration,
          );
        } else {
          print(_listKey.currentState.toString());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) => SliverAnimatedList(
        key: _listKey,
        initialItemCount: widget.items.length,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) =>
                widget.itemBuilder(context, widget.items[index], animation),
      );
}
