import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = false;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              expandedHeight: 300,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Container(
                      height: 300,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.grey.withOpacity(0.5), BlendMode.dstATop),
                          image:
                              const NetworkImage("https://picsum.photos/166"),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "https://picsum.photos/166",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Naruto Siuden",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Uden Marfuden",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      "Berlanjut" == 'Berlanjut'
                                          ? Icon(Icons.schedule_rounded,
                                              size: 17)
                                          : Icon(Icons.check, size: 17),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Berlanjut",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.white,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: const Text(
                  "Awalnya begini terus jadi ini Awalnya begini terus jadi ini Awalnya begini terus jadi ini Awalnya begini terus jadi ini Awalnya begini terus jadi ini Awalnya begini terus jadi ini ",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(
                  top: 16,
                  right: 16,
                  left: 16,
                ),
                title: const Text(
                  'Chapter',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.sort_by_alpha,
                  ),
                  onPressed: () {
                    // modelView.sortChapter(id);
                  },
                ),
              ),
              isEmpty == true
                  ? Container(
                      margin: const EdgeInsets.only(top: 150),
                      child: const Text(
                        'Chapter belum tersedia',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Flexible(
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 100,
                          itemBuilder: (ctx, i) {
                            return InkWell(
                              onTap: () {
                                // Navigator.pushNamed(
                                //   context,
                                //   ChapterView.routeName,
                                //   arguments: {
                                //     'idNovel': id,
                                //     'idChapter':
                                //         modelView.novels[id].chapter[i].id,
                                //   },
                                // );
                              },
                              child: const ListTile(
                                title: Text("Judul chapter"),
                              ),
                            );
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
