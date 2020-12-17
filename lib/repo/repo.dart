import 'package:app/model/noti.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class NoticeRepo {
  Future<List<Noti>> getNotices();
}

class NoticeReopImpl implements NoticeRepo {
  var url = 'http://10.0.2.2:8000/api/noti/';
  @override
  Future<List<Noti>> getNotices() async {
    var noti = <Noti>[];
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var notice = jsonDecode(response.body);
      for (var item in notice) {
        noti.add(Noti.fromJson(item));
      }
    } else {
      throw Exception();
    }
    return noti;
  }
}

abstract class SearchRepo {
  Future<List<Noti>> searchNotice(String query);
}

class SearchRepoImpl implements SearchRepo {
  @override
  Future<List<Noti>> searchNotice(String query) async {
    var url = 'http://10.0.2.2:8000/api/noti/?search=${query}';
    var noti = <Noti>[];
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var notice = jsonDecode(response.body);
      for (var item in notice) {
        noti.add(Noti.fromJson(item));
      }
    } else {
      throw Exception();
    }
    return noti;
  }
}
