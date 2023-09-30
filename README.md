# [dependency_inject](https://youtu.be/2YEkdaE0-j4?si=nexkxjJBXITvn9GK)
Dependency Injection in Flutter.

## Getting Started
pubspec.yaml
```yaml
dependencies:
  get_it: ^7.6.4
```

lib/injection_container.dart
```dart
import 'package:dependency_inject/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  debugPrint("setupLocator singleton instance is being created.");

  // Initialize services when the application starts
  locator.registerSingleton(() => AppService());

  // Initialize services lazily when they are first requested
  locator.registerLazySingleton(() => AppService());

  // Initialize services when they are requested
  locator.registerFactory(() => AppService());
}
```

lib/main.dart
```dart
  setupLocator();
  runApp(const MyApp());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  //final AppService _appService = AppService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'FLUTTER GUYS',
            style: TextStyle(fontSize: 14),
          ),
          backgroundColor: const Color(0xff1D1E22)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                String currentDate = locator<AppService>().execute();
                showSnackBar(currentDate, context);
              },
```

