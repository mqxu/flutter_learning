// 引入第三方库
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';

void main() async {
  var httpsUri = Uri(
    scheme: 'https',
    host: 'news-at.zhihu.com',
    path: '/api/3/stories/latest',
  );
  var response = await http.get(httpsUri);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
  } else {
    print("Request failed with status: ${response.statusCode}.");
  }
  print(formatDate(DateTime(2022, 06, 22), [yyyy, '-', mm, '-', dd]));
}
