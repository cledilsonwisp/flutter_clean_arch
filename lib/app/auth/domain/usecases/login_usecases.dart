import 'package:clean_dart/app/auth/domain/entities/logged_user.dart';
import 'package:clean_dart/app/auth/domain/erros/erros.dart';
import 'package:clean_dart/app/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';

abstract class ILoginUsecase {
  Future<Either<AuthException, LoggedUser>> call(CreditialParams params);
}

class LoginUsecase implements ILoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  @override
  Future<Either<AuthException, LoggedUser>> call(CreditialParams params) async {
    if (params.email.isEmpty) {
      //params.email.validate()
      // throw AuthException('Error email');
      return Left(throw AuthException('Error email'));
    }
    if (params.password.isEmpty) {
      // throw AuthException('Error password');
      return Left(AuthException('Error password'));
    }

    return await authRepository.login(params);
  }
}

class CreditialParams {
  //DTO, DATA TRANSFER OBJECT
  final String email; // final Email email;
  final String password;

  CreditialParams({required this.email, required this.password});
}

//EXEMPLO VALUE OBJECT
class Email {
  final String value;

  bool validate() {
    return isEmail(value);
  }

  Email(this.value);
}
