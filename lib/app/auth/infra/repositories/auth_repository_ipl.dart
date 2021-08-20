import 'package:clean_dart/app/auth/domain/erros/erros.dart';
import 'package:clean_dart/app/auth/domain/entities/logged_user.dart';
import 'package:clean_dart/app/auth/domain/repositories/auth_repository.dart';
import 'package:clean_dart/app/auth/infra/datasources/auth_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_dart/app/auth/domain/usecases/login_usecases.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Either<AuthException, LoggedUser>> login(CreditialParams params) async {
    try {
      final user = await authDataSource.login(params);
      return Right(user);
    } on AuthException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(AuthException(' $e Exception Error'));
    }
  }
}
