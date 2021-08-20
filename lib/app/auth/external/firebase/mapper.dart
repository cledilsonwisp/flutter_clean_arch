import 'package:clean_dart/app/auth/domain/entities/logged_user.dart';
import 'package:clean_dart/app/auth/domain/usecases/login_usecases.dart';

class LoggedUserMapper {
  static LoggedUser fromJson(Map json) {
    return LoggedUser(name: json['name'], email: json['email']);
  }
}
