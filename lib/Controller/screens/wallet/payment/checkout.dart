import 'dart:convert';

import 'package:sportpal/Controller/screens/wallet/payment/PaymentCard.dart';
import 'package:http/http.dart' as http;


class CheckoutPayment{


  static const _tokenUrl = 'https://api.sandbox.checkout.com/tokens';
  static const _paymentUrl = 'https://api.sandbox.checkout.com/payments';

  static const String _publicKey = 'pk_test_31e1ccfe-59f6-4958-a179-bc7caf8a230d';
  static const String _secretKey = 'sk_test_23b29acb-76a8-405a-a878-6ce4c0de3d05';

  static const Map<String,String> _tokenHeader = {
    'Content-type' : 'Application/json',
    'Authorization' : _publicKey
  };

  static const Map<String,String> _paymentHeader = {
    'Content-type' : 'Application/json',
    'Authorization' : _secretKey
  };




  Future<String> _getToken(PaymentCard card) async {
    Map<String,String> b = {
      'type' : 'card',
      'number' : card.number,
      'expiry_month' : card.expiry_month,
      'expiry_year' : card.expiry_year,

    };
    http.Response response = await http.post(Uri.parse(_tokenUrl),headers: _tokenHeader, body:jsonEncode(b) );

    switch(response.statusCode){
      case 201:
        var data = jsonDecode(response.body);
        return data['token'];
        break;
      default:
        throw Exception("Card invalid");
        break;
    }

  }

  Future<bool> makePayment(PaymentCard card ,int amount)async{
    String token = await _getToken(card);
    print(token);

    Map<String,dynamic> b = {
      'source' : {
        'type' : 'token',
        'token' : token
      },
      'amount' : amount,
      'currency' : 'tnd'
    };

    http.Response response = await http.post(Uri.parse(_paymentUrl),headers: _paymentHeader,body: jsonEncode(b));

    switch (response.statusCode){
      case 201:
        var data = jsonDecode(response.body);
        print(data['response_summary']);
        return true;
        break;
      default:
        throw Exception('Payment failed ! please try again');
        break;
    }



  }
}