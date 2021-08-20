import 'package:clean_dart/app/auth/domain/entities/logged_user.dart';
import 'package:clean_dart/app/auth/domain/usecases/login_usecases.dart';

abstract class AuthDataSource {
  Future<LoggedUser> login(CreditialParams params);
}
