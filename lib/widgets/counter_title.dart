import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eventbus/events/counter_increment_event.dart';
import 'package:flutter_eventbus/providers.dart';

class CounterTitle extends StatefulWidget {
  const CounterTitle({Key? key}) : super(key: key);

  @override
  State<CounterTitle> createState() => _CounterTitleState();
}

class _CounterTitleState extends State<CounterTitle> {
  String title = 'Counter < 5';

  @override
  void initState() {
    super.initState();
    getIt<EventBus>().on<CounterIncrementEvent>().listen((event) {
      if (event.value > 5) {
        setState(() => title = 'Counter > 5');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
