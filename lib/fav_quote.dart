import 'package:hive/hive.dart';

part 'fav_quote.g.dart';

@HiveType(typeId: 1)
class FavQuote {
  @HiveField(0)
  String quote;

  @HiveField(1)
  String author;

  FavQuote({required this.quote, required this.author});
}
