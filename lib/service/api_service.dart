// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:joke_app/models/joke_model.dart';
import 'package:joke_app/utility/api_urls.dart';
import 'package:joke_app/utility/utils.dart';

class ApiService{
  static Future<Joke?> getJoke(BuildContext context) async{
    try{
      var response= await get(Uri.parse(ApiUrls.getJokesApi));
      Utils.prints("response", response.body);
      return Joke.fromJson(json.decode(response.body));
    }catch(e){
      Utils.prints("response", e.toString());
      Utils.getSnackBar(context,  e.toString());
    }
    return null;
  }
}