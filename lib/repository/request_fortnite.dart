import 'dart:convert';
import 'package:stats_fortnite/model/fortnite_model.dart';
import 'package:http/http.dart' as http;

class FortniteRequest {
  Future<FortniteModel> dataFortRequest(String value, String platform) async {
    var endpoint = Uri.https(
      'api.fortnitetracker.com',
      '/v1/profile/$platform/$value',
    );

    Map<String, String> headers = {
      'TRN-Api-Key': 'e67b01a8-67cf-4372-b9d8-1d48a55c6d1a'
    };

    final response = await http.get(endpoint, headers: headers);
    if (response.statusCode == 200) {
      //01
      var finalData = FortniteModel.fromJson(
        jsonDecode(response.body),
      );
      return finalData;
    } else {
      throw Exception('Failed to load.');
    }
  }

  /*
  OBS: 01 - Minha api, está retornando um [Json(Map)] direto, sem estar dentro de nenhum [list],
  por isso só preciso passa o [jsonDecode(response.body)] para o [FortniteModel.fromJson].
  Se estivesse me retornando dentro de um List[], teria de tratar o [Decode] dessa forma.
  
  => users = (data"Decode" as List).map((json) {
        return FortniteModel.fromJson(json);
      }).toList();
  */
}
