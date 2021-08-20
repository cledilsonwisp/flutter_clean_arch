import 'package:clean_dart/app/auth/domain/entities/logged_user.dart';
import 'package:clean_dart/app/auth/domain/erros/erros.dart';
import 'package:clean_dart/app/auth/domain/repositories/auth_repository.dart';
import 'package:clean_dart/app/auth/domain/usecases/login_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// class AuthRepositoryMock implements AuthRepository {
//   @override
//   Future<Either<AuthException, LoggedUser>> login(
//       CreditialParams params) async {
//     if (params.password == "1234") {
//       return Left(AuthException('Repositorie error'));
//     }

//     return Right(LoggedUser(name: 'cledilson', email: params.email));
//   }
// }
class AuthRepositoryMock extends Mock implements AuthRepository {}

void main() {
  final repository = AuthRepositoryMock();
  final login = LoginUsecase(repository);
  final params = CreditialParams(email: 'cavbrcleg@gmail.com', password: '123');
  test('deve efetuar o login', () async {
    when(() => repository.login(params /* ou Any() */))
        .thenAnswer((_) async => Right(
              LoggedUser(email: params.email, name: 'cledilson'),
            ));
    final result = await login(params);

    expect(result.isRight(), true);
    expect(result.getOrElse(() => LoggedUser(name: '', email: "")).name,
        'cledilson');
  });

  test('deve dar error quando o email for inválido', () async {
    final result = await login(CreditialParams(email: 'ama', password: '123'));

    expect(result.isLeft(), true);
  });

  test('deve dar error quando a senha for inválida', () async {
    final result = await login(
        CreditialParams(email: 'cavbrcleg@gmail.com', password: ''));

    expect(result.isLeft(), true);
  });
  test('deve dar error quando o repository falhar', () async {
    // when( () => repository.login(any())).thenThrow(throwable) THEN THROW PARA ERROR
    when(() => repository.login(any()))
        .thenAnswer((_) async => Left(AuthException('')));
    final result = await login(params);

    expect(result.isLeft(), true);
  });
}
