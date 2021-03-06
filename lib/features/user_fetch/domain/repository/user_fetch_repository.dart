import 'package:dartz/dartz.dart';
import 'package:github_exercise/core/error/app_failures.dart';
import 'package:github_exercise/features/user_fetch/data/data_sources/remote_data_sources.dart';
import 'package:github_exercise/features/user_fetch/data/models/github_user_model.dart';
import 'package:github_exercise/features/user_fetch/data/models/githup_repo_model.dart';
import 'package:github_exercise/features/user_fetch/data/models/search_result.dart';
import 'package:meta/meta.dart';

abstract class FetchUserRepository {
  Future<Either<ActionFailure, UserSearchResult>> search(String query);
  Future<Either<ActionFailure, GithubUser>> fetchUser(String login);
  Future<Either<ActionFailure, List<GithubRepo>>> fetchRepos(String login);
}

class FetchUserRepositoryImpl implements FetchUserRepository {
  final FetchUserData fetchUserData;

  FetchUserRepositoryImpl({@required this.fetchUserData});
  @override
  Future<Either<ActionFailure, GithubUser>> fetchUser(String login) async {
    try {
      return Right(await fetchUserData.fetchUser(login));
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<ActionFailure, UserSearchResult>> search(String query) async {
    try {
      return Right(await fetchUserData.search(query));
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<ActionFailure, List<GithubRepo>>> fetchRepos(
      String login) async {
    try {
      return Right(await fetchUserData.fetchUserRepos(login));
    } catch (e) {
      return Left(handleException(e));
    }
  }
}
