import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/article.dart';
import '../services/news_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Article>> getData() async {
    List<Article> articles = await NewsServices().getNews(
        path: ApiConstant.baseUrl + ApiConstant.newsEndpoint,
        query: {"apiKey": ApiConstant.apiKey, "country": "us"});
    return articles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "News",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Cloud",
                  style: TextStyle(
                      color: Color(0xAA333EFF), fontWeight: FontWeight.bold , letterSpacing: 1.5),
                ),
              ],
            )),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xAA333EFF),
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Error"));
            }

            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                                snapshot.data![index].urlToImage,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover)),
                        const SizedBox(
                          height: 9,
                        ),
                        Text(
                          snapshot.data![index].title,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data![index].content,
                          maxLines: 2,
                          style:
                          const TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                  );
                });
          },
        ));
  }
}