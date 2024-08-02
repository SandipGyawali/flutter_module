import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_m/model/book_model.dart';
import 'package:flutter_m/provider/dio_provider.dart';
import 'package:flutter_m/utils/flush_status.dart';
import 'package:flutter_m/utils/utils.dart';

class BookProvider with ChangeNotifier {
  Dio dio = DioProvider.dio;

  List<BookModel> _bookList = []; //empty array initialization

  List<BookModel> get bookList => _bookList;

  void setBookList(List<BookModel> data) {
    _bookList = data;
    notifyListeners();
  }

  Future<void> getRandomBookList(BuildContext context) async {
    try {
      final baseUrl = dotenv.env["OPEN_LIBRARY_URL"];
      final endUrl = "$baseUrl?q=the+lord+of+the+rings";

      final response = await dio.get(endUrl);

      final List<dynamic> docs = response.data["docs"];

      List<BookModel> result = docs
          .map((data) {
            return BookModel.fromJson(data);
          })
          .take(10)
          .toList();

      _bookList = result;
      notifyListeners();
    } catch (err, s) {
      print("------>> err: $err, --------> stack: $s");
      Utils.flushBarMessage(err.toString(), context, STATUS.ERROR);
    }
  }

  Future<void> searchBookInput(BuildContext context, String input) async {
    try {
      _bookList = [];
      final baseUrl = dotenv.env["OPEN_LIBRARY_URL"];
      final endUrl = "$baseUrl?q=${input.split(" ").join("+")}";

      final response = await dio.get(endUrl);

      final List<dynamic> docs = response.data["docs"];

      List<BookModel> result = docs
          .map((data) {
            return BookModel.fromJson(data);
          })
          .take(10)
          .toList();

      _bookList = result;
      notifyListeners();
    } catch (err, s) {
      print("------>> err: $err, --------> stack: $s");
      Utils.flushBarMessage(err.toString(), context, STATUS.ERROR);
    }
  }
}
