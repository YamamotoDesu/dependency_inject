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
