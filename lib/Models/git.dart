import 'package:get/get.dart';
import '../Data/GitRepositorio.dart';
import '../Settings/api.dart';
import 'dart:convert';

class Git {
  Git();

  Future<List<GitRepositorio>> getRepository(String username) async {
    Api apiGit = new Api();
    List<GitRepositorio> lstRepositorios = await apiGit.getUserRepos(username);
    return lstRepositorios;
  }
}
