import 'package:flutter/material.dart';
import 'package:flutter_m/model/book_model.dart';

class IndividualBookPage extends StatefulWidget {
  final BookModel bookDetail;
  const IndividualBookPage({
    required this.bookDetail,
    super.key,
  });

  @override
  State<IndividualBookPage> createState() => _IndividualBookPageState();
}

class _IndividualBookPageState extends State<IndividualBookPage> {
  @override
  Widget build(BuildContext context) {
    BookModel bookModel = widget.bookDetail;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "Book Details",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    "https://covers.openlibrary.org/b/id/${bookModel.coverI}-L.jpg",
                    height: 200,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  bookModel.title.toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${bookModel.authorName?[0]}",
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(width: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow.shade600,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${bookModel.ratingAverage != null ? bookModel.ratingAverage!.toStringAsFixed(2) : "3.0"}",
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // description
                Text(
                  bookModel.firstSentence!.map((data) => data).toString(),
                  // style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
