class Quote {
  final String quote;
  final String author;

  Quote({required this.quote, required this.author});

  @override
  String toString() {
    return "quote:$quote, author:$author";
  }
}