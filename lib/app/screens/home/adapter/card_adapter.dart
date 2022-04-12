import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/app/global_controller.dart';
import 'package:marvel/app/screens/char_details/char_details_screen.dart';
import 'package:marvel/app/screens/home/model/characters_model.dart';

class CardAdapter extends StatelessWidget {
  final Result char;
  const CardAdapter({Key? key, required this.char}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 150,
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => CharDetailsScreen(char: char),
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
                  GlobalController.i.validImage(
                      char.thumbnail?.path, char.thumbnail?.extension),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        char.name!.isEmpty
                            ? "Título não disponível"
                            : char.name!,
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
                          char.description!.isEmpty
                              ? "Descrição não disponível"
                              : char.description!,
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
  }
}
