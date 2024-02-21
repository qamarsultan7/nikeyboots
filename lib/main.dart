import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nikeyboots/Bloc/Bill%20Counter/billcounter_bloc.dart';
import 'package:nikeyboots/Bloc/NavigationDrawer/home_bloc.dart';
import 'package:nikeyboots/Bloc/Selected/selected_item_bloc.dart';
import 'package:nikeyboots/Bloc/bloc/bottom_navigation_bloc.dart';
import 'package:nikeyboots/Hive/Models/hive_model.dart';
import 'package:nikeyboots/view/home_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(FavItmsModelAdapter());
  await Hive.openBox<CartModel>('ShoesCart');
  await Hive.openBox<FavItmsModel>('Shoesfav');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationDrawerBloc()),
          BlocProvider(create: (context) => BottomNavigationBloc()),
          BlocProvider(create: (context) => BillcounterBloc()),
          BlocProvider(create: (context) => SelectedItemBloc())
        ],
        child: RestartWidget(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              inputDecorationTheme: const InputDecorationTheme(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
              scaffoldBackgroundColor: const Color.fromARGB(255, 243, 243, 244),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          ),
        ));
  }
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
