import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m/model/photos_model.dart';
import 'package:flutter_m/provider/dio_provider.dart';
import 'package:flutter_m/utils/flush_status.dart';
import 'package:flutter_m/utils/utils.dart';

class PhotoListProvider extends ChangeNotifier {
  Dio dio = DioProvider.dio;

  List<PhotoListModel> _photoList = [];

  List<PhotoListModel> photoList() => _photoList;

  Future<void> getPhotoList(BuildContext context) async {
    try {
      const url = "https://jsonplaceholder.typicode.com/photos";

      final response = await dio.get(url);
      print('------->> photoModel data: ${response.data}');

      final decodedResponse =
          photoListModelFromJson(json.encode(response.data));

      _photoList = decodedResponse;
      notifyListeners();
      Utils.flushBarMessage("Data fetch successful", context, STATUS.SUCCESS);
    } catch (err, s) {
      print("---->stack: $s");
      Utils.flushBarMessage(err.toString(), context, STATUS.ERROR);
    }
  }
}
