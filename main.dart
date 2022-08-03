import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

void main(List<String> args) async {
  final url = Uri.parse("https://www.amazon.com/s?k=iphone");
  final response = await http.get(url);
  dom.Document html = dom.Document.html(response.body);

  // Extraindo o titulo da página
  final titles = html
      .querySelectorAll('h2 > a > span')
      .map((e) => e.innerHtml.trim())
      .toList();

  // Extraindo a URL
  final urls = html
      .querySelectorAll('h2 > a')
      .map((e) => 'https://amazon.com/${e.attributes['href']}')
      .toList();

  // Extraindo Imagens
  final urlImages = html
      .querySelectorAll('span > a > div > img')
      .map((e) => 'https://amazon.com/${e.attributes['src']}')
      .toList();

  print("Counter: ${titles.length}");
  for (int j = 0; j < titles.length; j++) {
    // print("${titles[j]}, ${urls[j]}");
    print(urlImages[j]);
  }
}
