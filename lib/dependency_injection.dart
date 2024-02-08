import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:get_it/get_it.dart';
import 'package:msig_assignment_test/core/database/app_database.dart';
import 'package:msig_assignment_test/core/database/dao/food_detail_dao.dart';
import 'package:msig_assignment_test/features/favorite_food/data/repositories/favorite_food_repository_impl.dart';
import 'package:msig_assignment_test/features/favorite_food/domain/repositories/favorite_food_repository.dart';
import 'package:msig_assignment_test/features/favorite_food/domain/usecases/fetch_favorite_food.dart';
import 'package:msig_assignment_test/features/favorite_food/presentation/bloc/favorite_food_bloc.dart';
import 'package:msig_assignment_test/features/food_detail/data/datasources/remote/food_detail_remote_source.dart';
import 'package:msig_assignment_test/features/food_detail/data/repositories/food_detail_repository_impl.dart';
import 'package:msig_assignment_test/features/food_detail/domain/repositories/food_detail_repository.dart';
import 'package:msig_assignment_test/features/food_detail/domain/usecases/add_to_favorite.dart';
import 'package:msig_assignment_test/features/food_detail/domain/usecases/check_is_favorite_food.dart';
import 'package:msig_assignment_test/features/food_detail/domain/usecases/fetch_food_detail.dart';
import 'package:msig_assignment_test/features/food_detail/domain/usecases/remove_from_favorite.dart';
import 'package:msig_assignment_test/features/food_detail/presentation/bloc/food_detail/food_detail_bloc.dart';
import 'package:msig_assignment_test/features/food_detail/presentation/bloc/set_favorite/set_favorite_bloc.dart';
import 'package:msig_assignment_test/features/food_list/data/datasources/food_list_remote_source.dart';
import 'package:msig_assignment_test/features/food_list/data/repositories/food_list_repository_impl.dart';
import 'package:msig_assignment_test/features/food_list/domain/repositories/food_list_repository.dart';
import 'package:msig_assignment_test/features/food_list/domain/usecases/fetch_category.dart';
import 'package:msig_assignment_test/features/food_list/domain/usecases/fetch_food_list.dart';
import 'package:msig_assignment_test/features/food_list/presentation/bloc/category/category_bloc.dart';
import 'package:msig_assignment_test/features/food_list/presentation/bloc/food_list/food_list_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  getIt.registerSingleton<Dio>(Dio());

  // Drift
  getIt.registerLazySingleton<AppDatabase>(
      () => AppDatabase(NativeDatabase.memory()));
  getIt.registerLazySingleton<FoodDetailDao>(() => FoodDetailDao(getIt()));

  // Remote Source
  getIt.registerSingleton<FoodListRemoteSource>(FoodListRemoteSourceImpl());
  getIt.registerLazySingleton<FoodDetailRemoteSource>(
      () => FoodDetailRemoteSourceImpl());

  // Repository
  getIt.registerSingleton<FoodListRepository>(
      FoodListRepositoryImpl(remoteSource: getIt()));
  getIt.registerSingleton<FoodDetailRepository>(
      FoodDetailRepositoryImpl(remoteSource: getIt(), dao: getIt()));
  getIt.registerSingleton<FavoriteFoodRepository>(
      FavoriteFoodRepositoryImpl(dao: getIt()));

  // Usecase
  getIt.registerSingleton<FetchCategoryUsecase>(
      FetchCategoryUsecase(foodRepository: getIt()));
  getIt.registerSingleton<FetchFoodListUsecase>(
      FetchFoodListUsecase(foodListRepository: getIt()));
  getIt.registerSingleton<FetchFoodDetailUsecase>(
      FetchFoodDetailUsecase(foodDetailRepository: getIt()));
  getIt.registerSingleton<AddToFavoriteUsecase>(
      AddToFavoriteUsecase(foodDetailRepository: getIt()));
  getIt.registerSingleton<RemoveFromFavoriteUsecase>(
      RemoveFromFavoriteUsecase(foodDetailRepository: getIt()));
  getIt.registerSingleton<CheckIsFavoriteFoodUsecase>(
      CheckIsFavoriteFoodUsecase(foodDetailRepository: getIt()));
  getIt.registerSingleton<FetchFavoriteFoodUsecase>(
      FetchFavoriteFoodUsecase(favoriteFoodRepository: getIt()));

  // BLoC
  getIt.registerFactory<CategoryBloc>(
      () => CategoryBloc(fetchCategoryUsecase: getIt()));
  getIt.registerFactory<FoodListBloc>(
      () => FoodListBloc(fetchFoodListUsecase: getIt()));
  getIt.registerFactory<FoodDetailBloc>(() => FoodDetailBloc(
        fetchFoodDetailUsecase: getIt(),
        checkIsFavoriteFoodUsecase: getIt(),
      ));
  getIt.registerFactory<SetFavoriteBloc>(() => SetFavoriteBloc(
      addToFavoriteUsecase: getIt(), removeFromFavoriteUsecase: getIt()));
  getIt.registerFactory<FavoriteFoodBloc>(
      () => FavoriteFoodBloc(fetchFavoriteFoodUsecase: getIt()));
}
