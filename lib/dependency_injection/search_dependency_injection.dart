import 'package:github_exercise/features/user_fetch/data/data_sources/remote_data_sources.dart';
import 'package:github_exercise/features/user_fetch/domain/repository/user_fetch_repository.dart';
import 'package:github_exercise/features/user_fetch/domain/use_cases/fetch_user.dart';
import 'package:github_exercise/features/user_fetch/domain/use_cases/fetch_user_repo.dart';
import 'package:github_exercise/features/user_fetch/domain/use_cases/search_user.dart';
import 'package:github_exercise/features/user_fetch/presentation/view_models/fetch_user_repos_View_model.dart';
import 'package:github_exercise/features/user_fetch/presentation/view_models/fetch_user_view_model.dart';
import 'package:github_exercise/features/user_fetch/presentation/view_models/search_view_model.dart';

import 'app_dependency_injection.dart';

registerSearchDependencies() {
  //VIEW MODELS
  AppDependencyInjection.di
      .registerFactory<SearchUserViewModel>(() => SearchUserViewModel(
            searchUsers: AppDependencyInjection.di(),
          ));
  AppDependencyInjection.di
      .registerFactory<FetchUserViewModel>(() => FetchUserViewModel(
            fetchUser: AppDependencyInjection.di(),
          ));
  AppDependencyInjection.di
      .registerFactory<FetchReposViewModel>(() => FetchReposViewModel(
            fetchUserGithubRepositories: AppDependencyInjection.di(),
          ));

  //USE CASES
  AppDependencyInjection.di.registerLazySingleton<SearchUsers>(
    () => SearchUsers(
      repository: AppDependencyInjection.di(),
    ),
  );
  AppDependencyInjection.di.registerLazySingleton<FetchUser>(
    () => FetchUser(
      repository: AppDependencyInjection.di(),
    ),
  );
  AppDependencyInjection.di.registerLazySingleton<FetchUserGithubRepositories>(
    () => FetchUserGithubRepositories(
      repository: AppDependencyInjection.di(),
    ),
  );

  //REPOSITORY
  AppDependencyInjection.di.registerLazySingleton<FetchUserRepository>(
    () => FetchUserRepositoryImpl(
      fetchUserData: AppDependencyInjection.di(),
    ),
  );

  //DATA SOURCES

  AppDependencyInjection.di.registerLazySingleton<FetchUserData>(
    () => FetchUserDataRemoteSource(),
  );
}
