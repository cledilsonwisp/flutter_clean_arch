import 'package:clean_dart/app/auth/domain/usecases/login_usecases.dart';
import 'package:clean_dart/app/auth/domain/entities/logged_user.dart';
import 'package:clean_dart/app/auth/external/firebase/mapper.dart';
import 'package:clean_dart/app/auth/infra/datasources/auth_datasource.dart';

class FireBaseAuthImpl implements AuthDataSource {
  @override
  Future<LoggedUser> login(CreditialParams params) async {
    final map = {'name': 'cledilson', 'email': 'cavbrcleg@gmail.com'};

    return LoggedUserMapper.fromJson(map);
  }
}
