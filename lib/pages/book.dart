import 'package:flutter/material.dart';
import 'package:flutter_m/components/input_field.dart';
import 'package:flutter_m/model/book_model.dart';
import 'package:flutter_m/provider/book_provider.dart';
import 'package:flutter_m/routes/route_consts.dart';
import 'package:flutter_m/utils/flush_status.dart';
import 'package:flutter_m/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final TextEditingController _searchFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    bookProvider.getRandomBookList(context);
  }

  @override
  void dispose() {
    super.dispose();
    _searchFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(builder: (context, bookProvider, child) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    "Ola,",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 21,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Text(
                    "Search Books...",
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
                    onInputSubmit: () {
                      String input = _searchFieldController.text;
                      if (input.isEmpty) {
                        Utils.flushBarMessage(
                            "Input box cannot be empty", context, STATUS.ERROR);
                      } else {
                        bookProvider.searchBookInput(context, input);
                      }
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: bookProvider.bookList.isEmpty
                  ? Alignment.center
                  : Alignment.topCenter,
              child: bookProvider.bookList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: bookProvider.bookList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          List<BookModel> d = bookProvider.bookList;

                          return InkWell(
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                MyAppRouteConstants.bookRoute,
                                extra: d[index],
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                                bottom: 8,
                                left: 20,
                                right: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 8,
                                  left: 10,
                                  right: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        "https://covers.openlibrary.org/b/id/${d[index].coverI}-M.jpg",
                                        height: 80,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${d[index].title}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  "${d[index].authorName?[0]}",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow.shade600,
                                                size: 18,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                "${d[index].ratingAverage != null ? d[index].ratingAverage!.toStringAsFixed(2) : "3.0"}",
                                              )
                                            ],
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
            ),
            const SizedBox(height: 20)
          ],
        ),
      );
    });
  }
}
