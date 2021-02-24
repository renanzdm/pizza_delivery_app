import 'package:pizza_delivery_app/app/helpers/rest_client.dart';
import 'package:pizza_delivery_app/app/models/menu_model.dart';

class MenuRepository {
  final RestClient _restClient;

  MenuRepository(this._restClient);

  Future<List<MenuModel>> findAll() async {
    final response = await _restClient.get<List<MenuModel>>(
      '/menu/',
      decoder: (resp) {
        if (resp is List) {
          return resp.map<MenuModel>((m) => MenuModel.fromMap(m)).toList();
        }
        return [];
      },
    );
    if (response.hasError) {
      throw RestClientException('Erro ao buscar cardapio');
    }
    return response.body;
  }
}
