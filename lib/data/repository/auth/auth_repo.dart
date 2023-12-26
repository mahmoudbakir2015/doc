import '../../model/auth_model.dart';
import '../../service/auth/auth_service.dart';

class AuthRepo {
  AuthService authService;
  AuthRepo({required this.authService});
  Future<AuthModel> createUser({required dynamic data}) async {
    return AuthModel.fromJson(
      await authService.createUser(
        data: data,
      ),
    );
  }

  Future<dynamic> checkuser({required dynamic data}) async {
    return AuthModel.fromJson(
      await authService.checkuser(
        data: data,
      ),
    );
  }

  Future<dynamic> logOut({required String authorization}) async {
    return AuthModel.fromJson(
      await authService.logOut(
        authorization: authorization,
      ),
    );
  }
}
