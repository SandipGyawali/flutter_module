import 'package:flutter/material.dart';
import 'package:flutter_m/components/input_field.dart';
import 'package:flutter_m/model/news_list_model.dart';
import 'package:flutter_m/provider/news_provider.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final TextEditingController _searchFieldController =
      TextEditingController(text: "usa");

  @override
  void initState() {
    super.initState();
    final newsListProvider = Provider.of<NewsProvider>(context, listen: false);
    newsListProvider.getNewsListEndpoint(context,
        searchField: _searchFieldController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _searchFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(builder: (context, newsListProvider, child) {
      List<NewsListModel> newsList = newsListProvider.getNewsList;

      return SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  padding: const EdgeInsets.only(
                    top: 0,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Hello,",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 21,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Text(
                        "Today's News",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InputField(
                        label: "",
                        obscure: false,
                        hintText: "Search...",
                        controller: _searchFieldController,
                        suffixIcon: const HugeIcon(
                          icon: HugeIcons.strokeRoundedSearch02,
                          color: Colors.black54,
                          size: 24.0,
                        ),
                        onInputSubmit: () {
                          print("------>> onInputSubmit");
                          newsListProvider.setNewsList([]);
                          newsListProvider.getNewsListEndpoint(
                            context,
                            searchField: _searchFieldController.text,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            newsList.isEmpty
                ? const Center(
                    child: Column(
                    children: [
                      SizedBox(height: 100),
                      CircularProgressIndicator()
                    ],
                  ))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        ListView.builder(
                          itemCount: 15,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 15,
                              ),
                              margin: const EdgeInsets.only(
                                top: 8,
                                right: 20,
                                left: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white70,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    color: Colors.grey.shade300,
                                    spreadRadius: 3,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Author: ${newsList[index].author}",
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          "Title: ${newsList[index].title}",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Image.network(
                                    "${newsList[index].urlToImage}",
                                    width: 80,
                                    height: 80,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.network(
                                        "https://cdn-icons-png.flaticon.com/512/1548/1548682.png",
                                        width: 60,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
          ],
        ),
      );
    });
  }
}
