import 'package:get/get.dart';
import 'package:marvel/app/screens/home/home_service.dart';
import 'package:marvel/app/screens/home/model/characters_model.dart';

class HomeController extends GetxController {
  final _service = HomeService();
  var characters = CharactersModel().obs;
  var listCharacters = <Result>[].obs;
  var loading = true.obs;
  var loadingMore = false.obs;
  getCharacters({int offset = 0}) async {
    try {
      var result = await _service.getCharacters(offset);
      characters.value.data = result?.data;

      for (var item in characters.value.data!.results!) {
        listCharacters.add(item);
      }

      loading.value = false;
      loadingMore.value = false;
    } catch (e) {
      loading.value = false;
      loadingMore.value = false;
      print(e.toString());
    }
  }
}
