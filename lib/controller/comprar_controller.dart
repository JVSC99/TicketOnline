import 'dart:convert';
import 'package:ticket_online/pages/components/saldo.dart';
import 'package:ticket_online/repositories/aluno_repository.dart';
import 'package:pay/pay.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';
import 'package:http/http.dart' as http;

class ComprarController {

  Future<int> buscarId() async {
    String uri = 'https://api.mercadopago.com/checkout/preferences?access_token=TEST-4453779879566105-041022-7c4448f2d15aa1b16d98ab85663d936e-316925024';
    
    var response = await http.post(Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, Object>{
          'items': [
            {
              "title": "Refeição RU",
              "description": "Refeição RU",
              "quantity": 1,
              "currency_id": "/BRL",
              "unit_price": 3.50
            }
          ],
          "payer": {"email": "payer@email.com"}
        }));

    final json = jsonDecode(response.body)['id'];
    
    String id = json.toString();

    // PaymentResult result = await MercadoPagoMobileCheckout.startCheckout(
    //   "TEST-cab429de-82f7-49a2-8309-6c6b7b5aea5e",
    //   id,
    // );

    return 1;
  }
  
}