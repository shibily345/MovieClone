import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/di/injecteble.config.dart';

final getIt = GetIt.instance;
@InjectableInit()
Future<void> configureInjection() async {
  await getIt.init(environment: Environment.prod);
}
