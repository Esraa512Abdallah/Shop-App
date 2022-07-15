
import 'package:shop_app/data_layer/api/user_api/login_api.dart';
import 'package:shop_app/data_layer/model/login_model.dart';

class LoginRepository {
  final LoginApi loginApi ;

  LoginRepository({required this.loginApi});

  Future<List<LoginModel>?> repositoryUserData(String url) async {
    try {

      final userData = await loginApi.getUserData(url);

      //   print("repo allCharacters: $allCharacters");

      //   print(" repo allCharacters' Map : ${allCharacters.map((e) => CharacterModel.fromJson(e)).toList()}");


      return userData.map((e) => LoginModel.fromJson(e)).toList() ;

    } catch (e) {

      print("repo error is : $e");

      return [] ;
    }

  }
}