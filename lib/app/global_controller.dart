import 'package:get/get.dart';
import 'package:marvel/app/screens/home/model/characters_model.dart';

class GlobalController extends GetxController {
  static GlobalController get i => Get.find();

  //metodo que valida e retorna a url da imagem concatenada com a extensão
  String validImage(String? path, Extension? ext) {
    if (path != null && path != '' && ext != null) {
      return "$path.${ext.toString().split('.').last.toLowerCase()}";
    } else {
      return "https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png";
    }
  }
}
