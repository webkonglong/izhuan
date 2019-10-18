
import 'dart:convert';
import 'dart:io';

dynamic ajax (dynamic options) async {
  if (options['type'] == 'get') {
    options['data'].forEach((k, y) {
      options['url'] = "${options['url']}${options['url'].contains("?") ? "&" : "?"}${k}=${y}";
    });
    print(options['url']);
    var httpClient = new HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse(options['url']));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        if (data['content'] is String) {
          options['error'](data['content']);
        } else {
          options['success'](data['content']);
        }
      }
    } catch (exception) {
      options['error'](exception);
      print("server error");
    }
  }
}