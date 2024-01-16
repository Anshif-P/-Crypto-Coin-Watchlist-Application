class CoinModel {
  String name;
  String symbol;
  String image;
  num rank;
  num price;

  num priceChange_24h;

  CoinModel({
    required this.name,
    required this.symbol,
    required this.image,
    required this.rank,
    required this.price,
    required this.priceChange_24h,
  });
  factory CoinModel.fromJson(json) {
    return CoinModel(
      name: json['name'],
      symbol: json['symbol'],
      image: json['image'],
      rank: json['market_cap_rank'],
      price: json['current_price'],
      priceChange_24h: json["price_change_24h"],
    );
  }
}
