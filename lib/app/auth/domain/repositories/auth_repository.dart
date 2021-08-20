import 'package:clean_dart/app/auth/domain/entities/logged_user.dart';
import 'package:clean_dart/app/auth/domain/erros/erros.dart';
import 'package:clean_dart/app/auth/domain/usecases/login_usecases.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {

  Future<Either<AuthException, LoggedUser>> login(CreditialParams params);
}
