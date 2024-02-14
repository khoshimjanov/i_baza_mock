import 'package:flutter/material.dart';
import 'package:ibaza_mock_data/features/category/data/repository/category.dart';
import 'package:ibaza_mock_data/features/category/presentation/bloc/category_bloc.dart';
import 'assets/constants/routes/app_route.dart';
import 'core/injector/injector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  CategoryBloc(response: CategoryRepository())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'I_baza',
          navigatorKey: _navigatorKey,
          onGenerateRoute: AppRoute.onGenerateRoute,
        ),
      );
}
