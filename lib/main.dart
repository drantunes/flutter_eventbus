import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eventbus/app.dart';
import 'package:flutter_eventbus/events/counter_increment_event.dart';
import 'package:flutter_eventbus/providers.dart';

void main() {
  setupProviders();

  getIt<EventBus>().on().listen((event) {
    if (event is CounterIncrementEvent) {
      debugPrint('Contador: ${event.value}');
    }
  });

  runApp(const App());
}
