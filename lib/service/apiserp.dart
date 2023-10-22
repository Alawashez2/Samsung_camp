import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:samsung_camp/key/key.dart';

class GetSerper {
  Future<String?> getImage(String item) async {
    var headers = {'X-API-KEY': apiKey, 'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('https://google.serper.dev/images'));
    request.body = json.encode({"q": item});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final elementJson = await response.stream.bytesToString();
    final decodeElement = json.decode(elementJson);

    var image = decodeElement['images'][0]['imageUrl'];

    // final List image2 = decodeElement['images'];

    // for (var element in image2) {
    //   if (!(element['title']!.contains("Wiki"))) {
    //     return element['imageUrl'];
    //   }
    // }
    return image;
  }
}
