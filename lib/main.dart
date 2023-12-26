import 'package:doc/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:doc/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:doc/core/cashe_helper.dart';
import 'package:doc/core/dio_helper.dart';
import 'package:doc/core/observer.dart';
import 'package:doc/data/repository/app_repo/app_repo.dart';
import 'package:doc/data/service/app_service/app_service.dart';
import 'package:doc/presentation/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
            create: (context) => AppCubit(
                  appRepo: AppRepo(
                    appService: AppService(),
                  ),
                )),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Docdoc',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const SplashView(),
      ),
    );
  }
}
