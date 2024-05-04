import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'main.freezed.dart';
part 'main.g.dart';

@riverpod
String helloWorld(HelloWorldRef ref) {
  return 'hello world';
}

@freezed
class Activity with _$Activity {
  factory Activity({
    required String key,
    required String activity,
    required String type,
    required int participants,
    required double price,
  }) = _Activity;
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}

@riverpod
Future<Activity> activity(ActivityRef ref) async {
  // Using package:http, we fetch a random activity from the Bored API.
  final response = await http.get(Uri.https('boredapi.com', '/api/activity'));
  // Using dart:convert, we then decode the JSON payload into a Map data structure.
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  // Finally, we convert the Map into an Activity instance.
  return Activity.fromJson(json);
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Activity> activity = ref.watch(activityProvider);
    return Center(
      child: switch (activity) {
        AsyncData(:final value) => Text('Activity: ${value.activity}'),
        AsyncError() => const Text('Oops, something unexpected happened'),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("example"),
        ),
        body: const Home(),
      ),
    );
  }
}
