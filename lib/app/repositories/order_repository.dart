import 'package:get/get.dart';
import 'package:pizza_delivery_app/app/helpers/rest_client.dart';
import 'package:pizza_delivery_app/app/models/order_model.dart';
import 'package:pizza_delivery_app/app/view_models/checkout_input_model.dart';

class OrderRepository {
  final RestClient _restClient;

  OrderRepository(this._restClient);

  Future<List<OrderModel>> findMyOrders(int userId) async {
    final Response<List<OrderModel>> response =
        await _restClient.get('/order/user/$userId', decoder: (resp) {
      if (resp is List) {
        return resp.map<OrderModel>((e) => OrderModel.fromMap(e)).toList();
      }
      return [];
    });

    if (response.hasError) {
      print(response.statusText);
      throw RestClientException('Erro ao buscar pedido');
    }
    return response.body;
  }

  Future saverOrders(CheckoutInputModel model) async {
    switch (model.paymentType) {
      case 'Cartao de Credito':
        model.paymentType = 'credito';

        break;
      case 'Cartao de Debito':
        model.paymentType = 'debito';

        break;
      case 'Dinheiro':
        model.paymentType = 'dinheiro';

        break;
    }
    print(model.toMap());
    final response = await _restClient.post('/order/', model.toMap());

    if (response.hasError) {
      print("erro ${response.body}");
      throw RestClientException('Erro ao registrar order');
    }
  }
}
