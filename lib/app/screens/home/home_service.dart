import 'package:flutter/material.dart';
import 'package:marvel/app/screens/home/model/characters_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class HomeService {
  //metodo que busca na api
  Future<CharactersModel?> getCharacters(int offset) async {
    var characters = CharactersModel();
    var dio = Dio();
    var _publicKey = '5baf9b7eda23eae943822628589ca81b';
    var _privateKey = '9e9dd24afd86b25040a8b88dab6028b86627355e';
    var timeStamp = DateTime.now().millisecondsSinceEpoch;
    var text = timeStamp.toString() + _privateKey + _publicKey;
    var crypt = md5.convert(utf8.encode(text)).toString();

    var response = await dio.get(
      'http://gateway.marvel.com/v1/public/characters?offset=$offset&ts=$timeStamp&apikey=$_publicKey&hash=$crypt',
    );

    if (response.statusCode == 200) {
      characters = CharactersModel.fromJson(response.data);
    } else {
      Get.snackbar(
        "",
        "",
        snackPosition: SnackPosition.BOTTOM,
        titleText: Center(
          child: Text("${response.statusCode} - Falha ao buscar dados"),
        ),
      );
    }

    return characters;
  }
}
