import 'package:get_it/get_it.dart';
import 'package:hyperremedy/services/auth_signup/auth_service_firebase_token_signup.dart';

import '../screens/food/food_viewmodel.dart';
import '../screens/login/login_viewmodel.dart';
import '../screens/medicine/medicine_viewmodel.dart';
import '../screens/register/register_viewmodel.dart';
import '../screens/symptoms/symptoms_viewmodel.dart';
import '../services/auth/auth_service_secured_rest.dart';
import '../services/bloodpressure/bloodpressure_service.dart';
import '../services/bloodpressure/bloodpressure_service_rest.dart';
import '../services/food/food_service.dart';
import '../services/food/food_service_rest.dart';
import '../services/medicine/medicine_service.dart';
import '../services/medicine/medicine_service_rest.dart';
import '../services/reminder/reminder_service.dart';
import '../services/reminder/reminder_service_rest.dart';
import '../services/rest.dart';
import '../screens/user/user_viewmodel.dart';

import '../services/auth/auth_service.dart';
import '../services/auth_signup/auth_service_signup.dart';
// import '../services/counter/counter_service.dart';

// import '../services/auth/auth_service_rest.dart';
// import '../services/auth_signup/auth_service_signup_rest.dart';
import '../services/symptoms/symptoms_service.dart';
import '../services/symptoms/symptoms_service_rest.dart';
import '../services/user/user_service.dart';
import '../services/user/user_service_rest.dart';
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
    // () => RestService(
    //     baseUrl: 'http://192.168.0.112:5001/hyperremedy-61c71/us-central1/api',
    //     enableSession: true),

    //firebase online

    () => RestService(
        baseUrl: 'https://us-central1-hyperremedy-61c71.cloudfunctions.net/api',
        enableSession: true),
  );

  //Dependency Inversion Principle

  // dependency.registerLazySingleton<CounterService>(() => CounterServiceRest());
  //dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
  dependency.registerLazySingleton<AuthService>(() => AuthServiceSecuredRest());
  dependency.registerLazySingleton<UserService>(() => UserServiceRest());
  dependency.registerLazySingleton<AuthServiceSignup>(
      () => AuthServiceSignupFirebaseToken());

  dependency.registerLazySingleton<FoodService>(() => FoodServiceRest());
  dependency
      .registerLazySingleton<ReminderService>(() => ReminderServiceRest());
  dependency
      .registerLazySingleton<MedicineService>(() => MedicineServiceRest());
  dependency.registerLazySingleton<BloodPressureService>(
      () => BloodPressureServiceRest());
  dependency
      .registerLazySingleton<SymptomsService>(() => SymptomsServiceRest());
  // dependency
  //     .registerLazySingleton<AuthServiceSignup>(() => AuthServiceSignupRest());

  // dependency.registerLazySingleton<CounterService>(() => CounterServiceMock());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceMock());

  // Viewmodels
  dependency.registerLazySingleton(() => UserViewmodel());
  dependency.registerLazySingleton(() => RegisterViewmodel());
  dependency.registerLazySingleton(() => FoodViewmodel());
  dependency.registerLazySingleton(() => SymptomsViewmodel());
  dependency.registerLazySingleton(() => MedicineViewmodel());
  dependency.registerLazySingleton(() => LoginViewmodel());
}
