import 'package:pizza_delivery_app/app/helpers/rest_client.dart';
import 'package:pizza_delivery_app/app/models/user_model.dart';
import 'package:pizza_delivery_app/app/view_models/register_user_input_model.dart';

class UserRepository {
  final RestClient restClient;

  UserRepository(this.restClient);

  Future<UserModel> login(String email, String password) async {
    final response = await restClient.post(
        '/user/auth', {'email': email, 'password': password}, decoder: (resp) {
      if (resp != '') {
        return UserModel.fromMap(resp);
      }
    });
    if (response.hasError) {
      String message = 'Erro ao autenticar usuario ';

      if (response.statusCode == 403) {
        message = 'Usuario ou senha invalidos';
      }
      throw RestClientException(message);
    }
    return response.body;
  }

  Future<void> registerUser(RegisterUserInputModel inputModel) async {
    final response = await restClient.post(
      '/user/',
      {
        'name': inputModel.name,
        'email': inputModel.email,
        'password': inputModel.password
      },
    );
    if (response.hasError) {
      print(response.body);
      throw RestClientException(response.body['message']);
    }
  }
}
