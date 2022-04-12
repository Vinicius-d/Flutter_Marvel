import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/global_controller.dart';
import 'package:marvel/app/screens/home/adapter/card_adapter.dart';
import 'package:marvel/app/screens/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put(HomeController());
  var globalController = Get.put(GlobalController());
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
                          return CardAdapter(char: characters);
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
