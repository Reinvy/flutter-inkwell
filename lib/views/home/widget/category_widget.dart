import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Categories",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 100,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Wrap(
                spacing: 12,
                runSpacing: 12,
                direction: Axis.vertical,
                children: [
                  for (int i = 0; i < 10; i++)
                    GestureDetector(
                      onTap: () {
                        print(i);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: i == 0 ? Colors.blue : Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor:
                                  i == 0 ? Colors.white : Colors.grey,
                              backgroundImage: const NetworkImage(
                                  "https://picsum.photos/id/1000/200/300"),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Romance",
                              style: TextStyle(
                                color: i == 0 ? Colors.white : Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
