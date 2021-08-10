import 'package:get/get.dart';
import '../Data/GitRepositorio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  var apiOptions = {"baseNudeUrl": "api.github.com", "apiUri": ""};

  Api();

  Future<List<GitRepositorio>> getUserRepos(String username) async {
    var request = await http.get(Uri.https(apiOptions["baseNudeUrl"]!,
        "/users/$username/repos", {"sort": "stars", "order": "desc"}));

    if (request.statusCode != 200) {
      return List<GitRepositorio>.empty();
    }

    var vJson = json.decode(request.body);

    List<GitRepositorio> retorno = List<GitRepositorio>.from(
        vJson.map((model) => GitRepositorio.fromJson(model)));

    return retorno;
  }
}
