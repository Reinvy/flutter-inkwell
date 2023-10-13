import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inkwell/views/detail/detail_screen.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  List listnya = [
    "1",
    "2",
    "3",
  ];
  int gridViewLength = 20;
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          if (notification.metrics.pixels ==
              notification.metrics.maxScrollExtent) {
            if (listnya.length > gridViewLength) {
              if (gridViewLength + 20 >= listnya.length) {
                setState(() {
                  gridViewLength = listnya.length;
                });
              } else {
                setState(() {
                  gridViewLength += 20;
                });
              }
            }
            return true;
          }
        }
        return true;
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(8),
              ),
            ),
            title: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                hintText: "Search titles",
                prefixIcon: const Icon(CupertinoIcons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GridView.builder(
                        padding: const EdgeInsets.all(20),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 6 / 9),
                        itemCount: gridViewLength,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              final navigator =
                                  Navigator.of(context, rootNavigator: true);
                              navigator.push(
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://picsum.photos/id/1000/200/300"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  "The Song Of Flowers",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Text(
                                  "Madeline Miller",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                listnya.length > gridViewLength
                    ? const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
