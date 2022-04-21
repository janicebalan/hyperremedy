import 'package:get_it/get_it.dart';

import '../services/rest.dart';
import '../screens/user/user_viewmodel.dart';

import '../services/auth/auth_service.dart';
import '../services/auth_signup/auth_service_signup.dart';
// import '../services/counter/counter_service.dart';

import '../services/auth/auth_service_rest.dart';
import '../services/auth_signup/auth_service_signup_rest.dart';
// import '../services/counter/counter_service_rest.dart';

// import '../services/auth/auth_service_mock.dart';
// import '../services/counter/counter_service_mock.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services
  dependency.registerLazySingleton<RestService>(
    //localhost
    // () => RestService(baseUrl: 'http://192.168.0.112:3000'),

    //firebase
    () => RestService(
        baseUrl: 'http://192.168.0.112:5001/hyperremedy-61c71/us-central1/api'),

    //firebase online

    // () => RestService(
    //     baseUrl:
    //         'https://us-central1-hyperremedy-61c71.cloudfunctions.net/api'),
  );

  //Dependency Inversion Principle

  // dependency.registerLazySingleton<CounterService>(() => CounterServiceRest());
  dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
  dependency
      .registerLazySingleton<AuthServiceSignup>(() => AuthServiceSignupRest());
  // dependency.registerLazySingleton<CounterService>(() => CounterServiceMock());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceMock());

  // Viewmodels
  dependency.registerLazySingleton(() => UserViewmodel());
}
