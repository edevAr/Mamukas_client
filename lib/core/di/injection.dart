import 'package:get_it/get_it.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/user_usecases.dart';
import '../../presentation/bloc/user_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Database
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // Repositories
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(database: getIt()),
  );

  // Use Cases
  getIt.registerLazySingleton(() => GetAllUsersUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetUserByIdUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetUserByUsernameUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => CreateUserUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => UpdateUserUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => DeleteUserUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => AuthenticateUserUseCase(repository: getIt()));

  // BLoCs
  getIt.registerFactory(
    () => UserBloc(
      getAllUsersUseCase: getIt(),
      getUserByIdUseCase: getIt(),
      getUserByUsernameUseCase: getIt(),
      createUserUseCase: getIt(),
      updateUserUseCase: getIt(),
      deleteUserUseCase: getIt(),
      authenticateUserUseCase: getIt(),
    ),
  );
}