import 'package:get_it/get_it.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../data/repositories/sale_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/repositories/sale_repository.dart';
import '../../domain/usecases/user_usecases.dart';
import '../../domain/usecases/sale_usecases.dart';
import '../../presentation/bloc/user_bloc.dart';
import '../../presentation/bloc/sale_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Database
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // Repositories
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(database: sl()),
  );
  
  sl.registerLazySingleton<SaleRepository>(
    () => SaleRepositoryImpl(database: sl()),
  );

  // User Use cases
  sl.registerLazySingleton(() => GetAllUsersUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetUserByIdUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetUserByUsernameUseCase(repository: sl()));
  sl.registerLazySingleton(() => CreateUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => UpdateUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => DeleteUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => AuthenticateUserUseCase(repository: sl()));

  // Sale Use cases
  sl.registerLazySingleton(() => GetAllSalesUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetSaleByIdUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetSalesByEmployeeUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetSalesByClientUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetSalesByProductUseCase(repository: sl()));
  sl.registerLazySingleton(() => CreateSaleUseCase(repository: sl()));
  sl.registerLazySingleton(() => UpdateSaleUseCase(repository: sl()));
  sl.registerLazySingleton(() => DeleteSaleUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetTotalSalesByEmployeeUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetTotalSalesByClientUseCase(repository: sl()));

  // BLoCs
  sl.registerFactory(
    () => UserBloc(
      getAllUsersUseCase: sl(),
      getUserByIdUseCase: sl(),
      getUserByUsernameUseCase: sl(),
      createUserUseCase: sl(),
      updateUserUseCase: sl(),
      deleteUserUseCase: sl(),
      authenticateUserUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => SaleBloc(
      getAllSalesUseCase: sl(),
      getSaleByIdUseCase: sl(),
      getSalesByEmployeeUseCase: sl(),
      getSalesByClientUseCase: sl(),
      getSalesByProductUseCase: sl(),
      createSaleUseCase: sl(),
      updateSaleUseCase: sl(),
      deleteSaleUseCase: sl(),
      getTotalSalesByEmployeeUseCase: sl(),
      getTotalSalesByClientUseCase: sl(),
    ),
  );
}