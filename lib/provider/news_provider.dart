import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_m/model/news_list_model.dart';
import 'package:flutter_m/provider/dio_provider.dart';
import 'package:flutter_m/utils/flush_status.dart';
import 'package:flutter_m/utils/utils.dart';

class NewsProvider extends ChangeNotifier {
  Dio dio = DioProvider.dio;

  List<NewsListModel> _newsList = [];
  List<NewsListModel> _filterData = [];

  get getNewsList => _newsList;
  List<NewsListModel> get filterData => _filterData;

  void setNewsList(List<NewsListModel> data) {
    print("------>> NewsList model data: $data");
    _newsList = data;
    notifyListeners();
  }

  Future<void> getNewsListEndpoint(BuildContext context,
      {String searchField = "tesla"}) async {
    try {
      final url = dotenv.env["NEWS_API_URL"];
      final apiKey = dotenv.env["NEWS_API_KEY"];

      final endPointUrl = "$url?q=$searchField&apiKey=$apiKey";

      final response = await dio.get(endPointUrl);

      final decodedResponse =
          newsListModelFromJson(json.encode(response.data["articles"]));

      // filter data
      _filterData = decodedResponse.where((data) {
        return data.author != null &&
            (data.title != 'Removed' || data.title != null);
      }).toList();

      _newsList = _filterData;
      Utils.flushBarMessage("Data fetch successful", context, STATUS.SUCCESS);
      notifyListeners();
    } catch (err, s) {
      print("--->>$err  --->>stack: $s");
      Utils.flushBarMessage(err.toString(), context, STATUS.ERROR);
    }
  }
}
