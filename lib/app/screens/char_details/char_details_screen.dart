import 'package:flutter/material.dart';
import 'package:marvel/app/global_controller.dart';
import 'package:marvel/app/screens/home/model/characters_model.dart';
import 'package:get/get.dart';

class CharDetailsScreen extends StatelessWidget {
  final Result char;
  const CharDetailsScreen({Key? key, required this.char}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffec1d24),
        title: Text(
          char.name!,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: Get.width * 9,
              child: Image.network(
                GlobalController.i.validImage(
                    char.thumbnail!.path, char.thumbnail?.extension),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    char.description!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Comics",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.all(0.0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: char.comics?.returned,
                    itemBuilder: (context, index) {
                      var comic = char.comics?.items?[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(comic!.name!),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Series",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.all(0.0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: char.series?.returned,
                    itemBuilder: (context, index) {
                      var series = char.series?.items?[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(series!.name!),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Stories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.all(0.0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: char.stories?.returned,
                    itemBuilder: (context, index) {
                      var stories = char.stories?.items?[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          stories!.name!,
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
