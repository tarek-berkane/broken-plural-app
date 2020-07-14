import 'package:broken_plural_ar/core/services/routing/navigation_service.dart';

// packages
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
