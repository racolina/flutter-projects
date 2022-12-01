import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class RemoteService {
  Future<Map<String, dynamic>?> getProduct() async {
    var client = http.Client();
    try {
      var uri =
          Uri.parse('http://localhost:8080/GxPData/product/list/pageable');
      Map<String, String> headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        "size": 10,
        "page": 0,
        "filter": {"productType": 6}
      });
      var response = await client.post(uri, headers: headers, body: body);
      if (response.statusCode == 200) {
        var json = response.body;
        // var content =
        //     jsonDecode(json)['data']['productPaginationResponse']['content'];

        return jsonDecode(json);
        ;
      }
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
    } finally {
      client.close();
    }
  }
}
