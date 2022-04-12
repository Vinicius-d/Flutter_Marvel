import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/screens/char_details/char_details.dart';
import 'package:marvel/app/screens/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put(HomeController());
  @override
  void initState() {
    controller.getCharacters();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffec1d24),
          title: Center(
            child: Image.asset(
              'assets/images/marvel-logo.png',
              scale: 30,
              fit: BoxFit.fill,
            ),
          ),
        ),
        body: !controller.loading.value
            ? NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (!controller.loadingMore.value &&
                      scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                    var offset =
                        (controller.characters.value.data?.offset)! + 20;
                    controller.loadingMore.value = true;
                    controller.getCharacters(offset: offset);
                  }
                  return true;
                },
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.listCharacters.length,
                        itemBuilder: (context, index) {
                          var characters = controller.listCharacters[index];
                          var image =
                              "${controller.listCharacters[index].thumbnail?.path}.";
                          var ext = controller
                              .listCharacters[index].thumbnail?.extension
                              .toString()
                              .split('.')
                              .last
                              .toLowerCase();
                          return SizedBox(
                            width: 100,
                            height: 150,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => CharDetails(char: characters),
                                );
                              },
                              child: Card(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      height: 150,
                                      child: Image.network(
                                        image + ext!,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        top: 15,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 200,
                                            child: Text(
                                              characters.name ??
                                                  "Título não disponível",
                                              maxLines: 2,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              width: 200,
                                              child: Text(
                                                characters.description ??
                                                    "Descrição nao disponível",
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: controller.loadingMore.value,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
