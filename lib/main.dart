import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msig_assignment_test/dependency_injection.dart';
import 'package:msig_assignment_test/features/favorite_food/presentation/bloc/favorite_food_bloc.dart';
import 'package:msig_assignment_test/features/food_detail/presentation/bloc/food_detail/food_detail_bloc.dart';
import 'package:msig_assignment_test/features/food_detail/presentation/bloc/set_favorite/set_favorite_bloc.dart';
import 'package:msig_assignment_test/features/food_list/presentation/bloc/category/category_bloc.dart';
import 'package:msig_assignment_test/features/food_list/presentation/bloc/food_list/food_list_bloc.dart';
import 'package:msig_assignment_test/features/food_list/presentation/pages/food_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (_) => getIt()..add(FetchCategories()),
        ),
        BlocProvider<FoodListBloc>(
          create: (_) => getIt(),
        ),
        BlocProvider<FoodDetailBloc>(
          create: (_) => getIt(),
        ),
        BlocProvider<SetFavoriteBloc>(
          create: (_) => getIt(),
        ),
        BlocProvider<FavoriteFoodBloc>(
          create: (_) => getIt(),
        ),
      ],
      child: MaterialApp(
        title: 'MSIG Assignment Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FoodListPage(),
      ),
    );
  }
}
