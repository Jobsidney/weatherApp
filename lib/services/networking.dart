import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkingHelper {
  NetworkingHelper(this.url);

  final String url;

  Future getData() async {
    // var decodedResponse;
    var response;
    response = await http.get(Uri.parse(url));
    print('${response.body}');
    if (response.statusCode == 200) {
      var data = await response.body;

      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
