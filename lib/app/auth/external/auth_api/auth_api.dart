import 'package:clean_dart/app/auth/domain/usecases/login_usecases.dart';
import 'package:clean_dart/app/auth/domain/entities/logged_user.dart';
import 'package:clean_dart/app/auth/infra/datasources/auth_datasource.dart';

class AuthApi implements AuthDataSource {
  @override
  Future<LoggedUser> login(CreditialParams params) async {
    return LoggedUser(name: "Cledilson", email: "cavbrcleg@gmail.com");
  }
}
