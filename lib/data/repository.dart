import 'package:http/http.dart' as http;

const String accessKey = 'Y3zW8WA9mZRtTgxBkBRnI_WPLYN9zF2MfadKmQ9U4vw';

class ImageRepository {
  Future<http.Response> getImages() async {
    return await http.get(Uri.parse(
        'https://api.unsplash.com/search/photos?per_page=30&query=nature&order_by=relevant&client_id=$accessKey'));
  }
}
