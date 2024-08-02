class BookModel {
  final List<String>? authorKey;
  final List<String>? authorName;
  final String? ebookAccess;
  final int? ebookCountI;
  final int? editionCount;
  final List<String>? editionKey;
  final int? firstPublishYear;
  final bool? hasFulltext;
  final List<String>? isbn;
  final String? key;
  final List<String>? language;
  final int? lastModifiedI;
  final bool? publicScanB;
  final List<String>? publishDate;
  final List<int>? publishYear;
  final List<String>? publisher;
  final List<String>? seed;
  final String? title;
  final String? titleSuggest;
  final String? titleSort;
  final String? type;
  final List<String>? publisherFacet;
  final double? version;
  final List<String>? authorFacet;
  final int? coverI; // Add this field for cover image ID
  final List<String>? firstSentence;
  final double? ratingAverage;

  BookModel({
    this.ratingAverage,
    this.firstSentence,
    this.authorKey,
    this.authorName,
    this.ebookAccess,
    this.ebookCountI,
    this.editionCount,
    this.editionKey,
    this.firstPublishYear,
    this.hasFulltext,
    this.isbn,
    this.key,
    this.language,
    this.lastModifiedI,
    this.publicScanB,
    this.publishDate,
    this.publishYear,
    this.publisher,
    this.seed,
    this.title,
    this.titleSuggest,
    this.titleSort,
    this.type,
    this.publisherFacet,
    this.version,
    this.authorFacet,
    this.coverI,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
      authorKey: json["author_key"] == null
          ? []
          : List<String>.from(json["author_key"]!.map((x) => x)),
      authorName: json["author_name"] == null
          ? []
          : List<String>.from(json["author_name"]!.map((x) => x)),
      ebookAccess: json["ebook_access"],
      ebookCountI: json["ebook_count_i"],
      editionCount: json["edition_count"],
      editionKey: json["edition_key"] == null
          ? []
          : List<String>.from(json["edition_key"]!.map((x) => x)),
      firstPublishYear: json["first_publish_year"],
      hasFulltext: json["has_fulltext"],
      isbn: json["isbn"] == null
          ? []
          : List<String>.from(json["isbn"]!.map((x) => x)),
      key: json["key"],
      language: json["language"] == null
          ? []
          : List<String>.from(json["language"]!.map((x) => x)),
      lastModifiedI: json["last_modified_i"],
      publicScanB: json["public_scan_b"],
      publishDate: json["publish_date"] == null
          ? []
          : List<String>.from(json["publish_date"]!.map((x) => x)),
      publishYear: json["publish_year"] == null
          ? []
          : List<int>.from(json["publish_year"]!.map((x) => x)),
      publisher: json["publisher"] == null
          ? []
          : List<String>.from(json["publisher"]!.map((x) => x)),
      seed: json["seed"] == null
          ? []
          : List<String>.from(json["seed"]!.map((x) => x)),
      title: json["title"],
      titleSuggest: json["title_suggest"],
      titleSort: json["title_sort"],
      type: json["type"],
      publisherFacet: json["publisher_facet"] == null
          ? []
          : List<String>.from(json["publisher_facet"]!.map((x) => x)),
      version: json["_version_"]?.toDouble(),
      authorFacet: json["author_facet"] == null
          ? []
          : List<String>.from(json["author_facet"]!.map((x) => x)),
      coverI: json["cover_i"], // Add this line
      firstSentence: json["first_sentence"] == null
          ? []
          : List<String>.from(json["first_sentence"]!.map((x) => x)),
      ratingAverage: json["ratings_average"]);

  Map<String, dynamic> toJson() => {
        "author_key": authorKey == null
            ? []
            : List<dynamic>.from(authorKey!.map((x) => x)),
        "author_name": authorName == null
            ? []
            : List<dynamic>.from(authorName!.map((x) => x)),
        "ebook_access": ebookAccess,
        "ebook_count_i": ebookCountI,
        "edition_count": editionCount,
        "edition_key": editionKey == null
            ? []
            : List<dynamic>.from(editionKey!.map((x) => x)),
        "first_publish_year": firstPublishYear,
        "has_fulltext": hasFulltext,
        "isbn": isbn == null ? [] : List<dynamic>.from(isbn!.map((x) => x)),
        "key": key,
        "language":
            language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
        "last_modified_i": lastModifiedI,
        "public_scan_b": publicScanB,
        "publish_date": publishDate == null
            ? []
            : List<dynamic>.from(publishDate!.map((x) => x)),
        "publish_year": publishYear == null
            ? []
            : List<dynamic>.from(publishYear!.map((x) => x)),
        "publisher": publisher == null
            ? []
            : List<dynamic>.from(publisher!.map((x) => x)),
        "seed": seed == null ? [] : List<dynamic>.from(seed!.map((x) => x)),
        "title": title,
        "title_suggest": titleSuggest,
        "title_sort": titleSort,
        "type": type,
        "publisher_facet": publisherFacet == null
            ? []
            : List<dynamic>.from(publisherFacet!.map((x) => x)),
        "_version_": version,
        "author_facet": authorFacet == null
            ? []
            : List<dynamic>.from(authorFacet!.map((x) => x)),
        "cover_i": coverI, // Add this line
        "first_sentence": firstSentence == null
            ? []
            : List<dynamic>.from(firstSentence!.map((x) => x)),
        "ratings_average": ratingAverage
      };
}
